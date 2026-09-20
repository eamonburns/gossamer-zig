const std = @import("std");
const gossamer = @import("gossamer");

pub fn build(b: *std.Build) void {
    const gossamer_dep = b.dependency("gossamer", .{
        .board = .sensorwatch_red,
    });

    const app_mod = b.addModule("sensorwatch_blinky", .{
        .root_source_file = b.path("src/app.zig"),
    });
    const firmware_uf2 = gossamer.addFirmware(gossamer_dep, .{
        .root_module = app_mod,
    });
    b.getInstallStep().dependOn(&b.addInstallFile(firmware_uf2, "firmware.uf2").step);
}
