//! Microchip ATSAML22J18A device: Cortex-M0+ Microcontroller with 256KB Flash, 32KB SRAM, 64-pin package
const microzig = @import("microzig");
const mmio = microzig.mmio;

pub const types = @import("types.zig");

pub const Properties = struct {
    has_vtor: ?bool = null,
    has_mpu: ?bool = null,
    has_fpu: ?bool = null,
    interrupt_priority_bits: ?u8 = null,
    dma_channel_count: ?u32 = null,
};

pub const Interrupt = struct {
    name: [:0]const u8,
    index: i16,
    description: ?[:0]const u8,
};

pub const properties: Properties = .{
    .has_vtor = true,
    .has_mpu = true,
    .has_fpu = false,
    .interrupt_priority_bits = 2,
    .dma_channel_count = null,
};

pub const raw_properties = struct {
    pub const @"cpu.deviceNumInterrupts" = "26";
    pub const @"cpu.endian" = "little";
    pub const @"cpu.fpuPresent" = "false";
    pub const @"cpu.mpuPresent" = "true";
    pub const @"cpu.name" = "CM0+";
    pub const @"cpu.nvicPrioBits" = "2";
    pub const @"cpu.revision" = "r0p1";
    pub const @"cpu.vendorSystickConfig" = "false";
    pub const @"cpu.vtorPresent" = "true";
    pub const license =
        \\
        \\  Copyright (c) 2018 Microchip Technology Inc.\n
        \\\n
        \\  SPDX-License-Identifier: Apache-2.0\n
        \\\n
        \\  Licensed under the Apache License, Version 2.0 (the "License");\n
        \\  you may not use this file except in compliance with the License.\n
        \\  You may obtain a copy of the License at\n
        \\\n
        \\  http://www.apache.org/licenses/LICENSE-2.0\n
        \\\n
        \\  Unless required by applicable law or agreed to in writing, software\n
        \\  distributed under the License is distributed on an "AS IS" BASIS,\n
        \\  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n
        \\  See the License for the specific language governing permissions and\n
        \\  limitations under the License.
        \\
    ;
};

pub const interrupts: []const Interrupt = &.{
    .{ .name = "NMI", .index = -14, .description = null },
    .{ .name = "HardFault", .index = -13, .description = null },
    .{ .name = "SVCall", .index = -5, .description = null },
    .{ .name = "PendSV", .index = -2, .description = null },
    .{ .name = "SysTick", .index = -1, .description = null },
    .{ .name = "SYSTEM", .index = 0, .description = null },
    .{ .name = "WDT", .index = 1, .description = null },
    .{ .name = "RTC", .index = 2, .description = null },
    .{ .name = "EIC", .index = 3, .description = null },
    .{ .name = "FREQM", .index = 4, .description = null },
    .{ .name = "USB", .index = 5, .description = null },
    .{ .name = "NVMCTRL", .index = 6, .description = null },
    .{ .name = "DMAC", .index = 7, .description = null },
    .{ .name = "EVSYS", .index = 8, .description = null },
    .{ .name = "SERCOM0", .index = 9, .description = null },
    .{ .name = "SERCOM1", .index = 10, .description = null },
    .{ .name = "SERCOM2", .index = 11, .description = null },
    .{ .name = "SERCOM3", .index = 12, .description = null },
    .{ .name = "TCC0", .index = 15, .description = null },
    .{ .name = "TC0", .index = 16, .description = null },
    .{ .name = "TC1", .index = 17, .description = null },
    .{ .name = "TC2", .index = 18, .description = null },
    .{ .name = "TC3", .index = 19, .description = null },
    .{ .name = "ADC", .index = 20, .description = null },
    .{ .name = "AC", .index = 21, .description = null },
    .{ .name = "SLCD", .index = 23, .description = null },
    .{ .name = "AES", .index = 24, .description = null },
    .{ .name = "TRNG", .index = 25, .description = null },
};

pub const VectorTable = extern struct {
    const Handler = microzig.interrupt.Handler;
    const unhandled = microzig.interrupt.unhandled;

    initial_stack_pointer: *const anyopaque,
    Reset: Handler,
    NMI: Handler = unhandled,
    HardFault: Handler = unhandled,
    reserved2: [7]u32 = undefined,
    SVCall: Handler = unhandled,
    reserved10: [2]u32 = undefined,
    PendSV: Handler = unhandled,
    SysTick: Handler = unhandled,
    SYSTEM: Handler = unhandled,
    WDT: Handler = unhandled,
    RTC: Handler = unhandled,
    EIC: Handler = unhandled,
    FREQM: Handler = unhandled,
    USB: Handler = unhandled,
    NVMCTRL: Handler = unhandled,
    DMAC: Handler = unhandled,
    EVSYS: Handler = unhandled,
    SERCOM0: Handler = unhandled,
    SERCOM1: Handler = unhandled,
    SERCOM2: Handler = unhandled,
    SERCOM3: Handler = unhandled,
    reserved27: [2]u32 = undefined,
    TCC0: Handler = unhandled,
    TC0: Handler = unhandled,
    TC1: Handler = unhandled,
    TC2: Handler = unhandled,
    TC3: Handler = unhandled,
    ADC: Handler = unhandled,
    AC: Handler = unhandled,
    reserved36: [1]u32 = undefined,
    SLCD: Handler = unhandled,
    AES: Handler = unhandled,
    TRNG: Handler = unhandled,
};

pub const peripherals = struct {
    /// Peripheral Access Controller
    pub const PAC: *volatile types.peripherals.PAC = @ptrFromInt(0x40000000);
    /// Power Manager
    pub const PM: *volatile types.peripherals.PM = @ptrFromInt(0x40000400);
    /// Main Clock
    pub const MCLK: *volatile types.peripherals.MCLK = @ptrFromInt(0x40000800);
    /// Reset Controller
    pub const RSTC: *volatile types.peripherals.RSTC = @ptrFromInt(0x40000c00);
    /// Oscillators Control
    pub const OSCCTRL: *volatile types.peripherals.OSCCTRL = @ptrFromInt(0x40001000);
    /// 32k Oscillators Control
    pub const OSC32KCTRL: *volatile types.peripherals.OSC32KCTRL = @ptrFromInt(0x40001400);
    /// Supply Controller
    pub const SUPC: *volatile types.peripherals.SUPC = @ptrFromInt(0x40001800);
    /// Generic Clock Generator
    pub const GCLK: *volatile types.peripherals.GCLK = @ptrFromInt(0x40001c00);
    /// Watchdog Timer
    pub const WDT: *volatile types.peripherals.WDT = @ptrFromInt(0x40002000);
    /// Real-Time Counter
    pub const RTC: *volatile types.peripherals.RTC = @ptrFromInt(0x40002400);
    /// External Interrupt Controller
    pub const EIC: *volatile types.peripherals.EIC = @ptrFromInt(0x40002800);
    /// Frequency Meter
    pub const FREQM: *volatile types.peripherals.FREQM = @ptrFromInt(0x40002c00);
    /// Universal Serial Bus
    pub const USB: *volatile types.peripherals.USB = @ptrFromInt(0x41000000);
    /// Device Service Unit
    pub const DSU: *volatile types.peripherals.DSU = @ptrFromInt(0x41002000);
    /// Non-Volatile Memory Controller
    pub const NVMCTRL: *volatile types.peripherals.NVMCTRL = @ptrFromInt(0x41004000);
    /// Port Module
    pub const PORT: *volatile types.peripherals.PORT = @ptrFromInt(0x41006000);
    /// Direct Memory Access Controller
    pub const DMAC: *volatile types.peripherals.DMAC = @ptrFromInt(0x41008000);
    /// Cortex-M0+ Micro-Trace Buffer
    pub const MTB: *volatile types.peripherals.MTB = @ptrFromInt(0x4100a000);
    /// Event System Interface
    pub const EVSYS: *volatile types.peripherals.EVSYS = @ptrFromInt(0x42000000);
    /// Serial Communication Interface 0
    pub const SERCOM0: *volatile types.peripherals.SERCOM0 = @ptrFromInt(0x42000400);
    /// Serial Communication Interface 1
    pub const SERCOM1: *volatile types.peripherals.SERCOM0 = @ptrFromInt(0x42000800);
    /// Serial Communication Interface 2
    pub const SERCOM2: *volatile types.peripherals.SERCOM0 = @ptrFromInt(0x42000c00);
    /// Serial Communication Interface 3
    pub const SERCOM3: *volatile types.peripherals.SERCOM0 = @ptrFromInt(0x42001000);
    /// Timer Counter Control
    pub const TCC0: *volatile types.peripherals.TCC0 = @ptrFromInt(0x42001c00);
    /// Basic Timer Counter 0
    pub const TC0: *volatile types.peripherals.TC0 = @ptrFromInt(0x42002000);
    /// Basic Timer Counter 1
    pub const TC1: *volatile types.peripherals.TC0 = @ptrFromInt(0x42002400);
    /// Basic Timer Counter 2
    pub const TC2: *volatile types.peripherals.TC0 = @ptrFromInt(0x42002800);
    /// Basic Timer Counter 3
    pub const TC3: *volatile types.peripherals.TC0 = @ptrFromInt(0x42002c00);
    /// Analog Digital Converter
    pub const ADC: *volatile types.peripherals.ADC = @ptrFromInt(0x42003000);
    /// Analog Comparators
    pub const AC: *volatile types.peripherals.AC = @ptrFromInt(0x42003400);
    /// Segment Liquid Crystal Display Controller
    pub const SLCD: *volatile types.peripherals.SLCD = @ptrFromInt(0x42003c00);
    /// Advanced Encryption Standard
    pub const AES: *volatile types.peripherals.AES = @ptrFromInt(0x42004000);
    /// True Random Generator
    pub const TRNG: *volatile types.peripherals.TRNG = @ptrFromInt(0x42004400);
    /// Configurable Custom Logic
    pub const CCL: *volatile types.peripherals.CCL = @ptrFromInt(0x42004800);
    /// Port Module (IOBUS)
    pub const PORT_IOBUS: *volatile types.peripherals.PORT = @ptrFromInt(0x60000000);
};
