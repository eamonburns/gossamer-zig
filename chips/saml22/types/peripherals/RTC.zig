const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Real-Time Counter
pub const RTC = extern struct {
    /// 32-bit Counter with Single 32-bit Compare
    /// offset: 0x00
    MODE0: extern struct {
        /// MODE0 Control A
        /// offset: 0x00
        CTRLA: mmio.Mmio(packed struct(u16) {
            /// Software Reset
            SWRST: u1 = 0x0,
            /// Enable
            ENABLE: u1 = 0x0,
            /// Operating Mode
            MODE: enum(u2) {
                /// Mode 0: 32-bit Counter
                COUNT32 = 0x0,
                /// Mode 1: 16-bit Counter
                COUNT16 = 0x1,
                /// Mode 2: Clock/Calendar
                CLOCK = 0x2,
                _,
            } = .COUNT32,
            reserved7: u3 = 0,
            /// Clear on Match
            MATCHCLR: u1 = 0x0,
            /// Prescaler
            PRESCALER: enum(u4) {
                /// CLK_RTC_CNT = GCLK_RTC/1
                OFF = 0x0,
                /// CLK_RTC_CNT = GCLK_RTC/1
                DIV1 = 0x1,
                /// CLK_RTC_CNT = GCLK_RTC/2
                DIV2 = 0x2,
                /// CLK_RTC_CNT = GCLK_RTC/4
                DIV4 = 0x3,
                /// CLK_RTC_CNT = GCLK_RTC/8
                DIV8 = 0x4,
                /// CLK_RTC_CNT = GCLK_RTC/16
                DIV16 = 0x5,
                /// CLK_RTC_CNT = GCLK_RTC/32
                DIV32 = 0x6,
                /// CLK_RTC_CNT = GCLK_RTC/64
                DIV64 = 0x7,
                /// CLK_RTC_CNT = GCLK_RTC/128
                DIV128 = 0x8,
                /// CLK_RTC_CNT = GCLK_RTC/256
                DIV256 = 0x9,
                /// CLK_RTC_CNT = GCLK_RTC/512
                DIV512 = 0xa,
                /// CLK_RTC_CNT = GCLK_RTC/1024
                DIV1024 = 0xb,
                _,
            } = .OFF,
            reserved13: u1 = 0,
            /// BKUP Registers Reset On Tamper Enable
            BKTRST: u1 = 0x0,
            /// GP Registers Reset On Tamper Enable
            GPTRST: u1 = 0x0,
            /// Count Read Synchronization Enable
            COUNTSYNC: u1 = 0x0,
        }),
        /// MODE0 Control B
        /// offset: 0x02
        CTRLB: mmio.Mmio(packed struct(u16) {
            /// General Purpose 0 Enable
            GP0EN: u1 = 0x0,
            reserved4: u3 = 0,
            /// Debouncer Majority Enable
            DEBMAJ: u1 = 0x0,
            /// Debouncer Asynchronous Enable
            DEBASYNC: u1 = 0x0,
            /// RTC Output Enable
            RTCOUT: u1 = 0x0,
            /// DMA Enable
            DMAEN: u1 = 0x0,
            /// Debounce Freqnuency
            DEBF: enum(u3) {
                /// CLK_RTC_DEB = CLK_RTC/2
                DIV2 = 0x0,
                /// CLK_RTC_DEB = CLK_RTC/4
                DIV4 = 0x1,
                /// CLK_RTC_DEB = CLK_RTC/8
                DIV8 = 0x2,
                /// CLK_RTC_DEB = CLK_RTC/16
                DIV16 = 0x3,
                /// CLK_RTC_DEB = CLK_RTC/32
                DIV32 = 0x4,
                /// CLK_RTC_DEB = CLK_RTC/64
                DIV64 = 0x5,
                /// CLK_RTC_DEB = CLK_RTC/128
                DIV128 = 0x6,
                /// CLK_RTC_DEB = CLK_RTC/256
                DIV256 = 0x7,
            } = .DIV2,
            reserved12: u1 = 0,
            /// Active Layer Freqnuency
            ACTF: enum(u3) {
                /// CLK_RTC_OUT = CLK_RTC/2
                DIV2 = 0x0,
                /// CLK_RTC_OUT = CLK_RTC/4
                DIV4 = 0x1,
                /// CLK_RTC_OUT = CLK_RTC/8
                DIV8 = 0x2,
                /// CLK_RTC_OUT = CLK_RTC/16
                DIV16 = 0x3,
                /// CLK_RTC_OUT = CLK_RTC/32
                DIV32 = 0x4,
                /// CLK_RTC_OUT = CLK_RTC/64
                DIV64 = 0x5,
                /// CLK_RTC_OUT = CLK_RTC/128
                DIV128 = 0x6,
                /// CLK_RTC_OUT = CLK_RTC/256
                DIV256 = 0x7,
            } = .DIV2,
            padding: u1 = 0,
        }),
        /// MODE0 Event Control
        /// offset: 0x04
        EVCTRL: mmio.Mmio(packed struct(u32) {
            /// Periodic Interval 0 Event Output Enable
            PEREO0: u1 = 0x0,
            /// Periodic Interval 1 Event Output Enable
            PEREO1: u1 = 0x0,
            /// Periodic Interval 2 Event Output Enable
            PEREO2: u1 = 0x0,
            /// Periodic Interval 3 Event Output Enable
            PEREO3: u1 = 0x0,
            /// Periodic Interval 4 Event Output Enable
            PEREO4: u1 = 0x0,
            /// Periodic Interval 5 Event Output Enable
            PEREO5: u1 = 0x0,
            /// Periodic Interval 6 Event Output Enable
            PEREO6: u1 = 0x0,
            /// Periodic Interval 7 Event Output Enable
            PEREO7: u1 = 0x0,
            /// Compare 0 Event Output Enable
            CMPEO0: u1 = 0x0,
            reserved14: u5 = 0,
            /// Tamper Event Output Enable
            TAMPEREO: u1 = 0x0,
            /// Overflow Event Output Enable
            OVFEO: u1 = 0x0,
            /// Tamper Event Input Enable
            TAMPEVEI: u1 = 0x0,
            padding: u15 = 0,
        }),
        /// MODE0 Interrupt Enable Clear
        /// offset: 0x08
        INTENCLR: mmio.Mmio(packed struct(u16) {
            /// Periodic Interval 0 Interrupt Enable
            PER0: u1 = 0x0,
            /// Periodic Interval 1 Interrupt Enable
            PER1: u1 = 0x0,
            /// Periodic Interval 2 Interrupt Enable
            PER2: u1 = 0x0,
            /// Periodic Interval 3 Interrupt Enable
            PER3: u1 = 0x0,
            /// Periodic Interval 4 Interrupt Enable
            PER4: u1 = 0x0,
            /// Periodic Interval 5 Interrupt Enable
            PER5: u1 = 0x0,
            /// Periodic Interval 6 Interrupt Enable
            PER6: u1 = 0x0,
            /// Periodic Interval 7 Interrupt Enable
            PER7: u1 = 0x0,
            /// Compare 0 Interrupt Enable
            CMP0: u1 = 0x0,
            reserved14: u5 = 0,
            /// Tamper Enable
            TAMPER: u1 = 0x0,
            /// Overflow Interrupt Enable
            OVF: u1 = 0x0,
        }),
        /// MODE0 Interrupt Enable Set
        /// offset: 0x0a
        INTENSET: mmio.Mmio(packed struct(u16) {
            /// Periodic Interval 0 Interrupt Enable
            PER0: u1 = 0x0,
            /// Periodic Interval 1 Interrupt Enable
            PER1: u1 = 0x0,
            /// Periodic Interval 2 Interrupt Enable
            PER2: u1 = 0x0,
            /// Periodic Interval 3 Interrupt Enable
            PER3: u1 = 0x0,
            /// Periodic Interval 4 Interrupt Enable
            PER4: u1 = 0x0,
            /// Periodic Interval 5 Interrupt Enable
            PER5: u1 = 0x0,
            /// Periodic Interval 6 Interrupt Enable
            PER6: u1 = 0x0,
            /// Periodic Interval 7 Interrupt Enable
            PER7: u1 = 0x0,
            /// Compare 0 Interrupt Enable
            CMP0: u1 = 0x0,
            reserved14: u5 = 0,
            /// Tamper Enable
            TAMPER: u1 = 0x0,
            /// Overflow Interrupt Enable
            OVF: u1 = 0x0,
        }),
        /// MODE0 Interrupt Flag Status and Clear
        /// offset: 0x0c
        INTFLAG: mmio.Mmio(packed struct(u16) {
            /// Periodic Interval 0
            PER0: u1 = 0x0,
            /// Periodic Interval 1
            PER1: u1 = 0x0,
            /// Periodic Interval 2
            PER2: u1 = 0x0,
            /// Periodic Interval 3
            PER3: u1 = 0x0,
            /// Periodic Interval 4
            PER4: u1 = 0x0,
            /// Periodic Interval 5
            PER5: u1 = 0x0,
            /// Periodic Interval 6
            PER6: u1 = 0x0,
            /// Periodic Interval 7
            PER7: u1 = 0x0,
            /// Compare 0
            CMP0: u1 = 0x0,
            reserved14: u5 = 0,
            /// Tamper
            TAMPER: u1 = 0x0,
            /// Overflow
            OVF: u1 = 0x0,
        }),
        /// Debug Control
        /// offset: 0x0e
        DBGCTRL: mmio.Mmio(packed struct(u8) {
            /// Run During Debug
            DBGRUN: u1 = 0x0,
            padding: u7 = 0,
        }),
        /// offset: 0x0f
        reserved15: [1]u8,
        /// MODE0 Synchronization Busy Status
        /// offset: 0x10
        SYNCBUSY: mmio.Mmio(packed struct(u32) {
            /// Software Reset Busy
            SWRST: u1 = 0x0,
            /// Enable Bit Busy
            ENABLE: u1 = 0x0,
            /// FREQCORR Register Busy
            FREQCORR: u1 = 0x0,
            /// COUNT Register Busy
            COUNT: u1 = 0x0,
            reserved5: u1 = 0,
            /// COMP 0 Register Busy
            COMP0: u1 = 0x0,
            reserved15: u9 = 0,
            /// Count Synchronization Enable Bit Busy
            COUNTSYNC: u1 = 0x0,
            /// General Purpose 0 Register Busy
            GP0: u1 = 0x0,
            /// General Purpose 1 Register Busy
            GP1: u1 = 0x0,
            padding: u14 = 0,
        }),
        /// Frequency Correction
        /// offset: 0x14
        FREQCORR: mmio.Mmio(packed struct(u8) {
            /// Correction Value
            VALUE: u7 = 0x0,
            /// Correction Sign
            SIGN: u1 = 0x0,
        }),
        /// offset: 0x15
        reserved21: [3]u8,
        /// MODE0 Counter Value
        /// offset: 0x18
        COUNT: mmio.Mmio(packed struct(u32) {
            /// Counter Value
            COUNT: u32 = 0x0,
        }),
        /// offset: 0x1c
        reserved28: [4]u8,
        /// MODE0 Compare n Value
        /// offset: 0x20
        COMP0: mmio.Mmio(packed struct(u32) {
            /// Compare Value
            COMP: u32 = 0x0,
        }),
        /// offset: 0x24
        reserved36: [28]u8,
        /// General Purpose
        /// offset: 0x40
        GP0: mmio.Mmio(packed struct(u32) {
            /// General Purpose
            GP: u32 = 0x0,
        }),
        /// General Purpose
        /// offset: 0x44
        GP1: mmio.Mmio(packed struct(u32) {
            /// General Purpose
            GP: u32 = 0x0,
        }),
        /// offset: 0x48
        reserved72: [24]u8,
        /// Tamper Control
        /// offset: 0x60
        TAMPCTRL: mmio.Mmio(packed struct(u32) {
            /// Tamper Input 0 Action
            IN0ACT: enum(u2) {
                /// Off (Disabled)
                OFF = 0x0,
                /// Wake without timestamp
                WAKE = 0x1,
                /// Capture timestamp
                CAPTURE = 0x2,
                /// Compare IN0 to OUT
                ACTL = 0x3,
            } = .OFF,
            /// Tamper Input 1 Action
            IN1ACT: enum(u2) {
                /// Off (Disabled)
                OFF = 0x0,
                /// Wake without timestamp
                WAKE = 0x1,
                /// Capture timestamp
                CAPTURE = 0x2,
                /// Compare IN1 to OUT
                ACTL = 0x3,
            } = .OFF,
            /// Tamper Input 2 Action
            IN2ACT: enum(u2) {
                /// Off (Disabled)
                OFF = 0x0,
                /// Wake without timestamp
                WAKE = 0x1,
                /// Capture timestamp
                CAPTURE = 0x2,
                /// Compare IN2 to OUT
                ACTL = 0x3,
            } = .OFF,
            /// Tamper Input 3 Action
            IN3ACT: enum(u2) {
                /// Off (Disabled)
                OFF = 0x0,
                /// Wake without timestamp
                WAKE = 0x1,
                /// Capture timestamp
                CAPTURE = 0x2,
                /// Compare IN3 to OUT
                ACTL = 0x3,
            } = .OFF,
            /// Tamper Input 4 Action
            IN4ACT: enum(u2) {
                /// Off (Disabled)
                OFF = 0x0,
                /// Wake without timestamp
                WAKE = 0x1,
                /// Capture timestamp
                CAPTURE = 0x2,
                /// Compare IN4 to OUT
                ACTL = 0x3,
            } = .OFF,
            reserved16: u6 = 0,
            /// Tamper Level Select 0
            TAMLVL0: u1 = 0x0,
            /// Tamper Level Select 1
            TAMLVL1: u1 = 0x0,
            /// Tamper Level Select 2
            TAMLVL2: u1 = 0x0,
            /// Tamper Level Select 3
            TAMLVL3: u1 = 0x0,
            /// Tamper Level Select 4
            TAMLVL4: u1 = 0x0,
            reserved24: u3 = 0,
            /// Debouncer Enable 0
            DEBNC0: u1 = 0x0,
            /// Debouncer Enable 1
            DEBNC1: u1 = 0x0,
            /// Debouncer Enable 2
            DEBNC2: u1 = 0x0,
            /// Debouncer Enable 3
            DEBNC3: u1 = 0x0,
            /// Debouncer Enable 4
            DEBNC4: u1 = 0x0,
            padding: u3 = 0,
        }),
        /// MODE0 Timestamp
        /// offset: 0x64
        TIMESTAMP: mmio.Mmio(packed struct(u32) {
            /// Count Timestamp Value
            COUNT: u32 = 0x0,
        }),
        /// Tamper ID
        /// offset: 0x68
        TAMPID: mmio.Mmio(packed struct(u32) {
            /// Tamper Input 0 Detected
            TAMPID0: u1 = 0x0,
            /// Tamper Input 1 Detected
            TAMPID1: u1 = 0x0,
            /// Tamper Input 2 Detected
            TAMPID2: u1 = 0x0,
            /// Tamper Input 3 Detected
            TAMPID3: u1 = 0x0,
            /// Tamper Input 4 Detected
            TAMPID4: u1 = 0x0,
            reserved31: u26 = 0,
            /// Tamper Event Detected
            TAMPEVT: u1 = 0x0,
        }),
        /// offset: 0x6c
        reserved108: [20]u8,
        /// Backup
        /// offset: 0x80
        BKUP0: mmio.Mmio(packed struct(u32) {
            /// Backup
            BKUP: u32 = 0x0,
        }),
        /// Backup
        /// offset: 0x84
        BKUP1: mmio.Mmio(packed struct(u32) {
            /// Backup
            BKUP: u32 = 0x0,
        }),
        /// Backup
        /// offset: 0x88
        BKUP2: mmio.Mmio(packed struct(u32) {
            /// Backup
            BKUP: u32 = 0x0,
        }),
        /// Backup
        /// offset: 0x8c
        BKUP3: mmio.Mmio(packed struct(u32) {
            /// Backup
            BKUP: u32 = 0x0,
        }),
        /// Backup
        /// offset: 0x90
        BKUP4: mmio.Mmio(packed struct(u32) {
            /// Backup
            BKUP: u32 = 0x0,
        }),
        /// Backup
        /// offset: 0x94
        BKUP5: mmio.Mmio(packed struct(u32) {
            /// Backup
            BKUP: u32 = 0x0,
        }),
        /// Backup
        /// offset: 0x98
        BKUP6: mmio.Mmio(packed struct(u32) {
            /// Backup
            BKUP: u32 = 0x0,
        }),
        /// Backup
        /// offset: 0x9c
        BKUP7: mmio.Mmio(packed struct(u32) {
            /// Backup
            BKUP: u32 = 0x0,
        }),
    },
};
