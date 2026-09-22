const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// External Interrupt Controller
pub const EIC = extern struct {
    /// Control
    /// offset: 0x00
    CTRLA: mmio.Mmio(packed struct(u8) {
        /// Software Reset
        SWRST: u1 = 0x0,
        /// Enable
        ENABLE: u1 = 0x0,
        reserved4: u2 = 0,
        /// Clock Selection
        CKSEL: u1 = 0x0,
        padding: u3 = 0,
    }),
    /// NMI Control
    /// offset: 0x01
    NMICTRL: mmio.Mmio(packed struct(u8) {
        /// NMI Input Sense Configuration
        NMISENSE: enum(u3) {
            /// No detection
            NONE = 0x0,
            /// Rising edge detection
            RISE = 0x1,
            /// Falling edge detection
            FALL = 0x2,
            /// Both edges detection
            BOTH = 0x3,
            /// High level detection
            HIGH = 0x4,
            /// Low level detection
            LOW = 0x5,
            _,
        } = .NONE,
        /// NMI Filter Enable
        NMIFILTEN: u1 = 0x0,
        /// NMI Asynchronous edge Detection Enable
        NMIASYNCH: u1 = 0x0,
        padding: u3 = 0,
    }),
    /// NMI Interrupt Flag
    /// offset: 0x02
    NMIFLAG: mmio.Mmio(packed struct(u16) {
        /// NMI Interrupt Flag
        NMI: u1 = 0x0,
        padding: u15 = 0,
    }),
    /// Syncbusy register
    /// offset: 0x04
    SYNCBUSY: mmio.Mmio(packed struct(u32) {
        /// Software reset synchronisation
        SWRST: u1 = 0x0,
        /// Enable synchronisation
        ENABLE: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// Event Control
    /// offset: 0x08
    EVCTRL: mmio.Mmio(packed struct(u32) {
        /// External Interrupt Event Output Enable
        EXTINTEO: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// Interrupt Enable Clear
    /// offset: 0x0c
    INTENCLR: mmio.Mmio(packed struct(u32) {
        /// External Interrupt Disable
        EXTINT: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// Interrupt Enable Set
    /// offset: 0x10
    INTENSET: mmio.Mmio(packed struct(u32) {
        /// External Interrupt Disable
        EXTINT: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// Interrupt Flag Status and Clear
    /// offset: 0x14
    INTFLAG: mmio.Mmio(packed struct(u32) {
        /// External Interrupt Flag
        EXTINT: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// EIC Asynchronous edge Detection Enable
    /// offset: 0x18
    ASYNCH: mmio.Mmio(packed struct(u32) {
        /// EIC Asynchronous edge Detection Enable
        ASYNCH: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// Configuration n
    /// offset: 0x1c
    CONFIG0: mmio.Mmio(packed struct(u32) {
        /// Input Sense Configuration 0
        SENSE0: enum(u3) {
            /// No detection
            NONE = 0x0,
            /// Rising edge detection
            RISE = 0x1,
            /// Falling edge detection
            FALL = 0x2,
            /// Both edges detection
            BOTH = 0x3,
            /// High level detection
            HIGH = 0x4,
            /// Low level detection
            LOW = 0x5,
            _,
        } = .NONE,
        /// Filter Enable 0
        FILTEN0: u1 = 0x0,
        /// Input Sense Configuration 1
        SENSE1: enum(u3) {
            /// No detection
            NONE = 0x0,
            /// Rising edge detection
            RISE = 0x1,
            /// Falling edge detection
            FALL = 0x2,
            /// Both edges detection
            BOTH = 0x3,
            /// High level detection
            HIGH = 0x4,
            /// Low level detection
            LOW = 0x5,
            _,
        } = .NONE,
        /// Filter Enable 1
        FILTEN1: u1 = 0x0,
        /// Input Sense Configuration 2
        SENSE2: enum(u3) {
            /// No detection
            NONE = 0x0,
            /// Rising edge detection
            RISE = 0x1,
            /// Falling edge detection
            FALL = 0x2,
            /// Both edges detection
            BOTH = 0x3,
            /// High level detection
            HIGH = 0x4,
            /// Low level detection
            LOW = 0x5,
            _,
        } = .NONE,
        /// Filter Enable 2
        FILTEN2: u1 = 0x0,
        /// Input Sense Configuration 3
        SENSE3: enum(u3) {
            /// No detection
            NONE = 0x0,
            /// Rising edge detection
            RISE = 0x1,
            /// Falling edge detection
            FALL = 0x2,
            /// Both edges detection
            BOTH = 0x3,
            /// High level detection
            HIGH = 0x4,
            /// Low level detection
            LOW = 0x5,
            _,
        } = .NONE,
        /// Filter Enable 3
        FILTEN3: u1 = 0x0,
        /// Input Sense Configuration 4
        SENSE4: enum(u3) {
            /// No detection
            NONE = 0x0,
            /// Rising edge detection
            RISE = 0x1,
            /// Falling edge detection
            FALL = 0x2,
            /// Both edges detection
            BOTH = 0x3,
            /// High level detection
            HIGH = 0x4,
            /// Low level detection
            LOW = 0x5,
            _,
        } = .NONE,
        /// Filter Enable 4
        FILTEN4: u1 = 0x0,
        /// Input Sense Configuration 5
        SENSE5: enum(u3) {
            /// No detection
            NONE = 0x0,
            /// Rising edge detection
            RISE = 0x1,
            /// Falling edge detection
            FALL = 0x2,
            /// Both edges detection
            BOTH = 0x3,
            /// High level detection
            HIGH = 0x4,
            /// Low level detection
            LOW = 0x5,
            _,
        } = .NONE,
        /// Filter Enable 5
        FILTEN5: u1 = 0x0,
        /// Input Sense Configuration 6
        SENSE6: enum(u3) {
            /// No detection
            NONE = 0x0,
            /// Rising edge detection
            RISE = 0x1,
            /// Falling edge detection
            FALL = 0x2,
            /// Both edges detection
            BOTH = 0x3,
            /// High level detection
            HIGH = 0x4,
            /// Low level detection
            LOW = 0x5,
            _,
        } = .NONE,
        /// Filter Enable 6
        FILTEN6: u1 = 0x0,
        /// Input Sense Configuration 7
        SENSE7: enum(u3) {
            /// No detection
            NONE = 0x0,
            /// Rising edge detection
            RISE = 0x1,
            /// Falling edge detection
            FALL = 0x2,
            /// Both edges detection
            BOTH = 0x3,
            /// High level detection
            HIGH = 0x4,
            /// Low level detection
            LOW = 0x5,
            _,
        } = .NONE,
        /// Filter Enable 7
        FILTEN7: u1 = 0x0,
    }),
    /// Configuration n
    /// offset: 0x20
    CONFIG1: mmio.Mmio(packed struct(u32) {
        /// Input Sense Configuration 0
        SENSE0: enum(u3) {
            /// No detection
            NONE = 0x0,
            /// Rising edge detection
            RISE = 0x1,
            /// Falling edge detection
            FALL = 0x2,
            /// Both edges detection
            BOTH = 0x3,
            /// High level detection
            HIGH = 0x4,
            /// Low level detection
            LOW = 0x5,
            _,
        } = .NONE,
        /// Filter Enable 0
        FILTEN0: u1 = 0x0,
        /// Input Sense Configuration 1
        SENSE1: enum(u3) {
            /// No detection
            NONE = 0x0,
            /// Rising edge detection
            RISE = 0x1,
            /// Falling edge detection
            FALL = 0x2,
            /// Both edges detection
            BOTH = 0x3,
            /// High level detection
            HIGH = 0x4,
            /// Low level detection
            LOW = 0x5,
            _,
        } = .NONE,
        /// Filter Enable 1
        FILTEN1: u1 = 0x0,
        /// Input Sense Configuration 2
        SENSE2: enum(u3) {
            /// No detection
            NONE = 0x0,
            /// Rising edge detection
            RISE = 0x1,
            /// Falling edge detection
            FALL = 0x2,
            /// Both edges detection
            BOTH = 0x3,
            /// High level detection
            HIGH = 0x4,
            /// Low level detection
            LOW = 0x5,
            _,
        } = .NONE,
        /// Filter Enable 2
        FILTEN2: u1 = 0x0,
        /// Input Sense Configuration 3
        SENSE3: enum(u3) {
            /// No detection
            NONE = 0x0,
            /// Rising edge detection
            RISE = 0x1,
            /// Falling edge detection
            FALL = 0x2,
            /// Both edges detection
            BOTH = 0x3,
            /// High level detection
            HIGH = 0x4,
            /// Low level detection
            LOW = 0x5,
            _,
        } = .NONE,
        /// Filter Enable 3
        FILTEN3: u1 = 0x0,
        /// Input Sense Configuration 4
        SENSE4: enum(u3) {
            /// No detection
            NONE = 0x0,
            /// Rising edge detection
            RISE = 0x1,
            /// Falling edge detection
            FALL = 0x2,
            /// Both edges detection
            BOTH = 0x3,
            /// High level detection
            HIGH = 0x4,
            /// Low level detection
            LOW = 0x5,
            _,
        } = .NONE,
        /// Filter Enable 4
        FILTEN4: u1 = 0x0,
        /// Input Sense Configuration 5
        SENSE5: enum(u3) {
            /// No detection
            NONE = 0x0,
            /// Rising edge detection
            RISE = 0x1,
            /// Falling edge detection
            FALL = 0x2,
            /// Both edges detection
            BOTH = 0x3,
            /// High level detection
            HIGH = 0x4,
            /// Low level detection
            LOW = 0x5,
            _,
        } = .NONE,
        /// Filter Enable 5
        FILTEN5: u1 = 0x0,
        /// Input Sense Configuration 6
        SENSE6: enum(u3) {
            /// No detection
            NONE = 0x0,
            /// Rising edge detection
            RISE = 0x1,
            /// Falling edge detection
            FALL = 0x2,
            /// Both edges detection
            BOTH = 0x3,
            /// High level detection
            HIGH = 0x4,
            /// Low level detection
            LOW = 0x5,
            _,
        } = .NONE,
        /// Filter Enable 6
        FILTEN6: u1 = 0x0,
        /// Input Sense Configuration 7
        SENSE7: enum(u3) {
            /// No detection
            NONE = 0x0,
            /// Rising edge detection
            RISE = 0x1,
            /// Falling edge detection
            FALL = 0x2,
            /// Both edges detection
            BOTH = 0x3,
            /// High level detection
            HIGH = 0x4,
            /// Low level detection
            LOW = 0x5,
            _,
        } = .NONE,
        /// Filter Enable 7
        FILTEN7: u1 = 0x0,
    }),
};
