const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Analog Digital Converter
pub const ADC = extern struct {
    /// Control A
    /// offset: 0x00
    CTRLA: mmio.Mmio(packed struct(u8) {
        /// Software Reset
        SWRST: u1 = 0x0,
        /// Enable
        ENABLE: u1 = 0x0,
        reserved6: u4 = 0,
        /// Run During Standby
        RUNSTDBY: u1 = 0x0,
        /// On Demand Control
        ONDEMAND: u1 = 0x0,
    }),
    /// Control B
    /// offset: 0x01
    CTRLB: mmio.Mmio(packed struct(u8) {
        /// Prescaler Configuration
        PRESCALER: enum(u3) {
            /// Peripheral clock divided by 2
            DIV2 = 0x0,
            /// Peripheral clock divided by 4
            DIV4 = 0x1,
            /// Peripheral clock divided by 8
            DIV8 = 0x2,
            /// Peripheral clock divided by 16
            DIV16 = 0x3,
            /// Peripheral clock divided by 32
            DIV32 = 0x4,
            /// Peripheral clock divided by 64
            DIV64 = 0x5,
            /// Peripheral clock divided by 128
            DIV128 = 0x6,
            /// Peripheral clock divided by 256
            DIV256 = 0x7,
        } = .DIV2,
        padding: u5 = 0,
    }),
    /// Reference Control
    /// offset: 0x02
    REFCTRL: mmio.Mmio(packed struct(u8) {
        /// Reference Selection
        REFSEL: enum(u4) {
            /// Internal Bandgap Reference
            INTREF = 0x0,
            /// 1/1.6 VDDANA
            INTVCC0 = 0x1,
            /// 1/2 VDDANA
            INTVCC1 = 0x2,
            /// External Reference
            AREFA = 0x3,
            /// External Reference
            AREFB = 0x4,
            /// VCCANA
            INTVCC2 = 0x5,
            _,
        } = .INTREF,
        reserved7: u3 = 0,
        /// Reference Buffer Offset Compensation Enable
        REFCOMP: u1 = 0x0,
    }),
    /// Event Control
    /// offset: 0x03
    EVCTRL: mmio.Mmio(packed struct(u8) {
        /// Flush Event Input Enable
        FLUSHEI: u1 = 0x0,
        /// Start Conversion Event Input Enable
        STARTEI: u1 = 0x0,
        /// Flush Event Invert Enable
        FLUSHINV: u1 = 0x0,
        /// Satrt Event Invert Enable
        STARTINV: u1 = 0x0,
        /// Result Ready Event Out
        RESRDYEO: u1 = 0x0,
        /// Window Monitor Event Out
        WINMONEO: u1 = 0x0,
        padding: u2 = 0,
    }),
    /// Interrupt Enable Clear
    /// offset: 0x04
    INTENCLR: mmio.Mmio(packed struct(u8) {
        /// Result Ready Interrupt Disable
        RESRDY: u1 = 0x0,
        /// Overrun Interrupt Disable
        OVERRUN: u1 = 0x0,
        /// Window Monitor Interrupt Disable
        WINMON: u1 = 0x0,
        padding: u5 = 0,
    }),
    /// Interrupt Enable Set
    /// offset: 0x05
    INTENSET: mmio.Mmio(packed struct(u8) {
        /// Result Ready Interrupt Enable
        RESRDY: u1 = 0x0,
        /// Overrun Interrupt Enable
        OVERRUN: u1 = 0x0,
        /// Window Monitor Interrupt Enable
        WINMON: u1 = 0x0,
        padding: u5 = 0,
    }),
    /// Interrupt Flag Status and Clear
    /// offset: 0x06
    INTFLAG: mmio.Mmio(packed struct(u8) {
        /// Result Ready Interrupt Flag
        RESRDY: u1 = 0x0,
        /// Overrun Interrupt Flag
        OVERRUN: u1 = 0x0,
        /// Window Monitor Interrupt Flag
        WINMON: u1 = 0x0,
        padding: u5 = 0,
    }),
    /// Sequence Status
    /// offset: 0x07
    SEQSTATUS: mmio.Mmio(packed struct(u8) {
        /// Sequence State
        SEQSTATE: u5 = 0x0,
        reserved7: u2 = 0,
        /// Sequence Busy
        SEQBUSY: u1 = 0x0,
    }),
    /// Input Control
    /// offset: 0x08
    INPUTCTRL: mmio.Mmio(packed struct(u16) {
        /// Positive Mux Input Selection
        MUXPOS: enum(u5) {
            /// ADC AIN0 Pin
            AIN0 = 0x0,
            /// ADC AIN1 Pin
            AIN1 = 0x1,
            /// ADC AIN2 Pin
            AIN2 = 0x2,
            /// ADC AIN3 Pin
            AIN3 = 0x3,
            /// ADC AIN4 Pin
            AIN4 = 0x4,
            /// ADC AIN5 Pin
            AIN5 = 0x5,
            /// ADC AIN6 Pin
            AIN6 = 0x6,
            /// ADC AIN7 Pin
            AIN7 = 0x7,
            /// ADC AIN8 Pin
            AIN8 = 0x8,
            /// ADC AIN9 Pin
            AIN9 = 0x9,
            /// ADC AIN10 Pin
            AIN10 = 0xa,
            /// ADC AIN11 Pin
            AIN11 = 0xb,
            /// ADC AIN12 Pin
            AIN12 = 0xc,
            /// ADC AIN13 Pin
            AIN13 = 0xd,
            /// ADC AIN14 Pin
            AIN14 = 0xe,
            /// ADC AIN15 Pin
            AIN15 = 0xf,
            /// ADC AIN16 Pin
            AIN16 = 0x10,
            /// ADC AIN17 Pin
            AIN17 = 0x11,
            /// ADC AIN18 Pin
            AIN18 = 0x12,
            /// ADC AIN19 Pin
            AIN19 = 0x13,
            /// Temperature Sensor
            TEMP = 0x18,
            /// Bandgap Voltage
            BANDGAP = 0x19,
            /// 1/4 Scaled Core Supply
            SCALEDCOREVCC = 0x1a,
            /// 1/4 Scaled I/O Supply
            SCALEDIOVCC = 0x1b,
            /// 1/4 Scaled VBAT Supply
            SCALEDVBAT = 0x1d,
            /// CTAT output
            CTAT = 0x1e,
            _,
        } = .AIN0,
        reserved8: u3 = 0,
        /// Negative Mux Input Selection
        MUXNEG: enum(u5) {
            /// ADC AIN0 Pin
            AIN0 = 0x0,
            /// ADC AIN1 Pin
            AIN1 = 0x1,
            /// ADC AIN2 Pin
            AIN2 = 0x2,
            /// ADC AIN3 Pin
            AIN3 = 0x3,
            /// ADC AIN4 Pin
            AIN4 = 0x4,
            /// ADC AIN5 Pin
            AIN5 = 0x5,
            /// ADC AIN6 Pin
            AIN6 = 0x6,
            /// ADC AIN7 Pin
            AIN7 = 0x7,
            _,
        } = .AIN0,
        padding: u3 = 0,
    }),
    /// Control C
    /// offset: 0x0a
    CTRLC: mmio.Mmio(packed struct(u16) {
        /// Differential Mode
        DIFFMODE: u1 = 0x0,
        /// Left-Adjusted Result
        LEFTADJ: u1 = 0x0,
        /// Free Running Mode
        FREERUN: u1 = 0x0,
        /// Digital Correction Logic Enable
        CORREN: u1 = 0x0,
        /// Conversion Result Resolution
        RESSEL: enum(u2) {
            /// 12-bit result
            @"12BIT" = 0x0,
            /// For averaging mode output
            @"16BIT" = 0x1,
            /// 10-bit result
            @"10BIT" = 0x2,
            /// 8-bit result
            @"8BIT" = 0x3,
        } = .@"12BIT",
        reserved7: u1 = 0,
        /// Rail-to-Rail mode enable
        R2R: u1 = 0x0,
        /// Window Monitor Mode
        WINMODE: enum(u3) {
            /// No window mode (default)
            DISABLE = 0x0,
            /// RESULT > WINLT
            MODE1 = 0x1,
            /// RESULT < WINUT
            MODE2 = 0x2,
            /// WINLT < RESULT < WINUT
            MODE3 = 0x3,
            /// !(WINLT < RESULT < WINUT)
            MODE4 = 0x4,
            _,
        } = .DISABLE,
        reserved12: u1 = 0,
        /// Dual Mode Trigger Selection
        DUALSEL: enum(u2) {
            /// Start event or software trigger will start a conversion on both ADCs
            BOTH = 0x0,
            /// START event or software trigger will alternatingly start a conversion on ADC0 and ADC1
            INTERLEAVE = 0x1,
            _,
        } = .BOTH,
        padding: u2 = 0,
    }),
    /// Average Control
    /// offset: 0x0c
    AVGCTRL: mmio.Mmio(packed struct(u8) {
        /// Number of Samples to be Collected
        SAMPLENUM: enum(u4) {
            /// 1 sample
            @"1" = 0x0,
            /// 2 samples
            @"2" = 0x1,
            /// 4 samples
            @"4" = 0x2,
            /// 8 samples
            @"8" = 0x3,
            /// 16 samples
            @"16" = 0x4,
            /// 32 samples
            @"32" = 0x5,
            /// 64 samples
            @"64" = 0x6,
            /// 128 samples
            @"128" = 0x7,
            /// 256 samples
            @"256" = 0x8,
            /// 512 samples
            @"512" = 0x9,
            /// 1024 samples
            @"1024" = 0xa,
            _,
        } = .@"1",
        /// Adjusting Result / Division Coefficient
        ADJRES: u3 = 0x0,
        padding: u1 = 0,
    }),
    /// Sample Time Control
    /// offset: 0x0d
    SAMPCTRL: mmio.Mmio(packed struct(u8) {
        /// Sampling Time Length
        SAMPLEN: u6 = 0x0,
        reserved7: u1 = 0,
        /// Comparator Offset Compensation Enable
        OFFCOMP: u1 = 0x0,
    }),
    /// Window Monitor Lower Threshold
    /// offset: 0x0e
    WINLT: mmio.Mmio(packed struct(u16) {
        /// Window Lower Threshold
        WINLT: u16 = 0x0,
    }),
    /// Window Monitor Upper Threshold
    /// offset: 0x10
    WINUT: mmio.Mmio(packed struct(u16) {
        /// Window Upper Threshold
        WINUT: u16 = 0x0,
    }),
    /// Gain Correction
    /// offset: 0x12
    GAINCORR: mmio.Mmio(packed struct(u16) {
        /// Gain Correction Value
        GAINCORR: u12 = 0x0,
        padding: u4 = 0,
    }),
    /// Offset Correction
    /// offset: 0x14
    OFFSETCORR: mmio.Mmio(packed struct(u16) {
        /// Offset Correction Value
        OFFSETCORR: u12 = 0x0,
        padding: u4 = 0,
    }),
    /// offset: 0x16
    reserved22: [2]u8,
    /// Software Trigger
    /// offset: 0x18
    SWTRIG: mmio.Mmio(packed struct(u8) {
        /// ADC Flush
        FLUSH: u1 = 0x0,
        /// Start ADC Conversion
        START: u1 = 0x0,
        padding: u6 = 0,
    }),
    /// offset: 0x19
    reserved25: [3]u8,
    /// Debug Control
    /// offset: 0x1c
    DBGCTRL: mmio.Mmio(packed struct(u8) {
        /// Debug Run
        DBGRUN: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// offset: 0x1d
    reserved29: [3]u8,
    /// Synchronization Busy
    /// offset: 0x20
    SYNCBUSY: mmio.Mmio(packed struct(u16) {
        /// SWRST Synchronization Busy
        SWRST: u1 = 0x0,
        /// ENABLE Synchronization Busy
        ENABLE: u1 = 0x0,
        /// INPUTCTRL Synchronization Busy
        INPUTCTRL: u1 = 0x0,
        /// CTRLC Synchronization Busy
        CTRLC: u1 = 0x0,
        /// AVGCTRL Synchronization Busy
        AVGCTRL: u1 = 0x0,
        /// SAMPCTRL Synchronization Busy
        SAMPCTRL: u1 = 0x0,
        /// WINLT Synchronization Busy
        WINLT: u1 = 0x0,
        /// WINUT Synchronization Busy
        WINUT: u1 = 0x0,
        /// GAINCORR Synchronization Busy
        GAINCORR: u1 = 0x0,
        /// OFFSETCTRL Synchronization Busy
        OFFSETCORR: u1 = 0x0,
        /// SWTRG Synchronization Busy
        SWTRIG: u1 = 0x0,
        padding: u5 = 0,
    }),
    /// offset: 0x22
    reserved34: [2]u8,
    /// Result
    /// offset: 0x24
    RESULT: mmio.Mmio(packed struct(u16) {
        /// Result Value
        RESULT: u16 = 0x0,
    }),
    /// offset: 0x26
    reserved38: [2]u8,
    /// Sequence Control
    /// offset: 0x28
    SEQCTRL: mmio.Mmio(packed struct(u32) {
        /// Enable Positive Input in the Sequence
        SEQEN: u32 = 0x0,
    }),
    /// Calibration
    /// offset: 0x2c
    CALIB: mmio.Mmio(packed struct(u16) {
        /// Bias Comparator Scaling
        BIASCOMP: u3 = 0x0,
        reserved8: u5 = 0,
        /// Bias Reference Buffer Scaling
        BIASREFBUF: u3 = 0x0,
        padding: u5 = 0,
    }),
};
