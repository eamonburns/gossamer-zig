const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Frequency Meter
pub const FREQM = extern struct {
    /// Control A Register
    /// offset: 0x00
    CTRLA: mmio.Mmio(packed struct(u8) {
        /// Software Reset
        SWRST: u1 = 0x0,
        /// Enable
        ENABLE: u1 = 0x0,
        padding: u6 = 0,
    }),
    /// Control B Register
    /// offset: 0x01
    CTRLB: mmio.Mmio(packed struct(u8) {
        /// Start Measurement
        START: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// Config A register
    /// offset: 0x02
    CFGA: mmio.Mmio(packed struct(u16) {
        /// Number of Reference Clock Cycles
        REFNUM: u8 = 0x0,
        padding: u8 = 0,
    }),
    /// offset: 0x04
    reserved4: [4]u8,
    /// Interrupt Enable Clear Register
    /// offset: 0x08
    INTENCLR: mmio.Mmio(packed struct(u8) {
        /// Measurement Done Interrupt Enable
        DONE: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// Interrupt Enable Set Register
    /// offset: 0x09
    INTENSET: mmio.Mmio(packed struct(u8) {
        /// Measurement Done Interrupt Enable
        DONE: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// Interrupt Flag Register
    /// offset: 0x0a
    INTFLAG: mmio.Mmio(packed struct(u8) {
        /// Measurement Done
        DONE: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// Status Register
    /// offset: 0x0b
    STATUS: mmio.Mmio(packed struct(u8) {
        /// FREQM Status
        BUSY: u1 = 0x0,
        /// Sticky Count Value Overflow
        OVF: u1 = 0x0,
        padding: u6 = 0,
    }),
    /// Synchronization Busy Register
    /// offset: 0x0c
    SYNCBUSY: mmio.Mmio(packed struct(u32) {
        /// Software Reset
        SWRST: u1 = 0x0,
        /// Enable
        ENABLE: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// Count Value Register
    /// offset: 0x10
    VALUE: mmio.Mmio(packed struct(u32) {
        /// Measurement Value
        VALUE: u24 = 0x0,
        padding: u8 = 0,
    }),
};
