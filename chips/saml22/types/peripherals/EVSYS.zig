const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Event System Interface
pub const EVSYS = extern struct {
    /// Control
    /// offset: 0x00
    CTRLA: mmio.Mmio(packed struct(u8) {
        /// Software Reset
        SWRST: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// offset: 0x01
    reserved1: [11]u8,
    /// Channel Status
    /// offset: 0x0c
    CHSTATUS: mmio.Mmio(packed struct(u32) {
        /// Channel 0 User Ready
        USRRDY0: u1 = 0x0,
        /// Channel 1 User Ready
        USRRDY1: u1 = 0x0,
        /// Channel 2 User Ready
        USRRDY2: u1 = 0x0,
        /// Channel 3 User Ready
        USRRDY3: u1 = 0x0,
        /// Channel 4 User Ready
        USRRDY4: u1 = 0x0,
        /// Channel 5 User Ready
        USRRDY5: u1 = 0x0,
        /// Channel 6 User Ready
        USRRDY6: u1 = 0x0,
        /// Channel 7 User Ready
        USRRDY7: u1 = 0x0,
        reserved16: u8 = 0,
        /// Channel 0 Busy
        CHBUSY0: u1 = 0x0,
        /// Channel 1 Busy
        CHBUSY1: u1 = 0x0,
        /// Channel 2 Busy
        CHBUSY2: u1 = 0x0,
        /// Channel 3 Busy
        CHBUSY3: u1 = 0x0,
        /// Channel 4 Busy
        CHBUSY4: u1 = 0x0,
        /// Channel 5 Busy
        CHBUSY5: u1 = 0x0,
        /// Channel 6 Busy
        CHBUSY6: u1 = 0x0,
        /// Channel 7 Busy
        CHBUSY7: u1 = 0x0,
        padding: u8 = 0,
    }),
    /// Interrupt Enable Clear
    /// offset: 0x10
    INTENCLR: mmio.Mmio(packed struct(u32) {
        /// Channel 0 Overrun Interrupt Enable
        OVR0: u1 = 0x0,
        /// Channel 1 Overrun Interrupt Enable
        OVR1: u1 = 0x0,
        /// Channel 2 Overrun Interrupt Enable
        OVR2: u1 = 0x0,
        /// Channel 3 Overrun Interrupt Enable
        OVR3: u1 = 0x0,
        /// Channel 4 Overrun Interrupt Enable
        OVR4: u1 = 0x0,
        /// Channel 5 Overrun Interrupt Enable
        OVR5: u1 = 0x0,
        /// Channel 6 Overrun Interrupt Enable
        OVR6: u1 = 0x0,
        /// Channel 7 Overrun Interrupt Enable
        OVR7: u1 = 0x0,
        reserved16: u8 = 0,
        /// Channel 0 Event Detection Interrupt Enable
        EVD0: u1 = 0x0,
        /// Channel 1 Event Detection Interrupt Enable
        EVD1: u1 = 0x0,
        /// Channel 2 Event Detection Interrupt Enable
        EVD2: u1 = 0x0,
        /// Channel 3 Event Detection Interrupt Enable
        EVD3: u1 = 0x0,
        /// Channel 4 Event Detection Interrupt Enable
        EVD4: u1 = 0x0,
        /// Channel 5 Event Detection Interrupt Enable
        EVD5: u1 = 0x0,
        /// Channel 6 Event Detection Interrupt Enable
        EVD6: u1 = 0x0,
        /// Channel 7 Event Detection Interrupt Enable
        EVD7: u1 = 0x0,
        padding: u8 = 0,
    }),
    /// Interrupt Enable Set
    /// offset: 0x14
    INTENSET: mmio.Mmio(packed struct(u32) {
        /// Channel 0 Overrun Interrupt Enable
        OVR0: u1 = 0x0,
        /// Channel 1 Overrun Interrupt Enable
        OVR1: u1 = 0x0,
        /// Channel 2 Overrun Interrupt Enable
        OVR2: u1 = 0x0,
        /// Channel 3 Overrun Interrupt Enable
        OVR3: u1 = 0x0,
        /// Channel 4 Overrun Interrupt Enable
        OVR4: u1 = 0x0,
        /// Channel 5 Overrun Interrupt Enable
        OVR5: u1 = 0x0,
        /// Channel 6 Overrun Interrupt Enable
        OVR6: u1 = 0x0,
        /// Channel 7 Overrun Interrupt Enable
        OVR7: u1 = 0x0,
        reserved16: u8 = 0,
        /// Channel 0 Event Detection Interrupt Enable
        EVD0: u1 = 0x0,
        /// Channel 1 Event Detection Interrupt Enable
        EVD1: u1 = 0x0,
        /// Channel 2 Event Detection Interrupt Enable
        EVD2: u1 = 0x0,
        /// Channel 3 Event Detection Interrupt Enable
        EVD3: u1 = 0x0,
        /// Channel 4 Event Detection Interrupt Enable
        EVD4: u1 = 0x0,
        /// Channel 5 Event Detection Interrupt Enable
        EVD5: u1 = 0x0,
        /// Channel 6 Event Detection Interrupt Enable
        EVD6: u1 = 0x0,
        /// Channel 7 Event Detection Interrupt Enable
        EVD7: u1 = 0x0,
        padding: u8 = 0,
    }),
    /// Interrupt Flag Status and Clear
    /// offset: 0x18
    INTFLAG: mmio.Mmio(packed struct(u32) {
        /// Channel 0 Overrun
        OVR0: u1 = 0x0,
        /// Channel 1 Overrun
        OVR1: u1 = 0x0,
        /// Channel 2 Overrun
        OVR2: u1 = 0x0,
        /// Channel 3 Overrun
        OVR3: u1 = 0x0,
        /// Channel 4 Overrun
        OVR4: u1 = 0x0,
        /// Channel 5 Overrun
        OVR5: u1 = 0x0,
        /// Channel 6 Overrun
        OVR6: u1 = 0x0,
        /// Channel 7 Overrun
        OVR7: u1 = 0x0,
        reserved16: u8 = 0,
        /// Channel 0 Event Detection
        EVD0: u1 = 0x0,
        /// Channel 1 Event Detection
        EVD1: u1 = 0x0,
        /// Channel 2 Event Detection
        EVD2: u1 = 0x0,
        /// Channel 3 Event Detection
        EVD3: u1 = 0x0,
        /// Channel 4 Event Detection
        EVD4: u1 = 0x0,
        /// Channel 5 Event Detection
        EVD5: u1 = 0x0,
        /// Channel 6 Event Detection
        EVD6: u1 = 0x0,
        /// Channel 7 Event Detection
        EVD7: u1 = 0x0,
        padding: u8 = 0,
    }),
    /// Software Event
    /// offset: 0x1c
    SWEVT: mmio.Mmio(packed struct(u32) {
        /// Channel 0 Software Selection
        CHANNEL0: u1 = 0x0,
        /// Channel 1 Software Selection
        CHANNEL1: u1 = 0x0,
        /// Channel 2 Software Selection
        CHANNEL2: u1 = 0x0,
        /// Channel 3 Software Selection
        CHANNEL3: u1 = 0x0,
        /// Channel 4 Software Selection
        CHANNEL4: u1 = 0x0,
        /// Channel 5 Software Selection
        CHANNEL5: u1 = 0x0,
        /// Channel 6 Software Selection
        CHANNEL6: u1 = 0x0,
        /// Channel 7 Software Selection
        CHANNEL7: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Channel n
    /// offset: 0x20
    CHANNEL0: mmio.Mmio(packed struct(u32) {
        /// Event Generator Selection
        EVGEN: u7 = 0x0,
        reserved8: u1 = 0,
        /// Path Selection
        PATH: enum(u2) {
            /// Synchronous path
            SYNCHRONOUS = 0x0,
            /// Resynchronized path
            RESYNCHRONIZED = 0x1,
            /// Asynchronous path
            ASYNCHRONOUS = 0x2,
            _,
        } = .SYNCHRONOUS,
        /// Edge Detection Selection
        EDGSEL: enum(u2) {
            /// No event output when using the resynchronized or synchronous path
            NO_EVT_OUTPUT = 0x0,
            /// Event detection only on the rising edge of the signal from the event generator when using the resynchronized or synchronous path
            RISING_EDGE = 0x1,
            /// Event detection only on the falling edge of the signal from the event generator when using the resynchronized or synchronous path
            FALLING_EDGE = 0x2,
            /// Event detection on rising and falling edges of the signal from the event generator when using the resynchronized or synchronous path
            BOTH_EDGES = 0x3,
        } = .NO_EVT_OUTPUT,
        reserved14: u2 = 0,
        /// Run in standby
        RUNSTDBY: u1 = 0x0,
        /// Generic Clock On Demand
        ONDEMAND: u1 = 0x1,
        padding: u16 = 0,
    }),
    /// Channel n
    /// offset: 0x24
    CHANNEL1: mmio.Mmio(packed struct(u32) {
        /// Event Generator Selection
        EVGEN: u7 = 0x0,
        reserved8: u1 = 0,
        /// Path Selection
        PATH: enum(u2) {
            /// Synchronous path
            SYNCHRONOUS = 0x0,
            /// Resynchronized path
            RESYNCHRONIZED = 0x1,
            /// Asynchronous path
            ASYNCHRONOUS = 0x2,
            _,
        } = .SYNCHRONOUS,
        /// Edge Detection Selection
        EDGSEL: enum(u2) {
            /// No event output when using the resynchronized or synchronous path
            NO_EVT_OUTPUT = 0x0,
            /// Event detection only on the rising edge of the signal from the event generator when using the resynchronized or synchronous path
            RISING_EDGE = 0x1,
            /// Event detection only on the falling edge of the signal from the event generator when using the resynchronized or synchronous path
            FALLING_EDGE = 0x2,
            /// Event detection on rising and falling edges of the signal from the event generator when using the resynchronized or synchronous path
            BOTH_EDGES = 0x3,
        } = .NO_EVT_OUTPUT,
        reserved14: u2 = 0,
        /// Run in standby
        RUNSTDBY: u1 = 0x0,
        /// Generic Clock On Demand
        ONDEMAND: u1 = 0x1,
        padding: u16 = 0,
    }),
    /// Channel n
    /// offset: 0x28
    CHANNEL2: mmio.Mmio(packed struct(u32) {
        /// Event Generator Selection
        EVGEN: u7 = 0x0,
        reserved8: u1 = 0,
        /// Path Selection
        PATH: enum(u2) {
            /// Synchronous path
            SYNCHRONOUS = 0x0,
            /// Resynchronized path
            RESYNCHRONIZED = 0x1,
            /// Asynchronous path
            ASYNCHRONOUS = 0x2,
            _,
        } = .SYNCHRONOUS,
        /// Edge Detection Selection
        EDGSEL: enum(u2) {
            /// No event output when using the resynchronized or synchronous path
            NO_EVT_OUTPUT = 0x0,
            /// Event detection only on the rising edge of the signal from the event generator when using the resynchronized or synchronous path
            RISING_EDGE = 0x1,
            /// Event detection only on the falling edge of the signal from the event generator when using the resynchronized or synchronous path
            FALLING_EDGE = 0x2,
            /// Event detection on rising and falling edges of the signal from the event generator when using the resynchronized or synchronous path
            BOTH_EDGES = 0x3,
        } = .NO_EVT_OUTPUT,
        reserved14: u2 = 0,
        /// Run in standby
        RUNSTDBY: u1 = 0x0,
        /// Generic Clock On Demand
        ONDEMAND: u1 = 0x1,
        padding: u16 = 0,
    }),
    /// Channel n
    /// offset: 0x2c
    CHANNEL3: mmio.Mmio(packed struct(u32) {
        /// Event Generator Selection
        EVGEN: u7 = 0x0,
        reserved8: u1 = 0,
        /// Path Selection
        PATH: enum(u2) {
            /// Synchronous path
            SYNCHRONOUS = 0x0,
            /// Resynchronized path
            RESYNCHRONIZED = 0x1,
            /// Asynchronous path
            ASYNCHRONOUS = 0x2,
            _,
        } = .SYNCHRONOUS,
        /// Edge Detection Selection
        EDGSEL: enum(u2) {
            /// No event output when using the resynchronized or synchronous path
            NO_EVT_OUTPUT = 0x0,
            /// Event detection only on the rising edge of the signal from the event generator when using the resynchronized or synchronous path
            RISING_EDGE = 0x1,
            /// Event detection only on the falling edge of the signal from the event generator when using the resynchronized or synchronous path
            FALLING_EDGE = 0x2,
            /// Event detection on rising and falling edges of the signal from the event generator when using the resynchronized or synchronous path
            BOTH_EDGES = 0x3,
        } = .NO_EVT_OUTPUT,
        reserved14: u2 = 0,
        /// Run in standby
        RUNSTDBY: u1 = 0x0,
        /// Generic Clock On Demand
        ONDEMAND: u1 = 0x1,
        padding: u16 = 0,
    }),
    /// Channel n
    /// offset: 0x30
    CHANNEL4: mmio.Mmio(packed struct(u32) {
        /// Event Generator Selection
        EVGEN: u7 = 0x0,
        reserved8: u1 = 0,
        /// Path Selection
        PATH: enum(u2) {
            /// Synchronous path
            SYNCHRONOUS = 0x0,
            /// Resynchronized path
            RESYNCHRONIZED = 0x1,
            /// Asynchronous path
            ASYNCHRONOUS = 0x2,
            _,
        } = .SYNCHRONOUS,
        /// Edge Detection Selection
        EDGSEL: enum(u2) {
            /// No event output when using the resynchronized or synchronous path
            NO_EVT_OUTPUT = 0x0,
            /// Event detection only on the rising edge of the signal from the event generator when using the resynchronized or synchronous path
            RISING_EDGE = 0x1,
            /// Event detection only on the falling edge of the signal from the event generator when using the resynchronized or synchronous path
            FALLING_EDGE = 0x2,
            /// Event detection on rising and falling edges of the signal from the event generator when using the resynchronized or synchronous path
            BOTH_EDGES = 0x3,
        } = .NO_EVT_OUTPUT,
        reserved14: u2 = 0,
        /// Run in standby
        RUNSTDBY: u1 = 0x0,
        /// Generic Clock On Demand
        ONDEMAND: u1 = 0x1,
        padding: u16 = 0,
    }),
    /// Channel n
    /// offset: 0x34
    CHANNEL5: mmio.Mmio(packed struct(u32) {
        /// Event Generator Selection
        EVGEN: u7 = 0x0,
        reserved8: u1 = 0,
        /// Path Selection
        PATH: enum(u2) {
            /// Synchronous path
            SYNCHRONOUS = 0x0,
            /// Resynchronized path
            RESYNCHRONIZED = 0x1,
            /// Asynchronous path
            ASYNCHRONOUS = 0x2,
            _,
        } = .SYNCHRONOUS,
        /// Edge Detection Selection
        EDGSEL: enum(u2) {
            /// No event output when using the resynchronized or synchronous path
            NO_EVT_OUTPUT = 0x0,
            /// Event detection only on the rising edge of the signal from the event generator when using the resynchronized or synchronous path
            RISING_EDGE = 0x1,
            /// Event detection only on the falling edge of the signal from the event generator when using the resynchronized or synchronous path
            FALLING_EDGE = 0x2,
            /// Event detection on rising and falling edges of the signal from the event generator when using the resynchronized or synchronous path
            BOTH_EDGES = 0x3,
        } = .NO_EVT_OUTPUT,
        reserved14: u2 = 0,
        /// Run in standby
        RUNSTDBY: u1 = 0x0,
        /// Generic Clock On Demand
        ONDEMAND: u1 = 0x1,
        padding: u16 = 0,
    }),
    /// Channel n
    /// offset: 0x38
    CHANNEL6: mmio.Mmio(packed struct(u32) {
        /// Event Generator Selection
        EVGEN: u7 = 0x0,
        reserved8: u1 = 0,
        /// Path Selection
        PATH: enum(u2) {
            /// Synchronous path
            SYNCHRONOUS = 0x0,
            /// Resynchronized path
            RESYNCHRONIZED = 0x1,
            /// Asynchronous path
            ASYNCHRONOUS = 0x2,
            _,
        } = .SYNCHRONOUS,
        /// Edge Detection Selection
        EDGSEL: enum(u2) {
            /// No event output when using the resynchronized or synchronous path
            NO_EVT_OUTPUT = 0x0,
            /// Event detection only on the rising edge of the signal from the event generator when using the resynchronized or synchronous path
            RISING_EDGE = 0x1,
            /// Event detection only on the falling edge of the signal from the event generator when using the resynchronized or synchronous path
            FALLING_EDGE = 0x2,
            /// Event detection on rising and falling edges of the signal from the event generator when using the resynchronized or synchronous path
            BOTH_EDGES = 0x3,
        } = .NO_EVT_OUTPUT,
        reserved14: u2 = 0,
        /// Run in standby
        RUNSTDBY: u1 = 0x0,
        /// Generic Clock On Demand
        ONDEMAND: u1 = 0x1,
        padding: u16 = 0,
    }),
    /// Channel n
    /// offset: 0x3c
    CHANNEL7: mmio.Mmio(packed struct(u32) {
        /// Event Generator Selection
        EVGEN: u7 = 0x0,
        reserved8: u1 = 0,
        /// Path Selection
        PATH: enum(u2) {
            /// Synchronous path
            SYNCHRONOUS = 0x0,
            /// Resynchronized path
            RESYNCHRONIZED = 0x1,
            /// Asynchronous path
            ASYNCHRONOUS = 0x2,
            _,
        } = .SYNCHRONOUS,
        /// Edge Detection Selection
        EDGSEL: enum(u2) {
            /// No event output when using the resynchronized or synchronous path
            NO_EVT_OUTPUT = 0x0,
            /// Event detection only on the rising edge of the signal from the event generator when using the resynchronized or synchronous path
            RISING_EDGE = 0x1,
            /// Event detection only on the falling edge of the signal from the event generator when using the resynchronized or synchronous path
            FALLING_EDGE = 0x2,
            /// Event detection on rising and falling edges of the signal from the event generator when using the resynchronized or synchronous path
            BOTH_EDGES = 0x3,
        } = .NO_EVT_OUTPUT,
        reserved14: u2 = 0,
        /// Run in standby
        RUNSTDBY: u1 = 0x0,
        /// Generic Clock On Demand
        ONDEMAND: u1 = 0x1,
        padding: u16 = 0,
    }),
    /// offset: 0x40
    reserved64: [64]u8,
    /// User Multiplexer n
    /// offset: 0x80
    USER0: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0x84
    USER1: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0x88
    USER2: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0x8c
    USER3: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0x90
    USER4: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0x94
    USER5: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0x98
    USER6: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0x9c
    USER7: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xa0
    USER8: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xa4
    USER9: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xa8
    USER10: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xac
    USER11: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xb0
    USER12: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xb4
    USER13: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xb8
    USER14: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xbc
    USER15: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xc0
    USER16: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xc4
    USER17: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xc8
    USER18: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xcc
    USER19: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xd0
    USER20: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xd4
    USER21: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xd8
    USER22: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xdc
    USER23: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xe0
    USER24: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xe4
    USER25: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xe8
    USER26: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xec
    USER27: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xf0
    USER28: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xf4
    USER29: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// User Multiplexer n
    /// offset: 0xf8
    USER30: mmio.Mmio(packed struct(u32) {
        /// Channel Event Selection
        CHANNEL: u4 = 0x0,
        padding: u28 = 0,
    }),
};
