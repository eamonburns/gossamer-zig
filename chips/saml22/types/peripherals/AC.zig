const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Analog Comparators
pub const AC = extern struct {
    /// Control A
    /// offset: 0x00
    CTRLA: mmio.Mmio(packed struct(u8) {
        /// Software Reset
        SWRST: u1 = 0x0,
        /// Enable
        ENABLE: u1 = 0x0,
        padding: u6 = 0,
    }),
    /// Control B
    /// offset: 0x01
    CTRLB: mmio.Mmio(packed struct(u8) {
        /// Comparator 0 Start Comparison
        START0: u1 = 0x0,
        /// Comparator 1 Start Comparison
        START1: u1 = 0x0,
        padding: u6 = 0,
    }),
    /// Event Control
    /// offset: 0x02
    EVCTRL: mmio.Mmio(packed struct(u16) {
        /// Comparator 0 Event Output Enable
        COMPEO0: u1 = 0x0,
        /// Comparator 1 Event Output Enable
        COMPEO1: u1 = 0x0,
        reserved4: u2 = 0,
        /// Window 0 Event Output Enable
        WINEO0: u1 = 0x0,
        reserved8: u3 = 0,
        /// Comparator 0 Event Input Enable
        COMPEI0: u1 = 0x0,
        /// Comparator 1 Event Input Enable
        COMPEI1: u1 = 0x0,
        reserved12: u2 = 0,
        /// Comparator 0 Input Event Invert Enable
        INVEI0: u1 = 0x0,
        /// Comparator 1 Input Event Invert Enable
        INVEI1: u1 = 0x0,
        padding: u2 = 0,
    }),
    /// Interrupt Enable Clear
    /// offset: 0x04
    INTENCLR: mmio.Mmio(packed struct(u8) {
        /// Comparator 0 Interrupt Enable
        COMP0: u1 = 0x0,
        /// Comparator 1 Interrupt Enable
        COMP1: u1 = 0x0,
        reserved4: u2 = 0,
        /// Window 0 Interrupt Enable
        WIN0: u1 = 0x0,
        padding: u3 = 0,
    }),
    /// Interrupt Enable Set
    /// offset: 0x05
    INTENSET: mmio.Mmio(packed struct(u8) {
        /// Comparator 0 Interrupt Enable
        COMP0: u1 = 0x0,
        /// Comparator 1 Interrupt Enable
        COMP1: u1 = 0x0,
        reserved4: u2 = 0,
        /// Window 0 Interrupt Enable
        WIN0: u1 = 0x0,
        padding: u3 = 0,
    }),
    /// Interrupt Flag Status and Clear
    /// offset: 0x06
    INTFLAG: mmio.Mmio(packed struct(u8) {
        /// Comparator 0
        COMP0: u1 = 0x0,
        /// Comparator 1
        COMP1: u1 = 0x0,
        reserved4: u2 = 0,
        /// Window 0
        WIN0: u1 = 0x0,
        padding: u3 = 0,
    }),
    /// Status A
    /// offset: 0x07
    STATUSA: mmio.Mmio(packed struct(u8) {
        /// Comparator 0 Current State
        STATE0: u1 = 0x0,
        /// Comparator 1 Current State
        STATE1: u1 = 0x0,
        reserved4: u2 = 0,
        /// Window 0 Current State
        WSTATE0: enum(u2) {
            /// Signal is above window
            ABOVE = 0x0,
            /// Signal is inside window
            INSIDE = 0x1,
            /// Signal is below window
            BELOW = 0x2,
            _,
        } = .ABOVE,
        padding: u2 = 0,
    }),
    /// Status B
    /// offset: 0x08
    STATUSB: mmio.Mmio(packed struct(u8) {
        /// Comparator 0 Ready
        READY0: u1 = 0x0,
        /// Comparator 1 Ready
        READY1: u1 = 0x0,
        padding: u6 = 0,
    }),
    /// Debug Control
    /// offset: 0x09
    DBGCTRL: mmio.Mmio(packed struct(u8) {
        /// Debug Run
        DBGRUN: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// Window Control
    /// offset: 0x0a
    WINCTRL: mmio.Mmio(packed struct(u8) {
        /// Window 0 Mode Enable
        WEN0: u1 = 0x0,
        /// Window 0 Interrupt Selection
        WINTSEL0: enum(u2) {
            /// Interrupt on signal above window
            ABOVE = 0x0,
            /// Interrupt on signal inside window
            INSIDE = 0x1,
            /// Interrupt on signal below window
            BELOW = 0x2,
            /// Interrupt on signal outside window
            OUTSIDE = 0x3,
        } = .ABOVE,
        padding: u5 = 0,
    }),
    /// offset: 0x0b
    reserved11: [1]u8,
    /// Scaler n
    /// offset: 0x0c
    SCALER0: mmio.Mmio(packed struct(u8) {
        /// Scaler Value
        VALUE: u6 = 0x0,
        padding: u2 = 0,
    }),
    /// Scaler n
    /// offset: 0x0d
    SCALER1: mmio.Mmio(packed struct(u8) {
        /// Scaler Value
        VALUE: u6 = 0x0,
        padding: u2 = 0,
    }),
    /// offset: 0x0e
    reserved14: [2]u8,
    /// Comparator Control n
    /// offset: 0x10
    COMPCTRL0: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Enable
        ENABLE: u1 = 0x0,
        /// Single-Shot Mode
        SINGLE: u1 = 0x0,
        /// Interrupt Selection
        INTSEL: enum(u2) {
            /// Interrupt on comparator output toggle
            TOGGLE = 0x0,
            /// Interrupt on comparator output rising
            RISING = 0x1,
            /// Interrupt on comparator output falling
            FALLING = 0x2,
            /// Interrupt on end of comparison (single-shot mode only)
            EOC = 0x3,
        } = .TOGGLE,
        reserved6: u1 = 0,
        /// Run in Standby
        RUNSTDBY: u1 = 0x0,
        reserved8: u1 = 0,
        /// Negative Input Mux Selection
        MUXNEG: enum(u3) {
            /// I/O pin 0
            PIN0 = 0x0,
            /// I/O pin 1
            PIN1 = 0x1,
            /// I/O pin 2
            PIN2 = 0x2,
            /// I/O pin 3
            PIN3 = 0x3,
            /// Ground
            GND = 0x4,
            /// VDD scaler
            VSCALE = 0x5,
            /// Internal bandgap voltage
            BANDGAP = 0x6,
            /// DAC output
            DAC = 0x7,
        } = .PIN0,
        reserved12: u1 = 0,
        /// Positive Input Mux Selection
        MUXPOS: enum(u3) {
            /// I/O pin 0
            PIN0 = 0x0,
            /// I/O pin 1
            PIN1 = 0x1,
            /// I/O pin 2
            PIN2 = 0x2,
            /// I/O pin 3
            PIN3 = 0x3,
            /// VDD Scaler
            VSCALE = 0x4,
            _,
        } = .PIN0,
        /// Swap Inputs and Invert
        SWAP: u1 = 0x0,
        /// Speed Selection
        SPEED: enum(u2) {
            /// Low speed
            LOW = 0x0,
            /// Medium low speed
            MEDLOW = 0x1,
            /// Medium high speed
            MEDHIGH = 0x2,
            /// High speed
            HIGH = 0x3,
        } = .LOW,
        reserved19: u1 = 0,
        /// Hysteresis Enable
        HYSTEN: u1 = 0x0,
        /// Hysteresis Level
        HYST: enum(u2) {
            /// 50mV
            HYST50 = 0x0,
            /// 70mV
            HYST70 = 0x1,
            /// 90mV
            HYST90 = 0x2,
            /// 110mV
            HYST110 = 0x3,
        } = .HYST50,
        reserved24: u2 = 0,
        /// Filter Length
        FLEN: enum(u3) {
            /// No filtering
            OFF = 0x0,
            /// 3-bit majority function (2 of 3)
            MAJ3 = 0x1,
            /// 5-bit majority function (3 of 5)
            MAJ5 = 0x2,
            _,
        } = .OFF,
        reserved28: u1 = 0,
        /// Output
        OUT: enum(u2) {
            /// The output of COMPn is not routed to the COMPn I/O port
            OFF = 0x0,
            /// The asynchronous output of COMPn is routed to the COMPn I/O port
            ASYNC = 0x1,
            /// The synchronous output (including filtering) of COMPn is routed to the COMPn I/O port
            SYNC = 0x2,
            _,
        } = .OFF,
        padding: u2 = 0,
    }),
    /// Comparator Control n
    /// offset: 0x14
    COMPCTRL1: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Enable
        ENABLE: u1 = 0x0,
        /// Single-Shot Mode
        SINGLE: u1 = 0x0,
        /// Interrupt Selection
        INTSEL: enum(u2) {
            /// Interrupt on comparator output toggle
            TOGGLE = 0x0,
            /// Interrupt on comparator output rising
            RISING = 0x1,
            /// Interrupt on comparator output falling
            FALLING = 0x2,
            /// Interrupt on end of comparison (single-shot mode only)
            EOC = 0x3,
        } = .TOGGLE,
        reserved6: u1 = 0,
        /// Run in Standby
        RUNSTDBY: u1 = 0x0,
        reserved8: u1 = 0,
        /// Negative Input Mux Selection
        MUXNEG: enum(u3) {
            /// I/O pin 0
            PIN0 = 0x0,
            /// I/O pin 1
            PIN1 = 0x1,
            /// I/O pin 2
            PIN2 = 0x2,
            /// I/O pin 3
            PIN3 = 0x3,
            /// Ground
            GND = 0x4,
            /// VDD scaler
            VSCALE = 0x5,
            /// Internal bandgap voltage
            BANDGAP = 0x6,
            /// DAC output
            DAC = 0x7,
        } = .PIN0,
        reserved12: u1 = 0,
        /// Positive Input Mux Selection
        MUXPOS: enum(u3) {
            /// I/O pin 0
            PIN0 = 0x0,
            /// I/O pin 1
            PIN1 = 0x1,
            /// I/O pin 2
            PIN2 = 0x2,
            /// I/O pin 3
            PIN3 = 0x3,
            /// VDD Scaler
            VSCALE = 0x4,
            _,
        } = .PIN0,
        /// Swap Inputs and Invert
        SWAP: u1 = 0x0,
        /// Speed Selection
        SPEED: enum(u2) {
            /// Low speed
            LOW = 0x0,
            /// Medium low speed
            MEDLOW = 0x1,
            /// Medium high speed
            MEDHIGH = 0x2,
            /// High speed
            HIGH = 0x3,
        } = .LOW,
        reserved19: u1 = 0,
        /// Hysteresis Enable
        HYSTEN: u1 = 0x0,
        /// Hysteresis Level
        HYST: enum(u2) {
            /// 50mV
            HYST50 = 0x0,
            /// 70mV
            HYST70 = 0x1,
            /// 90mV
            HYST90 = 0x2,
            /// 110mV
            HYST110 = 0x3,
        } = .HYST50,
        reserved24: u2 = 0,
        /// Filter Length
        FLEN: enum(u3) {
            /// No filtering
            OFF = 0x0,
            /// 3-bit majority function (2 of 3)
            MAJ3 = 0x1,
            /// 5-bit majority function (3 of 5)
            MAJ5 = 0x2,
            _,
        } = .OFF,
        reserved28: u1 = 0,
        /// Output
        OUT: enum(u2) {
            /// The output of COMPn is not routed to the COMPn I/O port
            OFF = 0x0,
            /// The asynchronous output of COMPn is routed to the COMPn I/O port
            ASYNC = 0x1,
            /// The synchronous output (including filtering) of COMPn is routed to the COMPn I/O port
            SYNC = 0x2,
            _,
        } = .OFF,
        padding: u2 = 0,
    }),
    /// offset: 0x18
    reserved24: [8]u8,
    /// Synchronization Busy
    /// offset: 0x20
    SYNCBUSY: mmio.Mmio(packed struct(u32) {
        /// Software Reset Synchronization Busy
        SWRST: u1 = 0x0,
        /// Enable Synchronization Busy
        ENABLE: u1 = 0x0,
        /// WINCTRL Synchronization Busy
        WINCTRL: u1 = 0x0,
        /// COMPCTRL 0 Synchronization Busy
        COMPCTRL0: u1 = 0x0,
        /// COMPCTRL 1 Synchronization Busy
        COMPCTRL1: u1 = 0x0,
        padding: u27 = 0,
    }),
};
