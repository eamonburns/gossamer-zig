const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Oscillators Control
pub const OSCCTRL = extern struct {
    /// Interrupt Enable Clear
    /// offset: 0x00
    INTENCLR: mmio.Mmio(packed struct(u32) {
        /// XOSC Ready Interrupt Enable
        XOSCRDY: u1 = 0x0,
        /// XOSC Clock Failure Detector Interrupt Enable
        XOSCFAIL: u1 = 0x0,
        reserved4: u2 = 0,
        /// OSC16M Ready Interrupt Enable
        OSC16MRDY: u1 = 0x0,
        reserved8: u3 = 0,
        /// DFLL Ready Interrupt Enable
        DFLLRDY: u1 = 0x0,
        /// DFLL Out Of Bounds Interrupt Enable
        DFLLOOB: u1 = 0x0,
        /// DFLL Lock Fine Interrupt Enable
        DFLLLCKF: u1 = 0x0,
        /// DFLL Lock Coarse Interrupt Enable
        DFLLLCKC: u1 = 0x0,
        /// DFLL Reference Clock Stopped Interrupt Enable
        DFLLRCS: u1 = 0x0,
        reserved16: u3 = 0,
        /// DPLL Lock Rise Interrupt Enable
        DPLLLCKR: u1 = 0x0,
        /// DPLL Lock Fall Interrupt Enable
        DPLLLCKF: u1 = 0x0,
        /// DPLL Time Out Interrupt Enable
        DPLLLTO: u1 = 0x0,
        /// DPLL Ratio Ready Interrupt Enable
        DPLLLDRTO: u1 = 0x0,
        padding: u12 = 0,
    }),
    /// Interrupt Enable Set
    /// offset: 0x04
    INTENSET: mmio.Mmio(packed struct(u32) {
        /// XOSC Ready Interrupt Enable
        XOSCRDY: u1 = 0x0,
        /// XOSC Clock Failure Detector Interrupt Enable
        XOSCFAIL: u1 = 0x0,
        reserved4: u2 = 0,
        /// OSC16M Ready Interrupt Enable
        OSC16MRDY: u1 = 0x0,
        reserved8: u3 = 0,
        /// DFLL Ready Interrupt Enable
        DFLLRDY: u1 = 0x0,
        /// DFLL Out Of Bounds Interrupt Enable
        DFLLOOB: u1 = 0x0,
        /// DFLL Lock Fine Interrupt Enable
        DFLLLCKF: u1 = 0x0,
        /// DFLL Lock Coarse Interrupt Enable
        DFLLLCKC: u1 = 0x0,
        /// DFLL Reference Clock Stopped Interrupt Enable
        DFLLRCS: u1 = 0x0,
        reserved16: u3 = 0,
        /// DPLL Lock Rise Interrupt Enable
        DPLLLCKR: u1 = 0x0,
        /// DPLL Lock Fall Interrupt Enable
        DPLLLCKF: u1 = 0x0,
        /// DPLL Time Out Interrupt Enable
        DPLLLTO: u1 = 0x0,
        /// DPLL Ratio Ready Interrupt Enable
        DPLLLDRTO: u1 = 0x0,
        padding: u12 = 0,
    }),
    /// Interrupt Flag Status and Clear
    /// offset: 0x08
    INTFLAG: mmio.Mmio(packed struct(u32) {
        /// XOSC Ready
        XOSCRDY: u1 = 0x0,
        /// XOSC Clock Failure Detector
        XOSCFAIL: u1 = 0x0,
        reserved4: u2 = 0,
        /// OSC16M Ready
        OSC16MRDY: u1 = 0x0,
        reserved8: u3 = 0,
        /// DFLL Ready
        DFLLRDY: u1 = 0x0,
        /// DFLL Out Of Bounds
        DFLLOOB: u1 = 0x0,
        /// DFLL Lock Fine
        DFLLLCKF: u1 = 0x0,
        /// DFLL Lock Coarse
        DFLLLCKC: u1 = 0x0,
        /// DFLL Reference Clock Stopped
        DFLLRCS: u1 = 0x0,
        reserved16: u3 = 0,
        /// DPLL Lock Rise
        DPLLLCKR: u1 = 0x0,
        /// DPLL Lock Fall
        DPLLLCKF: u1 = 0x0,
        /// DPLL Timeout
        DPLLLTO: u1 = 0x0,
        /// DPLL Ratio Ready
        DPLLLDRTO: u1 = 0x0,
        padding: u12 = 0,
    }),
    /// Power and Clocks Status
    /// offset: 0x0c
    STATUS: mmio.Mmio(packed struct(u32) {
        /// XOSC Ready
        XOSCRDY: u1 = 0x0,
        /// XOSC Clock Failure Detector
        XOSCFAIL: u1 = 0x0,
        /// XOSC Clock Switch
        XOSCCKSW: u1 = 0x0,
        reserved4: u1 = 0,
        /// OSC16M Ready
        OSC16MRDY: u1 = 0x0,
        reserved8: u3 = 0,
        /// DFLL Ready
        DFLLRDY: u1 = 0x0,
        /// DFLL Out Of Bounds
        DFLLOOB: u1 = 0x0,
        /// DFLL Lock Fine
        DFLLLCKF: u1 = 0x0,
        /// DFLL Lock Coarse
        DFLLLCKC: u1 = 0x0,
        /// DFLL Reference Clock Stopped
        DFLLRCS: u1 = 0x0,
        reserved16: u3 = 0,
        /// DPLL Lock Rise
        DPLLLCKR: u1 = 0x0,
        /// DPLL Lock Fall
        DPLLLCKF: u1 = 0x0,
        /// DPLL Timeout
        DPLLTO: u1 = 0x0,
        /// DPLL Ratio Ready
        DPLLLDRTO: u1 = 0x0,
        padding: u12 = 0,
    }),
    /// External Multipurpose Crystal Oscillator (XOSC) Control
    /// offset: 0x10
    XOSCCTRL: mmio.Mmio(packed struct(u16) {
        reserved1: u1 = 0,
        /// Oscillator Enable
        ENABLE: u1 = 0x0,
        /// Crystal Oscillator Enable
        XTALEN: u1 = 0x0,
        /// Xosc Clock Failure Detecteor Enable
        CFDEN: u1 = 0x0,
        /// Xosc Clock Switch Enable
        SWBEN: u1 = 0x0,
        reserved6: u1 = 0,
        /// Run in Standby
        RUNSTDBY: u1 = 0x0,
        /// On Demand Control
        ONDEMAND: u1 = 0x1,
        /// Oscillator Gain
        GAIN: u3 = 0x0,
        /// Automatic Amplitude Gain Control
        AMPGC: u1 = 0x0,
        /// Start-Up Time
        STARTUP: u4 = 0x0,
    }),
    /// Cloc Failure Detector Prescaler
    /// offset: 0x12
    CFDPRESC: mmio.Mmio(packed struct(u8) {
        /// Clock Failure Detector Prescaler
        CFDPRESC: u3 = 0x0,
        padding: u5 = 0,
    }),
    /// Event Control
    /// offset: 0x13
    EVCTRL: mmio.Mmio(packed struct(u8) {
        /// Clock Failure Detector Event Output Enable
        CFDEO: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// 16MHz Internal Oscillator (OSC16M) Control
    /// offset: 0x14
    OSC16MCTRL: mmio.Mmio(packed struct(u8) {
        reserved1: u1 = 0,
        /// Oscillator Enable
        ENABLE: u1 = 0x1,
        /// Oscillator Frequency Select
        FSEL: enum(u2) {
            /// 4MHz
            @"4" = 0x0,
            /// 8MHz
            @"8" = 0x1,
            /// 12MHz
            @"12" = 0x2,
            /// 16MHz
            @"16" = 0x3,
        } = .@"4",
        reserved6: u2 = 0,
        /// Run in Standby
        RUNSTDBY: u1 = 0x0,
        /// On Demand Control
        ONDEMAND: u1 = 0x1,
    }),
    /// offset: 0x15
    reserved21: [3]u8,
    /// DFLL48M Control
    /// offset: 0x18
    DFLLCTRL: mmio.Mmio(packed struct(u16) {
        reserved1: u1 = 0,
        /// DFLL Enable
        ENABLE: u1 = 0x0,
        /// Operating Mode Selection
        MODE: u1 = 0x0,
        /// Stable DFLL Frequency
        STABLE: u1 = 0x0,
        /// Lose Lock After Wake
        LLAW: u1 = 0x0,
        /// USB Clock Recovery Mode
        USBCRM: u1 = 0x0,
        /// Run in Standby
        RUNSTDBY: u1 = 0x0,
        /// On Demand Control
        ONDEMAND: u1 = 0x1,
        /// Chill Cycle Disable
        CCDIS: u1 = 0x0,
        /// Quick Lock Disable
        QLDIS: u1 = 0x0,
        /// Bypass Coarse Lock
        BPLCKC: u1 = 0x0,
        /// Wait Lock
        WAITLOCK: u1 = 0x0,
        padding: u4 = 0,
    }),
    /// offset: 0x1a
    reserved26: [2]u8,
    /// DFLL48M Value
    /// offset: 0x1c
    DFLLVAL: mmio.Mmio(packed struct(u32) {
        /// Fine Value
        FINE: u10 = 0x0,
        /// Coarse Value
        COARSE: u6 = 0x0,
        /// Multiplication Ratio Difference
        DIFF: u16 = 0x0,
    }),
    /// DFLL48M Multiplier
    /// offset: 0x20
    DFLLMUL: mmio.Mmio(packed struct(u32) {
        /// DFLL Multiply Factor
        MUL: u16 = 0x0,
        /// Fine Maximum Step
        FSTEP: u10 = 0x0,
        /// Coarse Maximum Step
        CSTEP: u6 = 0x0,
    }),
    /// DFLL48M Synchronization
    /// offset: 0x24
    DFLLSYNC: mmio.Mmio(packed struct(u8) {
        reserved7: u7 = 0,
        /// Read Request
        READREQ: u1 = 0x0,
    }),
    /// offset: 0x25
    reserved37: [3]u8,
    /// DPLL Control
    /// offset: 0x28
    DPLLCTRLA: mmio.Mmio(packed struct(u8) {
        reserved1: u1 = 0,
        /// Enable
        ENABLE: u1 = 0x0,
        reserved6: u4 = 0,
        /// Run in Standby
        RUNSTDBY: u1 = 0x0,
        /// On Demand
        ONDEMAND: u1 = 0x1,
    }),
    /// offset: 0x29
    reserved41: [3]u8,
    /// DPLL Ratio Control
    /// offset: 0x2c
    DPLLRATIO: mmio.Mmio(packed struct(u32) {
        /// Loop Divider Ratio
        LDR: u12 = 0x0,
        reserved16: u4 = 0,
        /// Loop Divider Ratio Fractional Part
        LDRFRAC: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// Digital Core Configuration
    /// offset: 0x30
    DPLLCTRLB: mmio.Mmio(packed struct(u32) {
        /// Proportional Integral Filter Selection
        FILTER: u2 = 0x0,
        /// Low-Power Enable
        LPEN: u1 = 0x0,
        /// Wake Up Fast
        WUF: u1 = 0x0,
        /// Reference Clock Selection
        REFCLK: u2 = 0x0,
        reserved8: u2 = 0,
        /// Lock Time
        LTIME: u3 = 0x0,
        reserved12: u1 = 0,
        /// Lock Bypass
        LBYPASS: u1 = 0x0,
        reserved16: u3 = 0,
        /// Clock Divider
        DIV: u11 = 0x0,
        padding: u5 = 0,
    }),
    /// DPLL Prescaler
    /// offset: 0x34
    DPLLPRESC: mmio.Mmio(packed struct(u8) {
        /// Output Clock Prescaler
        PRESC: enum(u2) {
            /// DPLL output is divided by 1
            DIV1 = 0x0,
            /// DPLL output is divided by 2
            DIV2 = 0x1,
            /// DPLL output is divided by 4
            DIV4 = 0x2,
            _,
        } = .DIV1,
        padding: u6 = 0,
    }),
    /// offset: 0x35
    reserved53: [3]u8,
    /// DPLL Synchronization Busy
    /// offset: 0x38
    DPLLSYNCBUSY: mmio.Mmio(packed struct(u8) {
        reserved1: u1 = 0,
        /// DPLL Enable Synchronization Status
        ENABLE: u1 = 0x0,
        /// DPLL Ratio Synchronization Status
        DPLLRATIO: u1 = 0x0,
        /// DPLL Prescaler Synchronization Status
        DPLLPRESC: u1 = 0x0,
        padding: u4 = 0,
    }),
    /// offset: 0x39
    reserved57: [3]u8,
    /// DPLL Status
    /// offset: 0x3c
    DPLLSTATUS: mmio.Mmio(packed struct(u8) {
        /// DPLL Lock Status
        LOCK: u1 = 0x0,
        /// DPLL Clock Ready
        CLKRDY: u1 = 0x0,
        padding: u6 = 0,
    }),
};
