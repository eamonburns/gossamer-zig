const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Segment Liquid Crystal Display Controller
pub const SLCD = extern struct {
    /// Control A
    /// offset: 0x00
    CTRLA: mmio.Mmio(packed struct(u32) {
        /// Software Reset
        SWRST: u1 = 0x0,
        /// Enable
        ENABLE: u1 = 0x0,
        /// Duty Ratio
        DUTY: enum(u3) {
            /// Static duty
            STATIC = 0x0,
            /// 1/2 duty
            HALF = 0x1,
            /// 1/3 duty
            THIRD = 0x2,
            /// 1/4 duty
            FOURTH = 0x3,
            /// 1/6 duty
            SIXTH = 0x4,
            /// 1/8 duty
            EIGHT = 0x5,
            _,
        } = .STATIC,
        /// Waveform Mode
        WMOD: enum(u1) {
            /// Low Power Waveform Mode
            LP = 0x0,
            /// Standard Waveform Mode
            STD = 0x1,
        } = .LP,
        /// Run in Standby
        RUNSTDBY: u1 = 0x0,
        reserved8: u1 = 0,
        /// Clock Prescaler
        PRESC: enum(u2) {
            /// 16
            PRESC16 = 0x0,
            /// 32
            PRESC32 = 0x1,
            /// 64
            PRESC64 = 0x2,
            /// 128
            PRESC128 = 0x3,
        } = .PRESC16,
        reserved12: u2 = 0,
        /// Clock Divider
        CKDIV: u3 = 0x0,
        reserved16: u1 = 0,
        /// Bias Setting
        BIAS: enum(u2) {
            /// Static
            STATIC = 0x0,
            /// 1/2 bias
            HALF = 0x1,
            /// 1/3 bias
            THIRD = 0x2,
            /// 1/4 bias
            FOURTH = 0x3,
        } = .STATIC,
        reserved19: u1 = 0,
        /// External VLCD
        XVLCD: u1 = 0x1,
        /// Power Refresh Frequency
        PRF: enum(u2) {
            /// 2kHz
            PR2000 = 0x0,
            /// 1kHz
            PR1000 = 0x1,
            /// 500Hz
            PR500 = 0x2,
            /// 250Hz
            PR250 = 0x3,
        } = .PR1000,
        /// Display Memory Update Frame Counter Selection
        DMFCS: enum(u2) {
            /// Frame Counter 0
            FC0 = 0x0,
            /// Frame Counter 1
            FC1 = 0x1,
            /// Frame Counter 2
            FC2 = 0x2,
            /// Frame Counter event to DMU is forced to 0
            NFC = 0x3,
        } = .NFC,
        /// Reference Refresh Frequency
        RRF: enum(u3) {
            /// 2kHz
            RR2000 = 0x0,
            /// 1kHz
            RR1000 = 0x1,
            /// 500Hz
            RR500 = 0x2,
            /// 250Hz
            RR250 = 0x3,
            /// 125Hz
            RR125 = 0x4,
            /// 62.5Hz
            RR62 = 0x5,
            _,
        } = .RR250,
        padding: u5 = 0,
    }),
    /// Control B
    /// offset: 0x04
    CTRLB: mmio.Mmio(packed struct(u16) {
        /// Bias Buffer Enable Duration
        BBD: u4 = 0x0,
        reserved7: u3 = 0,
        /// Bias Buffer Enable
        BBEN: u1 = 0x0,
        /// Low Resistance Enable Duration
        LRD: u4 = 0x0,
        reserved15: u3 = 0,
        /// Low Resistance Enable
        LREN: u1 = 0x0,
    }),
    /// Control C
    /// offset: 0x06
    CTRLC: mmio.Mmio(packed struct(u16) {
        /// Clear Display Memory
        CLEAR: u1 = 0x0,
        /// Lock Shadow Memory
        LOCK: u1 = 0x0,
        /// Automated Bit Mapping Enable
        ABMEN: u1 = 0x0,
        /// Automated Character Mapping Enable
        ACMEN: u1 = 0x0,
        /// Contrast Adjustment
        CTST: u4 = 0x0,
        /// LCD Power Macro Power mode
        LPPM: enum(u2) {
            /// LCD power automatically select regualation mode or pump mode
            AUTO = 0x0,
            /// LCD power use step-up pump loop only
            STEPUP = 0x1,
            /// LCD power use step-down drop-out regulation loop only
            STEPDOWN = 0x2,
            _,
        } = .AUTO,
        padding: u6 = 0,
    }),
    /// Control D
    /// offset: 0x08
    CTRLD: mmio.Mmio(packed struct(u8) {
        /// Blank LCD
        BLANK: u1 = 0x0,
        /// Blinking Enable
        BLINK: u1 = 0x0,
        /// Circular Shift Register Enable
        CSREN: u1 = 0x0,
        reserved4: u1 = 0,
        /// Frame Counter 0 Enable
        FC0EN: u1 = 0x0,
        /// Frame Counter 1 Enable
        FC1EN: u1 = 0x0,
        /// Frame Counter 2 Enable
        FC2EN: u1 = 0x0,
        /// Display enable
        DISPEN: u1 = 0x1,
    }),
    /// offset: 0x09
    reserved9: [3]u8,
    /// Event Control
    /// offset: 0x0c
    EVCTRL: mmio.Mmio(packed struct(u8) {
        /// Frame Counter 0 Overflow Event Output Enable
        FC0OEO: u1 = 0x0,
        /// Frame Counter 1 Overflow Event Output Enable
        FC1OEO: u1 = 0x0,
        /// Frame Counter 2 Overflow Event Output Enable
        FC2OEO: u1 = 0x0,
        padding: u5 = 0,
    }),
    /// Interrupt Enable Clear
    /// offset: 0x0d
    INTENCLR: mmio.Mmio(packed struct(u8) {
        /// Frame Counter 0 Overflow Interrupt Disable
        FC0O: u1 = 0x0,
        /// Frame Counter 1 Overflow Interrupt Disable
        FC1O: u1 = 0x0,
        /// Frame Counter 2 Overflow Interrupt Disable
        FC2O: u1 = 0x0,
        /// VLCD Ready Toggle Interrupt Disable
        VLCDRT: u1 = 0x0,
        /// VLCD Status Toggle Interrupt Disable
        VLCDST: u1 = 0x0,
        /// Pump Run Status Toggle Interrupt Disable
        PRST: u1 = 0x0,
        padding: u2 = 0,
    }),
    /// Interrupt Enable Set
    /// offset: 0x0e
    INTENSET: mmio.Mmio(packed struct(u8) {
        /// Frame Counter 0 Overflow Interrupt Enable
        FC0O: u1 = 0x0,
        /// Frame Counter 1 Overflow Interrupt Enable
        FC1O: u1 = 0x0,
        /// Frame Counter 2 Overflow Interrupt Enable
        FC2O: u1 = 0x0,
        /// VLCD Ready Toggle Interrupt Enable
        VLCDRT: u1 = 0x0,
        /// VLCD Status Toggle Interrupt Enable
        VLCDST: u1 = 0x0,
        /// Pump Run Status Toggle Interrupt Enable
        PRST: u1 = 0x0,
        padding: u2 = 0,
    }),
    /// Interrupt Flag Status and Clear
    /// offset: 0x0f
    INTFLAG: mmio.Mmio(packed struct(u8) {
        /// Frame Counter 0 Overflow
        FC0O: u1 = 0x0,
        /// Frame Counter 1 Overflow
        FC1O: u1 = 0x0,
        /// Frame Counter 2 Overflow
        FC2O: u1 = 0x0,
        /// VLCD Ready Toggle
        VLCDRT: u1 = 0x0,
        /// VLCD Status Toggle
        VLCDST: u1 = 0x0,
        /// Pump Run Status Toggle
        PRST: u1 = 0x0,
        padding: u2 = 0,
    }),
    /// Status
    /// offset: 0x10
    STATUS: mmio.Mmio(packed struct(u8) {
        /// VLCD Ready
        VLCDR: u1 = 0x0,
        /// LCD Charge Pump is Running
        PRUN: u1 = 0x0,
        /// VLCD Status
        VLCDS: u1 = 0x0,
        /// Character mapping write busy
        CMWRBUSY: u1 = 0x0,
        /// ACM state machine busy
        ACMBUSY: u1 = 0x0,
        /// ABM state machine busy
        ABMBUSY: u1 = 0x0,
        padding: u2 = 0,
    }),
    /// offset: 0x11
    reserved17: [3]u8,
    /// Synchronization Busy
    /// offset: 0x14
    SYNCBUSY: mmio.Mmio(packed struct(u32) {
        /// Software Reset
        SWRST: u1 = 0x0,
        /// Enable
        ENABLE: u1 = 0x0,
        /// Control D
        CTRLD: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// Frame Counter 0 Configuration
    /// offset: 0x18
    FC0: mmio.Mmio(packed struct(u8) {
        /// Frame Counter Overflow Value
        OVF: u5 = 0x0,
        reserved7: u2 = 0,
        /// Prescaler Bypass
        PB: u1 = 0x0,
    }),
    /// Frame Counter 1 Configuration
    /// offset: 0x19
    FC1: mmio.Mmio(packed struct(u8) {
        /// Frame Counter Overflow Value
        OVF: u5 = 0x0,
        reserved7: u2 = 0,
        /// Prescaler Bypass
        PB: u1 = 0x0,
    }),
    /// Frame Counter 2 Configuration
    /// offset: 0x1a
    FC2: mmio.Mmio(packed struct(u8) {
        /// Frame Counter Overflow Value
        OVF: u5 = 0x0,
        reserved7: u2 = 0,
        /// Prescaler Bypass
        PB: u1 = 0x0,
    }),
    /// offset: 0x1b
    reserved27: [1]u8,
    /// LCD Pin Enable Low
    /// offset: 0x1c
    LPENL: mmio.Mmio(packed struct(u32) {
        /// LCD Pin Enable
        LPEN: u32 = 0x0,
    }),
    /// LCD Pin Enable High
    /// offset: 0x20
    LPENH: mmio.Mmio(packed struct(u32) {
        /// LCD Pin Enable
        LPEN: u20 = 0x0,
        padding: u12 = 0,
    }),
    /// Segments Data Low for COM0 Line
    /// offset: 0x24
    SDATAL0: mmio.Mmio(packed struct(u32) {
        /// Segments Data
        SDATA: u32 = 0x0,
    }),
    /// Segments Data High for COM0 Line
    /// offset: 0x28
    SDATAH0: mmio.Mmio(packed struct(u32) {
        /// Segments Data
        SDATA: u12 = 0x0,
        padding: u20 = 0,
    }),
    /// Segments Data Low for COM1 Line
    /// offset: 0x2c
    SDATAL1: mmio.Mmio(packed struct(u32) {
        /// Segments Data
        SDATA: u32 = 0x0,
    }),
    /// Segments Data High for COM1 Line
    /// offset: 0x30
    SDATAH1: mmio.Mmio(packed struct(u32) {
        /// Segments Data
        SDATA: u12 = 0x0,
        padding: u20 = 0,
    }),
    /// Segments Data Low for COM2 Line
    /// offset: 0x34
    SDATAL2: mmio.Mmio(packed struct(u32) {
        /// Segments Data
        SDATA: u32 = 0x0,
    }),
    /// Segments Data High for COM2 Line
    /// offset: 0x38
    SDATAH2: mmio.Mmio(packed struct(u32) {
        /// Segments Data
        SDATA: u12 = 0x0,
        padding: u20 = 0,
    }),
    /// Segments Data Low for COM3 Line
    /// offset: 0x3c
    SDATAL3: mmio.Mmio(packed struct(u32) {
        /// Segments Data
        SDATA: u32 = 0x0,
    }),
    /// Segments Data High for COM3 Line
    /// offset: 0x40
    SDATAH3: mmio.Mmio(packed struct(u32) {
        /// Segments Data
        SDATA: u12 = 0x0,
        padding: u20 = 0,
    }),
    /// Segments Data Low for COM4 Line
    /// offset: 0x44
    SDATAL4: mmio.Mmio(packed struct(u32) {
        /// Segments Data
        SDATA: u32 = 0x0,
    }),
    /// Segments Data High for COM4 Line
    /// offset: 0x48
    SDATAH4: mmio.Mmio(packed struct(u32) {
        /// Segments Data
        SDATA: u10 = 0x0,
        padding: u22 = 0,
    }),
    /// Segments Data Low for COM5 Line
    /// offset: 0x4c
    SDATAL5: mmio.Mmio(packed struct(u32) {
        /// Segments Data
        SDATA: u32 = 0x0,
    }),
    /// Segments Data High for COM5 Line
    /// offset: 0x50
    SDATAH5: mmio.Mmio(packed struct(u32) {
        /// Segments Data
        SDATA: u10 = 0x0,
        padding: u22 = 0,
    }),
    /// Segments Data Low for COM6 Line
    /// offset: 0x54
    SDATAL6: mmio.Mmio(packed struct(u32) {
        /// Segments Data
        SDATA: u32 = 0x0,
    }),
    /// Segments Data High for COM6 Line
    /// offset: 0x58
    SDATAH6: mmio.Mmio(packed struct(u32) {
        /// Segments Data
        SDATA: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// Segments Data Low for COM7 Line
    /// offset: 0x5c
    SDATAL7: mmio.Mmio(packed struct(u32) {
        /// Segments Data
        SDATA: u32 = 0x0,
    }),
    /// Segments Data High for COM7 Line
    /// offset: 0x60
    SDATAH7: mmio.Mmio(packed struct(u32) {
        /// Segments Data
        SDATA: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// Indirect Segments Data Access
    /// offset: 0x64
    ISDATA: mmio.Mmio(packed struct(u32) {
        /// Segments Data
        SDATA: u8 = 0x0,
        /// Segments Data Mask
        SDMASK: u8 = 0x0,
        /// Byte Offset
        OFF: u6 = 0x0,
        padding: u10 = 0,
    }),
    /// Blink Configuration
    /// offset: 0x68
    BCFG: mmio.Mmio(packed struct(u32) {
        /// Blinking Mode
        MODE: enum(u1) {
            /// Blink all segments
            BLINKALL = 0x0,
            /// Blink selected segments
            BLINKSEL = 0x1,
        } = .BLINKALL,
        /// Frame Counter Selection
        FCS: enum(u2) {
            /// Frame Counter 0
            FC0 = 0x0,
            /// Frame Counter 1
            FC1 = 0x1,
            /// Frame Counter 2
            FC2 = 0x2,
            _,
        } = .FC0,
        reserved8: u5 = 0,
        /// Blink Segment Selection 0
        BSS0: u8 = 0x0,
        /// Blink Segment Selection 1
        BSS1: u8 = 0x0,
        padding: u8 = 0,
    }),
    /// Circular Shift Register Configuration
    /// offset: 0x6c
    CSRCFG: mmio.Mmio(packed struct(u32) {
        /// Direction
        DIR: u1 = 0x0,
        /// Frame Counter Selection
        FCS: enum(u2) {
            /// Frame Counter 0
            FC0 = 0x0,
            /// Frame Counter 1
            FC1 = 0x1,
            /// Frame Counter 2
            FC2 = 0x2,
            _,
        } = .FC0,
        reserved4: u1 = 0,
        /// Circular Shift Register Size
        SIZE: u4 = 0x0,
        /// Circular Shift Register Value
        DATA: u16 = 0x0,
        padding: u8 = 0,
    }),
    /// Character Mapping Configuration
    /// offset: 0x70
    CMCFG: mmio.Mmio(packed struct(u8) {
        /// Number of SEG lines
        NSEG: u3 = 0x0,
        /// Decrement SEG Line Index
        DEC: u1 = 0x0,
        padding: u4 = 0,
    }),
    /// offset: 0x71
    reserved113: [3]u8,
    /// Automated Character Mapping Configuration
    /// offset: 0x74
    ACMCFG: mmio.Mmio(packed struct(u32) {
        /// COM Lines per Row
        NCOM: u3 = 0x0,
        reserved4: u1 = 0,
        /// Number of Digit
        NDIG: u4 = 0x0,
        /// Scrolling Steps
        STEPS: u8 = 0x0,
        /// Number of Digit per Row
        NDROW: u6 = 0x0,
        reserved23: u1 = 0,
        /// Mode
        MODE: enum(u1) {
            /// Sequential Display Mode
            SEQ = 0x0,
            /// Scrolling Display Mode
            SCROLL = 0x1,
        } = .SEQ,
        /// Start SEG Line
        STSEG: u6 = 0x0,
        /// Frame Counter Selection
        FCS: enum(u2) {
            /// Frame Counter 0
            FC0 = 0x0,
            /// Frame Counter 1
            FC1 = 0x1,
            /// Frame Counter 2
            FC2 = 0x2,
            _,
        } = .FC0,
    }),
    /// Automated Bit Mapping Configuration
    /// offset: 0x78
    ABMCFG: mmio.Mmio(packed struct(u8) {
        /// Frame Counter Selection
        FCS: enum(u2) {
            /// Frame Counter 0
            FC0 = 0x0,
            /// Frame Counter 1
            FC1 = 0x1,
            /// Frame Counter 2
            FC2 = 0x2,
            _,
        } = .FC0,
        /// Size
        SIZE: u6 = 0x0,
    }),
    /// offset: 0x79
    reserved121: [3]u8,
    /// Character Mapping Segments Data
    /// offset: 0x7c
    CMDATA: mmio.Mmio(packed struct(u32) {
        /// Segments Data
        SDATA: u24 = 0x0,
        padding: u8 = 0,
    }),
    /// Character Mapping Segments Data Mask
    /// offset: 0x80
    CMDMASK: mmio.Mmio(packed struct(u32) {
        /// Segments Data Mask
        SDMASK: u24 = 0x0,
        padding: u8 = 0,
    }),
    /// Character Mapping SEG/COM Index
    /// offset: 0x84
    CMINDEX: mmio.Mmio(packed struct(u16) {
        /// SEG Line Index
        SINDEX: u6 = 0x0,
        reserved8: u2 = 0,
        /// COM Line Index
        CINDEX: u3 = 0x0,
        padding: u5 = 0,
    }),
};
