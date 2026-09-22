const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Supply Controller
pub const SUPC = extern struct {
    /// Interrupt Enable Clear
    /// offset: 0x00
    INTENCLR: mmio.Mmio(packed struct(u32) {
        /// BOD33 Ready
        BOD33RDY: u1 = 0x0,
        /// BOD33 Detection
        BOD33DET: u1 = 0x0,
        /// BOD33 Synchronization Ready
        B33SRDY: u1 = 0x0,
        /// BOD12 Ready
        BOD12RDY: u1 = 0x0,
        /// BOD12 Detection
        BOD12DET: u1 = 0x0,
        /// BOD12 Synchronization Ready
        B12SRDY: u1 = 0x0,
        reserved8: u2 = 0,
        /// Voltage Regulator Ready
        VREGRDY: u1 = 0x0,
        /// Automatic Power Switch Ready
        APWSRDY: u1 = 0x0,
        /// VDDCORE Ready
        VCORERDY: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// Interrupt Enable Set
    /// offset: 0x04
    INTENSET: mmio.Mmio(packed struct(u32) {
        /// BOD33 Ready
        BOD33RDY: u1 = 0x0,
        /// BOD33 Detection
        BOD33DET: u1 = 0x0,
        /// BOD33 Synchronization Ready
        B33SRDY: u1 = 0x0,
        /// BOD12 Ready
        BOD12RDY: u1 = 0x0,
        /// BOD12 Detection
        BOD12DET: u1 = 0x0,
        /// BOD12 Synchronization Ready
        B12SRDY: u1 = 0x0,
        reserved8: u2 = 0,
        /// Voltage Regulator Ready
        VREGRDY: u1 = 0x0,
        /// Automatic Power Switch Ready
        APWSRDY: u1 = 0x0,
        /// VDDCORE Ready
        VCORERDY: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// Interrupt Flag Status and Clear
    /// offset: 0x08
    INTFLAG: mmio.Mmio(packed struct(u32) {
        /// BOD33 Ready
        BOD33RDY: u1 = 0x0,
        /// BOD33 Detection
        BOD33DET: u1 = 0x0,
        /// BOD33 Synchronization Ready
        B33SRDY: u1 = 0x0,
        /// BOD12 Ready
        BOD12RDY: u1 = 0x0,
        /// BOD12 Detection
        BOD12DET: u1 = 0x0,
        /// BOD12 Synchronization Ready
        B12SRDY: u1 = 0x0,
        reserved8: u2 = 0,
        /// Voltage Regulator Ready
        VREGRDY: u1 = 0x0,
        /// Automatic Power Switch Ready
        APWSRDY: u1 = 0x0,
        /// VDDCORE Ready
        VCORERDY: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// Power and Clocks Status
    /// offset: 0x0c
    STATUS: mmio.Mmio(packed struct(u32) {
        /// BOD33 Ready
        BOD33RDY: u1 = 0x0,
        /// BOD33 Detection
        BOD33DET: u1 = 0x0,
        /// BOD33 Synchronization Ready
        B33SRDY: u1 = 0x0,
        /// BOD12 Ready
        BOD12RDY: u1 = 0x0,
        /// BOD12 Detection
        BOD12DET: u1 = 0x0,
        /// BOD12 Synchronization Ready
        B12SRDY: u1 = 0x0,
        reserved8: u2 = 0,
        /// Voltage Regulator Ready
        VREGRDY: u1 = 0x0,
        /// Automatic Power Switch Ready
        APWSRDY: u1 = 0x0,
        /// VDDCORE Ready
        VCORERDY: u1 = 0x0,
        /// Battery Backup Power Switch
        BBPS: u1 = 0x0,
        padding: u20 = 0,
    }),
    /// BOD33 Control
    /// offset: 0x10
    BOD33: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Enable
        ENABLE: u1 = 0x0,
        /// Hysteresis Enable
        HYST: u1 = 0x0,
        /// Action when Threshold Crossed
        ACTION: enum(u2) {
            /// No action
            NONE = 0x0,
            /// The BOD33 generates a reset
            RESET = 0x1,
            /// The BOD33 generates an interrupt
            INT = 0x2,
            /// The BOD33 puts the device in backup sleep mode if VMON=0
            BKUP = 0x3,
        } = .NONE,
        /// Configuration in Standby mode
        STDBYCFG: u1 = 0x0,
        /// Run during Standby
        RUNSTDBY: u1 = 0x0,
        /// Configuration in Backup mode
        RUNBKUP: u1 = 0x0,
        /// Configuration in Active mode
        ACTCFG: u1 = 0x0,
        reserved10: u1 = 0,
        /// Voltage Monitored in active and standby mode
        VMON: u1 = 0x0,
        reserved12: u1 = 0,
        /// Prescaler Select
        PSEL: enum(u4) {
            /// Divide clock by 2
            DIV2 = 0x0,
            /// Divide clock by 4
            DIV4 = 0x1,
            /// Divide clock by 8
            DIV8 = 0x2,
            /// Divide clock by 16
            DIV16 = 0x3,
            /// Divide clock by 32
            DIV32 = 0x4,
            /// Divide clock by 64
            DIV64 = 0x5,
            /// Divide clock by 128
            DIV128 = 0x6,
            /// Divide clock by 256
            DIV256 = 0x7,
            /// Divide clock by 512
            DIV512 = 0x8,
            /// Divide clock by 1024
            DIV1024 = 0x9,
            /// Divide clock by 2048
            DIV2048 = 0xa,
            /// Divide clock by 4096
            DIV4096 = 0xb,
            /// Divide clock by 8192
            DIV8192 = 0xc,
            /// Divide clock by 16384
            DIV16384 = 0xd,
            /// Divide clock by 32768
            DIV32768 = 0xe,
            /// Divide clock by 65536
            DIV65536 = 0xf,
        } = .DIV2,
        /// Threshold Level for VDD
        LEVEL: u6 = 0x0,
        reserved24: u2 = 0,
        /// Threshold Level in backup sleep mode or for VBAT
        BKUPLEVEL: u6 = 0x0,
        padding: u2 = 0,
    }),
    /// BOD12 Control
    /// offset: 0x14
    BOD12: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Enable
        ENABLE: u1 = 0x0,
        /// Hysteresis Enable
        HYST: u1 = 0x0,
        /// Action when Threshold Crossed
        ACTION: enum(u2) {
            /// No action
            NONE = 0x0,
            /// The BOD12 generates a reset
            RESET = 0x1,
            /// The BOD12 generates an interrupt
            INT = 0x2,
            _,
        } = .NONE,
        /// Configuration in Standby mode
        STDBYCFG: u1 = 0x0,
        /// Run during Standby
        RUNSTDBY: u1 = 0x0,
        reserved8: u1 = 0,
        /// Configuration in Active mode
        ACTCFG: u1 = 0x0,
        reserved12: u3 = 0,
        /// Prescaler Select
        PSEL: enum(u4) {
            /// Divide clock by 2
            DIV2 = 0x0,
            /// Divide clock by 4
            DIV4 = 0x1,
            /// Divide clock by 8
            DIV8 = 0x2,
            /// Divide clock by 16
            DIV16 = 0x3,
            /// Divide clock by 32
            DIV32 = 0x4,
            /// Divide clock by 64
            DIV64 = 0x5,
            /// Divide clock by 128
            DIV128 = 0x6,
            /// Divide clock by 256
            DIV256 = 0x7,
            /// Divide clock by 512
            DIV512 = 0x8,
            /// Divide clock by 1024
            DIV1024 = 0x9,
            /// Divide clock by 2048
            DIV2048 = 0xa,
            /// Divide clock by 4096
            DIV4096 = 0xb,
            /// Divide clock by 8192
            DIV8192 = 0xc,
            /// Divide clock by 16384
            DIV16384 = 0xd,
            /// Divide clock by 32768
            DIV32768 = 0xe,
            /// Divide clock by 65536
            DIV65536 = 0xf,
        } = .DIV2,
        /// Threshold Level
        LEVEL: u6 = 0x0,
        padding: u10 = 0,
    }),
    /// VREG Control
    /// offset: 0x18
    VREG: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Enable
        ENABLE: u1 = 0x0,
        /// Voltage Regulator Selection in active mode
        SEL: enum(u2) {
            /// LDO selection
            LDO = 0x0,
            /// Buck selection
            BUCK = 0x1,
            /// Switched Cap selection
            SCVREG = 0x2,
            _,
        } = .LDO,
        reserved5: u1 = 0,
        /// Standby in PL0
        STDBYPL0: u1 = 0x0,
        /// Run during Standby
        RUNSTDBY: u1 = 0x0,
        reserved8: u1 = 0,
        /// Low Power efficiency
        LPEFF: u1 = 0x0,
        reserved16: u7 = 0,
        /// Voltage Scaling Voltage Step
        VSVSTEP: u4 = 0x0,
        reserved24: u4 = 0,
        /// Voltage Scaling Period
        VSPER: u8 = 0x0,
    }),
    /// VREF Control
    /// offset: 0x1c
    VREF: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Temperature Sensor Output Enable
        TSEN: u1 = 0x0,
        /// Voltage Reference Output Enable
        VREFOE: u1 = 0x0,
        /// Temperature Sensor Selection
        TSSEL: u1 = 0x0,
        reserved6: u2 = 0,
        /// Run during Standby
        RUNSTDBY: u1 = 0x0,
        /// On Demand Contrl
        ONDEMAND: u1 = 0x0,
        reserved16: u8 = 0,
        /// Voltage Reference Selection
        SEL: enum(u4) {
            /// 1.0V voltage reference typical value
            @"1V0" = 0x0,
            /// 1.1V voltage reference typical value
            @"1V1" = 0x1,
            /// 1.2V voltage reference typical value
            @"1V2" = 0x2,
            /// 1.25V voltage reference typical value
            @"1V25" = 0x3,
            /// 2.0V voltage reference typical value
            @"2V0" = 0x4,
            /// 2.2V voltage reference typical value
            @"2V2" = 0x5,
            /// 2.4V voltage reference typical value
            @"2V4" = 0x6,
            /// 2.5V voltage reference typical value
            @"2V5" = 0x7,
            _,
        } = .@"1V0",
        padding: u12 = 0,
    }),
    /// Battery Backup Power Switch
    /// offset: 0x20
    BBPS: mmio.Mmio(packed struct(u32) {
        /// Battery Backup Configuration
        CONF: enum(u2) {
            /// The backup domain is always supplied by main power
            NONE = 0x0,
            /// The power switch is handled by the automatic power switch
            APWS = 0x1,
            /// The backup domain is always supplied by battery backup power
            FORCED = 0x2,
            /// The power switch is handled by the BOD33
            BOD33 = 0x3,
        } = .NONE,
        /// Wake Enable
        WAKEEN: u1 = 0x0,
        /// Power Supply OK Enable
        PSOKEN: u1 = 0x0,
        padding: u28 = 0,
    }),
    /// Backup Output Control
    /// offset: 0x24
    BKOUT: mmio.Mmio(packed struct(u32) {
        /// Enable Output
        EN: u2 = 0x0,
        reserved8: u6 = 0,
        /// Clear Output
        CLR: u2 = 0x0,
        reserved16: u6 = 0,
        /// Set Output
        SET: u2 = 0x0,
        reserved24: u6 = 0,
        /// RTC Toggle Output
        RTCTGL: u2 = 0x0,
        padding: u6 = 0,
    }),
    /// Backup Input Control
    /// offset: 0x28
    BKIN: mmio.Mmio(packed struct(u32) {
        /// Backup Input Value
        BKIN: u8 = 0x0,
        padding: u24 = 0,
    }),
};
