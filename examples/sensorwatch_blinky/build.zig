const std = @import("std");

pub fn build(b: *std.Build) void {
    const gossamer_dep = b.dependency("gossamer", .{
        .board = .sensorwatch_red,
    });

    const app_mod = b.addModule("sensorwatch_blinky", .{
        .root_source_file = b.path("src/app.zig"),
        .imports = &.{
            .{ .name = "gossamer", .module = gossamer_dep.module("gossamer") },
        },
    });

    const firmware_exe = gossamer_dep.artifact("firmware.elf");
    firmware_exe.root_module.addImport("app", app_mod);

    b.installArtifact(firmware_exe);
}
