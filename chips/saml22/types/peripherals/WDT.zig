const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Watchdog Timer
pub const WDT = extern struct {
    /// Control
    /// offset: 0x00
    CTRLA: mmio.Mmio(packed struct(u8) {
        reserved1: u1 = 0,
        /// Enable
        ENABLE: u1 = 0x0,
        /// Watchdog Timer Window Mode Enable
        WEN: u1 = 0x0,
        reserved7: u4 = 0,
        /// Always-On
        ALWAYSON: u1 = 0x0,
    }),
    /// Configuration
    /// offset: 0x01
    CONFIG: mmio.Mmio(packed struct(u8) {
        /// Time-Out Period
        PER: enum(u4) {
            /// 8 clock cycles
            CYC8 = 0x0,
            /// 16 clock cycles
            CYC16 = 0x1,
            /// 32 clock cycles
            CYC32 = 0x2,
            /// 64 clock cycles
            CYC64 = 0x3,
            /// 128 clock cycles
            CYC128 = 0x4,
            /// 256 clock cycles
            CYC256 = 0x5,
            /// 512 clock cycles
            CYC512 = 0x6,
            /// 1024 clock cycles
            CYC1024 = 0x7,
            /// 2048 clock cycles
            CYC2048 = 0x8,
            /// 4096 clock cycles
            CYC4096 = 0x9,
            /// 8192 clock cycles
            CYC8192 = 0xa,
            /// 16384 clock cycles
            CYC16384 = 0xb,
            _,
        } = .CYC16384,
        /// Window Mode Time-Out Period
        WINDOW: enum(u4) {
            /// 8 clock cycles
            CYC8 = 0x0,
            /// 16 clock cycles
            CYC16 = 0x1,
            /// 32 clock cycles
            CYC32 = 0x2,
            /// 64 clock cycles
            CYC64 = 0x3,
            /// 128 clock cycles
            CYC128 = 0x4,
            /// 256 clock cycles
            CYC256 = 0x5,
            /// 512 clock cycles
            CYC512 = 0x6,
            /// 1024 clock cycles
            CYC1024 = 0x7,
            /// 2048 clock cycles
            CYC2048 = 0x8,
            /// 4096 clock cycles
            CYC4096 = 0x9,
            /// 8192 clock cycles
            CYC8192 = 0xa,
            /// 16384 clock cycles
            CYC16384 = 0xb,
            _,
        } = .CYC16384,
    }),
    /// Early Warning Interrupt Control
    /// offset: 0x02
    EWCTRL: mmio.Mmio(packed struct(u8) {
        /// Early Warning Interrupt Time Offset
        EWOFFSET: enum(u4) {
            /// 8 clock cycles
            CYC8 = 0x0,
            /// 16 clock cycles
            CYC16 = 0x1,
            /// 32 clock cycles
            CYC32 = 0x2,
            /// 64 clock cycles
            CYC64 = 0x3,
            /// 128 clock cycles
            CYC128 = 0x4,
            /// 256 clock cycles
            CYC256 = 0x5,
            /// 512 clock cycles
            CYC512 = 0x6,
            /// 1024 clock cycles
            CYC1024 = 0x7,
            /// 2048 clock cycles
            CYC2048 = 0x8,
            /// 4096 clock cycles
            CYC4096 = 0x9,
            /// 8192 clock cycles
            CYC8192 = 0xa,
            /// 16384 clock cycles
            CYC16384 = 0xb,
            _,
        } = .CYC16384,
        padding: u4 = 0,
    }),
    /// offset: 0x03
    reserved3: [1]u8,
    /// Interrupt Enable Clear
    /// offset: 0x04
    INTENCLR: mmio.Mmio(packed struct(u8) {
        /// Early Warning Interrupt Enable
        EW: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// Interrupt Enable Set
    /// offset: 0x05
    INTENSET: mmio.Mmio(packed struct(u8) {
        /// Early Warning Interrupt Enable
        EW: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// Interrupt Flag Status and Clear
    /// offset: 0x06
    INTFLAG: mmio.Mmio(packed struct(u8) {
        /// Early Warning
        EW: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// offset: 0x07
    reserved7: [1]u8,
    /// Synchronization Busy
    /// offset: 0x08
    SYNCBUSY: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Enable Busy
        ENABLE: u1 = 0x0,
        /// Window Enable Busy
        WEN: u1 = 0x0,
        /// Always-On Busy
        ALWAYSON: u1 = 0x0,
        /// Clear Busy
        CLEAR: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// Clear
    /// offset: 0x0c
    CLEAR: mmio.Mmio(packed struct(u8) {
        /// Watchdog Clear
        CLEAR: enum(u8) {
            /// Clear Key
            KEY = 0xa5,
            _,
        } = @fromBackingInt(@intCast(0x0)),
    }),
};
