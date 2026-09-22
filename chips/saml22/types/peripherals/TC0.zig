const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Basic Timer Counter 0
pub const TC0 = extern struct {
    /// 8-bit Counter Mode
    /// offset: 0x00
    COUNT8: extern struct {
        /// Control A
        /// offset: 0x00
        CTRLA: mmio.Mmio(packed struct(u32) {
            /// Software Reset
            SWRST: u1 = 0x0,
            /// Enable
            ENABLE: u1 = 0x0,
            /// Timer Counter Mode
            MODE: enum(u2) {
                /// Counter in 16-bit mode
                COUNT16 = 0x0,
                /// Counter in 8-bit mode
                COUNT8 = 0x1,
                /// Counter in 32-bit mode
                COUNT32 = 0x2,
                _,
            } = .COUNT16,
            /// Prescaler and Counter Synchronization
            PRESCSYNC: enum(u2) {
                /// Reload or reset the counter on next generic clock
                GCLK = 0x0,
                /// Reload or reset the counter on next prescaler clock
                PRESC = 0x1,
                /// Reload or reset the counter on next generic clock and reset the prescaler counter
                RESYNC = 0x2,
                _,
            } = .GCLK,
            /// Run during Standby
            RUNSTDBY: u1 = 0x0,
            /// Clock On Demand
            ONDEMAND: u1 = 0x0,
            /// Prescaler
            PRESCALER: enum(u3) {
                /// Prescaler: GCLK_TC
                DIV1 = 0x0,
                /// Prescaler: GCLK_TC/2
                DIV2 = 0x1,
                /// Prescaler: GCLK_TC/4
                DIV4 = 0x2,
                /// Prescaler: GCLK_TC/8
                DIV8 = 0x3,
                /// Prescaler: GCLK_TC/16
                DIV16 = 0x4,
                /// Prescaler: GCLK_TC/64
                DIV64 = 0x5,
                /// Prescaler: GCLK_TC/256
                DIV256 = 0x6,
                /// Prescaler: GCLK_TC/1024
                DIV1024 = 0x7,
            } = .DIV1,
            /// Auto Lock
            ALOCK: u1 = 0x0,
            reserved16: u4 = 0,
            /// Capture Channel 0 Enable
            CAPTEN0: u1 = 0x0,
            /// Capture Channel 1 Enable
            CAPTEN1: u1 = 0x0,
            reserved20: u2 = 0,
            /// Capture On Pin 0 Enable
            COPEN0: u1 = 0x0,
            /// Capture On Pin 1 Enable
            COPEN1: u1 = 0x0,
            padding: u10 = 0,
        }),
        /// Control B Clear
        /// offset: 0x04
        CTRLBCLR: mmio.Mmio(packed struct(u8) {
            /// Counter Direction
            DIR: u1 = 0x0,
            /// Lock Update
            LUPD: u1 = 0x0,
            /// One-Shot on Counter
            ONESHOT: u1 = 0x0,
            reserved5: u2 = 0,
            /// Command
            CMD: enum(u3) {
                /// No action
                NONE = 0x0,
                /// Force a start, restart or retrigger
                RETRIGGER = 0x1,
                /// Force a stop
                STOP = 0x2,
                /// Force update of double-buffered register
                UPDATE = 0x3,
                /// Force a read synchronization of COUNT
                READSYNC = 0x4,
                /// One-shot DMA trigger
                DMAOS = 0x5,
                _,
            } = .NONE,
        }),
        /// Control B Set
        /// offset: 0x05
        CTRLBSET: mmio.Mmio(packed struct(u8) {
            /// Counter Direction
            DIR: u1 = 0x0,
            /// Lock Update
            LUPD: u1 = 0x0,
            /// One-Shot on Counter
            ONESHOT: u1 = 0x0,
            reserved5: u2 = 0,
            /// Command
            CMD: enum(u3) {
                /// No action
                NONE = 0x0,
                /// Force a start, restart or retrigger
                RETRIGGER = 0x1,
                /// Force a stop
                STOP = 0x2,
                /// Force update of double-buffered register
                UPDATE = 0x3,
                /// Force a read synchronization of COUNT
                READSYNC = 0x4,
                /// One-shot DMA trigger
                DMAOS = 0x5,
                _,
            } = .NONE,
        }),
        /// Event Control
        /// offset: 0x06
        EVCTRL: mmio.Mmio(packed struct(u16) {
            /// Event Action
            EVACT: enum(u3) {
                /// Event action disabled
                OFF = 0x0,
                /// Start, restart or retrigger TC on event
                RETRIGGER = 0x1,
                /// Count on event
                COUNT = 0x2,
                /// Start TC on event
                START = 0x3,
                /// Time stamp capture
                STAMP = 0x4,
                /// Period catured in CC0, pulse width in CC1
                PPW = 0x5,
                /// Period catured in CC1, pulse width in CC0
                PWP = 0x6,
                /// Pulse width capture
                PW = 0x7,
            } = .OFF,
            reserved4: u1 = 0,
            /// TC Event Input Polarity
            TCINV: u1 = 0x0,
            /// TC Event Enable
            TCEI: u1 = 0x0,
            reserved8: u2 = 0,
            /// Event Output Enable
            OVFEO: u1 = 0x0,
            reserved12: u3 = 0,
            /// MC Event Output Enable 0
            MCEO0: u1 = 0x0,
            /// MC Event Output Enable 1
            MCEO1: u1 = 0x0,
            padding: u2 = 0,
        }),
        /// Interrupt Enable Clear
        /// offset: 0x08
        INTENCLR: mmio.Mmio(packed struct(u8) {
            /// OVF Interrupt Disable
            OVF: u1 = 0x0,
            /// ERR Interrupt Disable
            ERR: u1 = 0x0,
            reserved4: u2 = 0,
            /// MC Interrupt Disable 0
            MC0: u1 = 0x0,
            /// MC Interrupt Disable 1
            MC1: u1 = 0x0,
            padding: u2 = 0,
        }),
        /// Interrupt Enable Set
        /// offset: 0x09
        INTENSET: mmio.Mmio(packed struct(u8) {
            /// OVF Interrupt Enable
            OVF: u1 = 0x0,
            /// ERR Interrupt Enable
            ERR: u1 = 0x0,
            reserved4: u2 = 0,
            /// MC Interrupt Enable 0
            MC0: u1 = 0x0,
            /// MC Interrupt Enable 1
            MC1: u1 = 0x0,
            padding: u2 = 0,
        }),
        /// Interrupt Flag Status and Clear
        /// offset: 0x0a
        INTFLAG: mmio.Mmio(packed struct(u8) {
            /// OVF Interrupt Flag
            OVF: u1 = 0x0,
            /// ERR Interrupt Flag
            ERR: u1 = 0x0,
            reserved4: u2 = 0,
            /// MC Interrupt Flag 0
            MC0: u1 = 0x0,
            /// MC Interrupt Flag 1
            MC1: u1 = 0x0,
            padding: u2 = 0,
        }),
        /// Status
        /// offset: 0x0b
        STATUS: mmio.Mmio(packed struct(u8) {
            /// Stop Status Flag
            STOP: u1 = 0x1,
            /// Slave Status Flag
            SLAVE: u1 = 0x0,
            reserved3: u1 = 0,
            /// Synchronization Busy Status
            PERBUFV: u1 = 0x0,
            /// Compare channel buffer 0 valid
            CCBUFV0: u1 = 0x0,
            /// Compare channel buffer 1 valid
            CCBUFV1: u1 = 0x0,
            padding: u2 = 0,
        }),
        /// Waveform Generation Control
        /// offset: 0x0c
        WAVE: mmio.Mmio(packed struct(u8) {
            /// Waveform Generation Mode
            WAVEGEN: enum(u2) {
                /// Normal frequency
                NFRQ = 0x0,
                /// Match frequency
                MFRQ = 0x1,
                /// Normal PWM
                NPWM = 0x2,
                /// Match PWM
                MPWM = 0x3,
            } = .NFRQ,
            padding: u6 = 0,
        }),
        /// Control C
        /// offset: 0x0d
        DRVCTRL: mmio.Mmio(packed struct(u8) {
            /// Output Waveform Invert Enable 0
            INVEN0: u1 = 0x0,
            /// Output Waveform Invert Enable 1
            INVEN1: u1 = 0x0,
            padding: u6 = 0,
        }),
        /// offset: 0x0e
        reserved14: [1]u8,
        /// Debug Control
        /// offset: 0x0f
        DBGCTRL: mmio.Mmio(packed struct(u8) {
            /// Run During Debug
            DBGRUN: u1 = 0x0,
            padding: u7 = 0,
        }),
        /// Synchronization Status
        /// offset: 0x10
        SYNCBUSY: mmio.Mmio(packed struct(u32) {
            /// swrst
            SWRST: u1 = 0x0,
            /// enable
            ENABLE: u1 = 0x0,
            /// CTRLB
            CTRLB: u1 = 0x0,
            /// STATUS
            STATUS: u1 = 0x0,
            /// Counter
            COUNT: u1 = 0x0,
            /// Period
            PER: u1 = 0x0,
            /// Compare Channel 0
            CC0: u1 = 0x0,
            /// Compare Channel 1
            CC1: u1 = 0x0,
            padding: u24 = 0,
        }),
        /// COUNT8 Count
        /// offset: 0x14
        COUNT: mmio.Mmio(packed struct(u8) {
            /// Counter Value
            COUNT: u8 = 0x0,
        }),
        /// offset: 0x15
        reserved21: [6]u8,
        /// COUNT8 Period
        /// offset: 0x1b
        PER: mmio.Mmio(packed struct(u8) {
            /// Period Value
            PER: u8 = 0xFF,
        }),
        /// COUNT8 Compare and Capture
        /// offset: 0x1c
        CC0: mmio.Mmio(packed struct(u8) {
            /// Counter/Compare Value
            CC: u8 = 0x0,
        }),
        /// COUNT8 Compare and Capture
        /// offset: 0x1d
        CC1: mmio.Mmio(packed struct(u8) {
            /// Counter/Compare Value
            CC: u8 = 0x0,
        }),
        /// offset: 0x1e
        reserved30: [17]u8,
        /// COUNT8 Period Buffer
        /// offset: 0x2f
        PERBUF: mmio.Mmio(packed struct(u8) {
            /// Period Buffer Value
            PERBUF: u8 = 0xFF,
        }),
        /// COUNT8 Compare and Capture Buffer
        /// offset: 0x30
        CCBUF0: mmio.Mmio(packed struct(u8) {
            /// Counter/Compare Buffer Value
            CCBUF: u8 = 0x0,
        }),
        /// COUNT8 Compare and Capture Buffer
        /// offset: 0x31
        CCBUF1: mmio.Mmio(packed struct(u8) {
            /// Counter/Compare Buffer Value
            CCBUF: u8 = 0x0,
        }),
    },
};
