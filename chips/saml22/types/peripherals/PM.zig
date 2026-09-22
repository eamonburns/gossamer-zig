const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Power Manager
pub const PM = extern struct {
    /// Control A
    /// offset: 0x00
    CTRLA: mmio.Mmio(packed struct(u8) {
        reserved2: u2 = 0,
        /// I/O Retention
        IORET: u1 = 0x0,
        padding: u5 = 0,
    }),
    /// Sleep Configuration
    /// offset: 0x01
    SLEEPCFG: mmio.Mmio(packed struct(u8) {
        /// Sleep Mode
        SLEEPMODE: enum(u3) {
            /// CPU clock is OFF
            IDLE0 = 0x0,
            /// AHB clock is OFF
            IDLE1 = 0x1,
            /// APB clock are OFF
            IDLE2 = 0x2,
            /// All Clocks are OFF
            STANDBY = 0x4,
            /// Only Backup domain is powered ON
            BACKUP = 0x5,
            /// All power domains are powered OFF
            OFF = 0x6,
            _,
        } = .IDLE2,
        padding: u5 = 0,
    }),
    /// Performance Level Configuration
    /// offset: 0x02
    PLCFG: mmio.Mmio(packed struct(u8) {
        /// Performance Level Select
        PLSEL: enum(u2) {
            /// Performance Level 0
            PL0 = 0x0,
            /// Performance Level 1
            PL1 = 0x1,
            /// Performance Level 2
            PL2 = 0x2,
            _,
        } = .PL0,
        reserved7: u5 = 0,
        /// Performance Level Disable
        PLDIS: u1 = 0x0,
    }),
    /// offset: 0x03
    reserved3: [1]u8,
    /// Interrupt Enable Clear
    /// offset: 0x04
    INTENCLR: mmio.Mmio(packed struct(u8) {
        /// Performance Level Interrupt Enable
        PLRDY: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// Interrupt Enable Set
    /// offset: 0x05
    INTENSET: mmio.Mmio(packed struct(u8) {
        /// Performance Level Ready interrupt Enable
        PLRDY: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// Interrupt Flag Status and Clear
    /// offset: 0x06
    INTFLAG: mmio.Mmio(packed struct(u8) {
        /// Performance Level Ready
        PLRDY: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// offset: 0x07
    reserved7: [1]u8,
    /// Standby Configuration
    /// offset: 0x08
    STDBYCFG: mmio.Mmio(packed struct(u16) {
        reserved6: u6 = 0,
        /// Voltage Regulator Standby mode
        VREGSMOD: enum(u2) {
            /// Automatic mode
            AUTO = 0x0,
            /// Performance oriented
            PERFORMANCE = 0x1,
            /// Low Power oriented
            LP = 0x2,
            _,
        } = .AUTO,
        reserved10: u2 = 0,
        /// Back Bias for HMCRAMCHS
        BBIASHS: u2 = 0x1,
        padding: u4 = 0,
    }),
};
