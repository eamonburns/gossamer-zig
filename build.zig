const std = @import("std");

const uf2 = @import("uf2");

pub const Board = enum {
    sensorwatch_blue,
    sensorwatch_green,
    sensorwatch_pro,
    sensorwatch_red,
    // TODO: More boards

    pub fn chip(b: Board) []const u8 {
        return switch (b) {
            .sensorwatch_blue,
            .sensorwatch_green,
            .sensorwatch_pro,
            .sensorwatch_red,
            => "saml22",
        };
    }

    pub fn ldScript(b: Board) []const u8 {
        return switch (b) {
            .sensorwatch_blue,
            .sensorwatch_green,
            .sensorwatch_pro,
            .sensorwatch_red,
            => "saml22n18",
        };
    }

    // TODO: Per-board settings? (Should `Board` be a tagged union?)
    pub fn addDefines(b: Board, mod: *std.Build.Module, display: enum { omitted, custom, classic }) void {
        switch (b) {
            .sensorwatch_blue,
            .sensorwatch_green,
            .sensorwatch_pro,
            .sensorwatch_red,
            => {
                mod.addCMacro("__SAML22J18A__", "1");
                switch (display) {
                    .custom => mod.addCMacro("FORCE_CUSTOM_LCD", "1"),
                    .classic => mod.addCMacro("FORCE_CLASSIC_LCD", "1"),
                    .omitted => {},
                }
            },
        }
    }
};

pub const FirmwareOptions = struct {
    /// App root module
    root_module: *std.Build.Module,

    emscripten: bool = false,
};

pub fn addFirmware(gossamer_dep: *std.Build.Dependency, options: FirmwareOptions) std.Build.LazyPath {
    const project = gossamer_dep.builder;

    options.root_module.resolved_target = getTarget(project, options.emscripten);
    options.root_module.optimize = .ReleaseSmall;

    options.root_module.addImport("gossamer", gossamer_dep.module("gossamer"));
    const firmware_elf = project.addExecutable(.{
        .name = "firmware.elf",
        .root_module = options.root_module,
    });

    if (!options.emscripten) {
        firmware_elf.setLinkerScript(gossamer_dep.namedLazyPath("linker_script"));
    }

    // Convert elf to uf2

    const elf2uf2_exe = gossamer_dep.artifact("elf2uf2");
    const elf2uf2_cmd = project.addRunArtifact(elf2uf2_exe);

    elf2uf2_cmd.addArg("--elf-path");
    elf2uf2_cmd.addArtifactArg(firmware_elf);

    elf2uf2_cmd.addArg("--output-path");
    return elf2uf2_cmd.addOutputFileArg("firmware.uf2");
}

pub fn getTarget(b: *std.Build, emscripten: bool) std.Build.ResolvedTarget {
    return if (emscripten) {
        @panic("TODO: emscripten");
    } else b.resolveTargetQuery(.{
        .cpu_arch = .thumb,
        .os_tag = .freestanding,
        .abi = .eabi,
        .cpu_model = .{
            .explicit = &std.Target.arm.cpu.cortex_m0plus,
        },
    });
}

pub fn build(b: *std.Build) void {
    const optimize: std.builtin.OptimizeMode = .ReleaseSmall;

    const emscripten = b.option(bool, "emscripten", "Build for emscripten (default: false)") orelse false;
    const board = b.option(Board, "board", "Board to build for") orelse {
        std.log.err("board option is required", .{});
        return;
    };

    const target = getTarget(b, emscripten);

    const upstream_dep = b.dependency("upstream", .{});
    const foundationlibc_dep = b.dependency("foundationlibc", .{
        .target = target,
        .optimize = optimize,
    });

    const gossamer_mod = b.addModule("gossamer", .{
        .root_source_file = b.path("src/gossamer.zig"),
    });
    // Definitions provided within this repo (like `malloc`)
    gossamer_mod.addIncludePath(b.path("include/"));

    gossamer_mod.linkLibrary(foundationlibc_dep.artifact("foundation"));
    board.addDefines(gossamer_mod, .omitted); // TODO: Select display?
    gossamer_mod.addIncludePath(upstream_dep.path("common/"));

    // TODO: Should this be inside the `if`?
    const linker_script = upstream_dep.path(b.fmt("chips/{s}/linker/{s}.ld", .{ board.chip(), board.ldScript() }));
    b.addNamedLazyPath("linker_script", linker_script);

    if (!emscripten) {
        // Settings and flags for building on hardware
        gossamer_mod.addIncludePath(upstream_dep.path("peripherals/"));
        gossamer_mod.addIncludePath(upstream_dep.path(b.fmt("chips/{s}/include/", .{board.chip()})));

        gossamer_mod.addCSourceFiles(.{
            .root = upstream_dep.path(b.fmt("chips/{s}", .{board.chip()})),
            .files = &.{
                b.fmt("startup_{s}.c", .{board.chip()}),
                b.fmt("system_{s}.c", .{board.chip()}),
            },
            .flags = &.{}, // TODO:
        });
        gossamer_mod.addCSourceFiles(.{
            .root = upstream_dep.path("."),
            .files = &.{
                "common/delay.c",
                "peripherals/adc.c",
                "peripherals/dac.c",
                "peripherals/dma.c",
                "peripherals/eic.c",
                "peripherals/evsys.c",
                "peripherals/i2c.c",
                "peripherals/i2s.c",
                "peripherals/opamp.c",
                "peripherals/ptc.c",
                "peripherals/rtc.c",
                "peripherals/sercom.c",
                "peripherals/slcd.c",
                "peripherals/spi.c",
                "peripherals/tc.c",
                "peripherals/tcc.c",
                "peripherals/uart.c",
            },
            .flags = &.{}, // TODO:
        });
    } else {
        // Settings and flags for building with Emscripten
        @panic("TODO: emscripten");
    }

    gossamer_mod.addIncludePath(upstream_dep.path("drivers/"));
    gossamer_mod.addIncludePath(upstream_dep.path(b.fmt("boards/{t}", .{board})));

    gossamer_mod.addCSourceFile(.{
        .file = upstream_dep.path("main.c"),
        .flags = &.{}, // TODO:
    });

    if (!emscripten) {
        // Do not compile tinyusb for Emscripten

        // TODO: tinyusb
    }

    gossamer_mod.addCMacro("DONT_USE_CMSIS_INIT", "1");

    // TODO: TIMESET

    // TODO: Get git hash
    gossamer_mod.addCMacro("BUILD_GIT_HASH", "\"noHash\"");

    const uf2_dep = b.dependency("uf2", .{});
    b.installArtifact(uf2_dep.artifact("elf2uf2"));
}
