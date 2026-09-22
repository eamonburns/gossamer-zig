const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Generic Clock Generator
pub const GCLK = extern struct {
    /// Control
    /// offset: 0x00
    CTRLA: mmio.Mmio(packed struct(u8) {
        /// Software Reset
        SWRST: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// offset: 0x01
    reserved1: [3]u8,
    /// Synchronization Busy
    /// offset: 0x04
    SYNCBUSY: mmio.Mmio(packed struct(u32) {
        /// Software Reset Synchroniation Busy bit
        SWRST: u1 = 0x0,
        reserved2: u1 = 0,
        /// Generic Clock Generator Control 0 Synchronization Busy bits
        GENCTRL0: enum(u1) {
            /// Generic clock generator 0
            GCLK0 = 0x1,
            /// Generic clock generator 1
            GCLK1 = 0x2,
            /// Generic clock generator 2
            GCLK2 = 0x4,
            /// Generic clock generator 3
            GCLK3 = 0x8,
            /// Generic clock generator 4
            GCLK4 = 0x10,
        } = @fromBackingInt(@intCast(0x0)),
        /// Generic Clock Generator Control 1 Synchronization Busy bits
        GENCTRL1: enum(u1) {
            /// Generic clock generator 0
            GCLK0 = 0x1,
            /// Generic clock generator 1
            GCLK1 = 0x2,
            /// Generic clock generator 2
            GCLK2 = 0x4,
            /// Generic clock generator 3
            GCLK3 = 0x8,
            /// Generic clock generator 4
            GCLK4 = 0x10,
        } = @fromBackingInt(@intCast(0x0)),
        /// Generic Clock Generator Control 2 Synchronization Busy bits
        GENCTRL2: enum(u1) {
            /// Generic clock generator 0
            GCLK0 = 0x1,
            /// Generic clock generator 1
            GCLK1 = 0x2,
            /// Generic clock generator 2
            GCLK2 = 0x4,
            /// Generic clock generator 3
            GCLK3 = 0x8,
            /// Generic clock generator 4
            GCLK4 = 0x10,
        } = @fromBackingInt(@intCast(0x0)),
        /// Generic Clock Generator Control 3 Synchronization Busy bits
        GENCTRL3: enum(u1) {
            /// Generic clock generator 0
            GCLK0 = 0x1,
            /// Generic clock generator 1
            GCLK1 = 0x2,
            /// Generic clock generator 2
            GCLK2 = 0x4,
            /// Generic clock generator 3
            GCLK3 = 0x8,
            /// Generic clock generator 4
            GCLK4 = 0x10,
        } = @fromBackingInt(@intCast(0x0)),
        /// Generic Clock Generator Control 4 Synchronization Busy bits
        GENCTRL4: enum(u1) {
            /// Generic clock generator 0
            GCLK0 = 0x1,
            /// Generic clock generator 1
            GCLK1 = 0x2,
            /// Generic clock generator 2
            GCLK2 = 0x4,
            /// Generic clock generator 3
            GCLK3 = 0x8,
            /// Generic clock generator 4
            GCLK4 = 0x10,
        } = @fromBackingInt(@intCast(0x0)),
        padding: u25 = 0,
    }),
    /// offset: 0x08
    reserved8: [24]u8,
    /// Generic Clock Generator Control
    /// offset: 0x20
    GENCTRL0: mmio.Mmio(packed struct(u32) {
        /// Source Select
        SRC: enum(u3) {
            /// XOSC oscillator output
            XOSC = 0x0,
            /// Generator input pad
            GCLKIN = 0x1,
            /// Generic clock generator 1 output
            GCLKGEN1 = 0x2,
            /// OSCULP32K oscillator output
            OSCULP32K = 0x3,
            /// XOSC32K oscillator output
            XOSC32K = 0x4,
            /// OSC16M oscillator output
            OSC16M = 0x5,
            /// DFLL48M output
            DFLL48M = 0x6,
            /// DPLL96M output
            DPLL96M = 0x7,
        } = .XOSC,
        reserved8: u5 = 0,
        /// Generic Clock Generator Enable
        GENEN: u1 = 0x0,
        /// Improve Duty Cycle
        IDC: u1 = 0x0,
        /// Output Off Value
        OOV: u1 = 0x0,
        /// Output Enable
        OE: u1 = 0x0,
        /// Divide Selection
        DIVSEL: u1 = 0x0,
        /// Run in Standby
        RUNSTDBY: u1 = 0x0,
        reserved16: u2 = 0,
        /// Division Factor
        DIV: u16 = 0x0,
    }),
    /// Generic Clock Generator Control
    /// offset: 0x24
    GENCTRL1: mmio.Mmio(packed struct(u32) {
        /// Source Select
        SRC: enum(u3) {
            /// XOSC oscillator output
            XOSC = 0x0,
            /// Generator input pad
            GCLKIN = 0x1,
            /// Generic clock generator 1 output
            GCLKGEN1 = 0x2,
            /// OSCULP32K oscillator output
            OSCULP32K = 0x3,
            /// XOSC32K oscillator output
            XOSC32K = 0x4,
            /// OSC16M oscillator output
            OSC16M = 0x5,
            /// DFLL48M output
            DFLL48M = 0x6,
            /// DPLL96M output
            DPLL96M = 0x7,
        } = .XOSC,
        reserved8: u5 = 0,
        /// Generic Clock Generator Enable
        GENEN: u1 = 0x0,
        /// Improve Duty Cycle
        IDC: u1 = 0x0,
        /// Output Off Value
        OOV: u1 = 0x0,
        /// Output Enable
        OE: u1 = 0x0,
        /// Divide Selection
        DIVSEL: u1 = 0x0,
        /// Run in Standby
        RUNSTDBY: u1 = 0x0,
        reserved16: u2 = 0,
        /// Division Factor
        DIV: u16 = 0x0,
    }),
    /// Generic Clock Generator Control
    /// offset: 0x28
    GENCTRL2: mmio.Mmio(packed struct(u32) {
        /// Source Select
        SRC: enum(u3) {
            /// XOSC oscillator output
            XOSC = 0x0,
            /// Generator input pad
            GCLKIN = 0x1,
            /// Generic clock generator 1 output
            GCLKGEN1 = 0x2,
            /// OSCULP32K oscillator output
            OSCULP32K = 0x3,
            /// XOSC32K oscillator output
            XOSC32K = 0x4,
            /// OSC16M oscillator output
            OSC16M = 0x5,
            /// DFLL48M output
            DFLL48M = 0x6,
            /// DPLL96M output
            DPLL96M = 0x7,
        } = .XOSC,
        reserved8: u5 = 0,
        /// Generic Clock Generator Enable
        GENEN: u1 = 0x0,
        /// Improve Duty Cycle
        IDC: u1 = 0x0,
        /// Output Off Value
        OOV: u1 = 0x0,
        /// Output Enable
        OE: u1 = 0x0,
        /// Divide Selection
        DIVSEL: u1 = 0x0,
        /// Run in Standby
        RUNSTDBY: u1 = 0x0,
        reserved16: u2 = 0,
        /// Division Factor
        DIV: u16 = 0x0,
    }),
    /// Generic Clock Generator Control
    /// offset: 0x2c
    GENCTRL3: mmio.Mmio(packed struct(u32) {
        /// Source Select
        SRC: enum(u3) {
            /// XOSC oscillator output
            XOSC = 0x0,
            /// Generator input pad
            GCLKIN = 0x1,
            /// Generic clock generator 1 output
            GCLKGEN1 = 0x2,
            /// OSCULP32K oscillator output
            OSCULP32K = 0x3,
            /// XOSC32K oscillator output
            XOSC32K = 0x4,
            /// OSC16M oscillator output
            OSC16M = 0x5,
            /// DFLL48M output
            DFLL48M = 0x6,
            /// DPLL96M output
            DPLL96M = 0x7,
        } = .XOSC,
        reserved8: u5 = 0,
        /// Generic Clock Generator Enable
        GENEN: u1 = 0x0,
        /// Improve Duty Cycle
        IDC: u1 = 0x0,
        /// Output Off Value
        OOV: u1 = 0x0,
        /// Output Enable
        OE: u1 = 0x0,
        /// Divide Selection
        DIVSEL: u1 = 0x0,
        /// Run in Standby
        RUNSTDBY: u1 = 0x0,
        reserved16: u2 = 0,
        /// Division Factor
        DIV: u16 = 0x0,
    }),
    /// Generic Clock Generator Control
    /// offset: 0x30
    GENCTRL4: mmio.Mmio(packed struct(u32) {
        /// Source Select
        SRC: enum(u3) {
            /// XOSC oscillator output
            XOSC = 0x0,
            /// Generator input pad
            GCLKIN = 0x1,
            /// Generic clock generator 1 output
            GCLKGEN1 = 0x2,
            /// OSCULP32K oscillator output
            OSCULP32K = 0x3,
            /// XOSC32K oscillator output
            XOSC32K = 0x4,
            /// OSC16M oscillator output
            OSC16M = 0x5,
            /// DFLL48M output
            DFLL48M = 0x6,
            /// DPLL96M output
            DPLL96M = 0x7,
        } = .XOSC,
        reserved8: u5 = 0,
        /// Generic Clock Generator Enable
        GENEN: u1 = 0x0,
        /// Improve Duty Cycle
        IDC: u1 = 0x0,
        /// Output Off Value
        OOV: u1 = 0x0,
        /// Output Enable
        OE: u1 = 0x0,
        /// Divide Selection
        DIVSEL: u1 = 0x0,
        /// Run in Standby
        RUNSTDBY: u1 = 0x0,
        reserved16: u2 = 0,
        /// Division Factor
        DIV: u16 = 0x0,
    }),
    /// offset: 0x34
    reserved52: [76]u8,
    /// Peripheral Clock Control
    /// offset: 0x80
    PCHCTRL0: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0x84
    PCHCTRL1: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0x88
    PCHCTRL2: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0x8c
    PCHCTRL3: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0x90
    PCHCTRL4: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0x94
    PCHCTRL5: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0x98
    PCHCTRL6: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0x9c
    PCHCTRL7: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xa0
    PCHCTRL8: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xa4
    PCHCTRL9: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xa8
    PCHCTRL10: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xac
    PCHCTRL11: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xb0
    PCHCTRL12: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xb4
    PCHCTRL13: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xb8
    PCHCTRL14: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xbc
    PCHCTRL15: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xc0
    PCHCTRL16: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xc4
    PCHCTRL17: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xc8
    PCHCTRL18: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xcc
    PCHCTRL19: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xd0
    PCHCTRL20: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xd4
    PCHCTRL21: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xd8
    PCHCTRL22: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xdc
    PCHCTRL23: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xe0
    PCHCTRL24: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xe4
    PCHCTRL25: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xe8
    PCHCTRL26: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xec
    PCHCTRL27: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xf0
    PCHCTRL28: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Clock Control
    /// offset: 0xf4
    PCHCTRL29: mmio.Mmio(packed struct(u32) {
        /// Generic Clock Generator
        GEN: enum(u3) {
            /// Generic clock generator 0
            GCLK0 = 0x0,
            /// Generic clock generator 1
            GCLK1 = 0x1,
            /// Generic clock generator 2
            GCLK2 = 0x2,
            /// Generic clock generator 3
            GCLK3 = 0x3,
            /// Generic clock generator 4
            GCLK4 = 0x4,
            _,
        } = .GCLK0,
        reserved6: u3 = 0,
        /// Channel Enable
        CHEN: u1 = 0x0,
        /// Write Lock
        WRTLOCK: u1 = 0x0,
        padding: u24 = 0,
    }),
};
