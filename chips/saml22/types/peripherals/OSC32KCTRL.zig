const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// 32k Oscillators Control
pub const OSC32KCTRL = extern struct {
    /// Interrupt Enable Clear
    /// offset: 0x00
    INTENCLR: mmio.Mmio(packed struct(u32) {
        /// XOSC32K Ready Interrupt Enable
        XOSC32KRDY: u1 = 0x0,
        reserved2: u1 = 0,
        /// XOSC32K Clock Failure Detector Interrupt Enable
        CLKFAIL: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// Interrupt Enable Set
    /// offset: 0x04
    INTENSET: mmio.Mmio(packed struct(u32) {
        /// XOSC32K Ready Interrupt Enable
        XOSC32KRDY: u1 = 0x0,
        reserved2: u1 = 0,
        /// XOSC32K Clock Failure Detector Interrupt Enable
        CLKFAIL: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// Interrupt Flag Status and Clear
    /// offset: 0x08
    INTFLAG: mmio.Mmio(packed struct(u32) {
        /// XOSC32K Ready
        XOSC32KRDY: u1 = 0x0,
        reserved2: u1 = 0,
        /// XOSC32K Clock Failure Detector
        CLKFAIL: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// Power and Clocks Status
    /// offset: 0x0c
    STATUS: mmio.Mmio(packed struct(u32) {
        /// XOSC32K Ready
        XOSC32KRDY: u1 = 0x0,
        reserved2: u1 = 0,
        /// XOSC32K Clock Failure Detector
        CLKFAIL: u1 = 0x0,
        /// XOSC32K Clock switch
        CLKSW: u1 = 0x0,
        padding: u28 = 0,
    }),
    /// RTC Clock Selection
    /// offset: 0x10
    RTCCTRL: mmio.Mmio(packed struct(u8) {
        /// RTC Clock Selection
        RTCSEL: enum(u3) {
            /// 1.024kHz from 32kHz internal ULP oscillator
            ULP1K = 0x0,
            /// 32.768kHz from 32kHz internal ULP oscillator
            ULP32K = 0x1,
            /// 1.024kHz from 32.768kHz external oscillator
            XOSC1K = 0x4,
            /// 32.768kHz from 32.768kHz external crystal oscillator
            XOSC32K = 0x5,
            _,
        } = .ULP1K,
        padding: u5 = 0,
    }),
    /// SLCD Clock Selection
    /// offset: 0x11
    SLCDCTRL: mmio.Mmio(packed struct(u8) {
        /// SLCD Clock Selection
        SLCDSEL: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// offset: 0x12
    reserved18: [2]u8,
    /// 32kHz External Crystal Oscillator (XOSC32K) Control
    /// offset: 0x14
    XOSC32K: mmio.Mmio(packed struct(u16) {
        reserved1: u1 = 0,
        /// Oscillator Enable
        ENABLE: u1 = 0x0,
        /// Crystal Oscillator Enable
        XTALEN: u1 = 0x0,
        /// 32kHz Output Enable
        EN32K: u1 = 0x0,
        /// 1kHz Output Enable
        EN1K: u1 = 0x0,
        reserved6: u1 = 0,
        /// Run in Standby
        RUNSTDBY: u1 = 0x0,
        /// On Demand Control
        ONDEMAND: u1 = 0x1,
        /// Oscillator Start-Up Time
        STARTUP: u3 = 0x0,
        reserved12: u1 = 0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u3 = 0,
    }),
    /// Clock Failure Detector Control
    /// offset: 0x16
    CFDCTRL: mmio.Mmio(packed struct(u8) {
        /// Clock Failure Detector Enable
        CFDEN: u1 = 0x0,
        /// Clock Switch Back
        SWBACK: u1 = 0x0,
        /// Clock Failure Detector Prescaler
        CFDPRESC: u1 = 0x0,
        padding: u5 = 0,
    }),
    /// Event Control
    /// offset: 0x17
    EVCTRL: mmio.Mmio(packed struct(u8) {
        /// Clock Failure Detector Event Output Enable
        CFDEO: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// offset: 0x18
    reserved24: [4]u8,
    /// 32kHz Ultra Low Power Internal Oscillator (OSCULP32K) Control
    /// offset: 0x1c
    OSCULP32K: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Enable Out 32k
        EN32K: u1 = 0x0,
        /// Enable Out 1k
        EN1K: u1 = 0x0,
        reserved8: u5 = 0,
        /// Oscillator Calibration
        CALIB: u5 = 0x0,
        reserved15: u2 = 0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u16 = 0,
    }),
};
