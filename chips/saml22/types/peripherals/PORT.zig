const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Port Module
pub const PORT = extern struct {
    /// Data Direction
    /// offset: 0x00
    DIR0: u32 = 0x0,
    /// Data Direction Clear
    /// offset: 0x04
    DIRCLR0: u32 = 0x0,
    /// Data Direction Set
    /// offset: 0x08
    DIRSET0: u32 = 0x0,
    /// Data Direction Toggle
    /// offset: 0x0c
    DIRTGL0: u32 = 0x0,
    /// Data Output Value
    /// offset: 0x10
    OUT0: u32 = 0x0,
    /// Data Output Value Clear
    /// offset: 0x14
    OUTCLR0: u32 = 0x0,
    /// Data Output Value Set
    /// offset: 0x18
    OUTSET0: u32 = 0x0,
    /// Data Output Value Toggle
    /// offset: 0x1c
    OUTTGL0: u32 = 0x0,
    /// Data Input Value
    /// offset: 0x20
    IN0: u32 = 0x0,
    /// Control
    /// offset: 0x24
    CTRL0: mmio.Mmio(packed struct(u32) {
        /// Input Sampling Mode
        SAMPLING: u32 = 0x0,
    }),
    /// Write Configuration
    /// offset: 0x28
    WRCONFIG0: mmio.Mmio(packed struct(u32) {
        /// Pin Mask for Multiple Pin Configuration
        PINMASK: u16 = 0x0,
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved22: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        reserved24: u1 = 0,
        /// Peripheral Multiplexing Template
        PMUX: u4 = 0x0,
        /// Write PMUX Registers
        WRPMUX: u1 = 0x0,
        reserved30: u1 = 0,
        /// Write PINCFG Registers
        WRPINCFG: u1 = 0x0,
        /// Half-Word Select
        HWSEL: u1 = 0x0,
    }),
    /// Event Input Control
    /// offset: 0x2c
    EVCTRL0: mmio.Mmio(packed struct(u32) {
        /// Port Event Pin Identifier 0
        PID0: u5 = 0x0,
        /// Port Event Action 0
        EVACT0: u2 = 0x0,
        /// Port Event Enable Input 0
        PORTEI0: u1 = 0x0,
        /// Port Event Pin Identifier 1
        PID1: u5 = 0x0,
        /// Port Event Action 1
        EVACT1: u2 = 0x0,
        /// Port Event Enable Input 1
        PORTEI1: u1 = 0x0,
        /// Port Event Pin Identifier 2
        PID2: u5 = 0x0,
        /// Port Event Action 2
        EVACT2: u2 = 0x0,
        /// Port Event Enable Input 2
        PORTEI2: u1 = 0x0,
        /// Port Event Pin Identifier 3
        PID3: u5 = 0x0,
        /// Port Event Action 3
        EVACT3: u2 = 0x0,
        /// Port Event Enable Input 3
        PORTEI3: u1 = 0x0,
    }),
    /// Peripheral Multiplexing n - Group 0
    /// offset: 0x30
    PMUX0_0: mmio.Mmio(packed struct(u8) {
        /// Peripheral Multiplexing for Even-Numbered Pin
        PMUXE: u4 = 0x0,
        /// Peripheral Multiplexing for Odd-Numbered Pin
        PMUXO: u4 = 0x0,
    }),
    /// Peripheral Multiplexing n - Group 0
    /// offset: 0x31
    PMUX0_1: mmio.Mmio(packed struct(u8) {
        /// Peripheral Multiplexing for Even-Numbered Pin
        PMUXE: u4 = 0x0,
        /// Peripheral Multiplexing for Odd-Numbered Pin
        PMUXO: u4 = 0x0,
    }),
    /// Peripheral Multiplexing n - Group 0
    /// offset: 0x32
    PMUX0_2: mmio.Mmio(packed struct(u8) {
        /// Peripheral Multiplexing for Even-Numbered Pin
        PMUXE: u4 = 0x0,
        /// Peripheral Multiplexing for Odd-Numbered Pin
        PMUXO: u4 = 0x0,
    }),
    /// Peripheral Multiplexing n - Group 0
    /// offset: 0x33
    PMUX0_3: mmio.Mmio(packed struct(u8) {
        /// Peripheral Multiplexing for Even-Numbered Pin
        PMUXE: u4 = 0x0,
        /// Peripheral Multiplexing for Odd-Numbered Pin
        PMUXO: u4 = 0x0,
    }),
    /// Peripheral Multiplexing n - Group 0
    /// offset: 0x34
    PMUX0_4: mmio.Mmio(packed struct(u8) {
        /// Peripheral Multiplexing for Even-Numbered Pin
        PMUXE: u4 = 0x0,
        /// Peripheral Multiplexing for Odd-Numbered Pin
        PMUXO: u4 = 0x0,
    }),
    /// Peripheral Multiplexing n - Group 0
    /// offset: 0x35
    PMUX0_5: mmio.Mmio(packed struct(u8) {
        /// Peripheral Multiplexing for Even-Numbered Pin
        PMUXE: u4 = 0x0,
        /// Peripheral Multiplexing for Odd-Numbered Pin
        PMUXO: u4 = 0x0,
    }),
    /// Peripheral Multiplexing n - Group 0
    /// offset: 0x36
    PMUX0_6: mmio.Mmio(packed struct(u8) {
        /// Peripheral Multiplexing for Even-Numbered Pin
        PMUXE: u4 = 0x0,
        /// Peripheral Multiplexing for Odd-Numbered Pin
        PMUXO: u4 = 0x0,
    }),
    /// Peripheral Multiplexing n - Group 0
    /// offset: 0x37
    PMUX0_7: mmio.Mmio(packed struct(u8) {
        /// Peripheral Multiplexing for Even-Numbered Pin
        PMUXE: u4 = 0x0,
        /// Peripheral Multiplexing for Odd-Numbered Pin
        PMUXO: u4 = 0x0,
    }),
    /// Peripheral Multiplexing n - Group 0
    /// offset: 0x38
    PMUX0_8: mmio.Mmio(packed struct(u8) {
        /// Peripheral Multiplexing for Even-Numbered Pin
        PMUXE: u4 = 0x0,
        /// Peripheral Multiplexing for Odd-Numbered Pin
        PMUXO: u4 = 0x0,
    }),
    /// Peripheral Multiplexing n - Group 0
    /// offset: 0x39
    PMUX0_9: mmio.Mmio(packed struct(u8) {
        /// Peripheral Multiplexing for Even-Numbered Pin
        PMUXE: u4 = 0x0,
        /// Peripheral Multiplexing for Odd-Numbered Pin
        PMUXO: u4 = 0x0,
    }),
    /// Peripheral Multiplexing n - Group 0
    /// offset: 0x3a
    PMUX0_10: mmio.Mmio(packed struct(u8) {
        /// Peripheral Multiplexing for Even-Numbered Pin
        PMUXE: u4 = 0x0,
        /// Peripheral Multiplexing for Odd-Numbered Pin
        PMUXO: u4 = 0x0,
    }),
    /// Peripheral Multiplexing n - Group 0
    /// offset: 0x3b
    PMUX0_11: mmio.Mmio(packed struct(u8) {
        /// Peripheral Multiplexing for Even-Numbered Pin
        PMUXE: u4 = 0x0,
        /// Peripheral Multiplexing for Odd-Numbered Pin
        PMUXO: u4 = 0x0,
    }),
    /// Peripheral Multiplexing n - Group 0
    /// offset: 0x3c
    PMUX0_12: mmio.Mmio(packed struct(u8) {
        /// Peripheral Multiplexing for Even-Numbered Pin
        PMUXE: u4 = 0x0,
        /// Peripheral Multiplexing for Odd-Numbered Pin
        PMUXO: u4 = 0x0,
    }),
    /// Peripheral Multiplexing n - Group 0
    /// offset: 0x3d
    PMUX0_13: mmio.Mmio(packed struct(u8) {
        /// Peripheral Multiplexing for Even-Numbered Pin
        PMUXE: u4 = 0x0,
        /// Peripheral Multiplexing for Odd-Numbered Pin
        PMUXO: u4 = 0x0,
    }),
    /// Peripheral Multiplexing n - Group 0
    /// offset: 0x3e
    PMUX0_14: mmio.Mmio(packed struct(u8) {
        /// Peripheral Multiplexing for Even-Numbered Pin
        PMUXE: u4 = 0x0,
        /// Peripheral Multiplexing for Odd-Numbered Pin
        PMUXO: u4 = 0x0,
    }),
    /// Peripheral Multiplexing n - Group 0
    /// offset: 0x3f
    PMUX0_15: mmio.Mmio(packed struct(u8) {
        /// Peripheral Multiplexing for Even-Numbered Pin
        PMUXE: u4 = 0x0,
        /// Peripheral Multiplexing for Odd-Numbered Pin
        PMUXO: u4 = 0x0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x40
    PINCFG0_0: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x41
    PINCFG0_1: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x42
    PINCFG0_2: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x43
    PINCFG0_3: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x44
    PINCFG0_4: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x45
    PINCFG0_5: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x46
    PINCFG0_6: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x47
    PINCFG0_7: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x48
    PINCFG0_8: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x49
    PINCFG0_9: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x4a
    PINCFG0_10: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x4b
    PINCFG0_11: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x4c
    PINCFG0_12: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x4d
    PINCFG0_13: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x4e
    PINCFG0_14: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x4f
    PINCFG0_15: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x50
    PINCFG0_16: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x51
    PINCFG0_17: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x52
    PINCFG0_18: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x53
    PINCFG0_19: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x54
    PINCFG0_20: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x55
    PINCFG0_21: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x56
    PINCFG0_22: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x57
    PINCFG0_23: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x58
    PINCFG0_24: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x59
    PINCFG0_25: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x5a
    PINCFG0_26: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x5b
    PINCFG0_27: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x5c
    PINCFG0_28: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x5d
    PINCFG0_29: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x5e
    PINCFG0_30: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Pin Configuration n - Group 0
    /// offset: 0x5f
    PINCFG0_31: mmio.Mmio(packed struct(u8) {
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved6: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x60
    reserved96: [32]u8,
    /// Data Direction
    /// offset: 0x80
    DIR1: u32 = 0x0,
    /// Data Direction Clear
    /// offset: 0x84
    DIRCLR1: u32 = 0x0,
    /// Data Direction Set
    /// offset: 0x88
    DIRSET1: u32 = 0x0,
    /// Data Direction Toggle
    /// offset: 0x8c
    DIRTGL1: u32 = 0x0,
    /// Data Output Value
    /// offset: 0x90
    OUT1: u32 = 0x0,
    /// Data Output Value Clear
    /// offset: 0x94
    OUTCLR1: u32 = 0x0,
    /// Data Output Value Set
    /// offset: 0x98
    OUTSET1: u32 = 0x0,
    /// Data Output Value Toggle
    /// offset: 0x9c
    OUTTGL1: u32 = 0x0,
    /// Data Input Value
    /// offset: 0xa0
    IN1: u32 = 0x0,
    /// Control
    /// offset: 0xa4
    CTRL1: mmio.Mmio(packed struct(u32) {
        /// Input Sampling Mode
        SAMPLING: u32 = 0x0,
    }),
    /// Write Configuration
    /// offset: 0xa8
    WRCONFIG1: mmio.Mmio(packed struct(u32) {
        /// Pin Mask for Multiple Pin Configuration
        PINMASK: u16 = 0x0,
        /// Select Peripheral Multiplexer
        PMUXEN: u1 = 0x0,
        /// Input Enable
        INEN: u1 = 0x0,
        /// Pull Enable
        PULLEN: u1 = 0x0,
        reserved22: u3 = 0,
        /// Output Driver Strength Selection
        DRVSTR: u1 = 0x0,
        reserved24: u1 = 0,
        /// Peripheral Multiplexing Template
        PMUX: u4 = 0x0,
        /// Write PMUX Registers
        WRPMUX: u1 = 0x0,
        reserved30: u1 = 0,
        /// Write PINCFG Registers
        WRPINCFG: u1 = 0x0,
        /// Half-Word Select
        HWSEL: u1 = 0x0,
    }),
    /// Event Input Control
    /// offset: 0xac
    EVCTRL1: mmio.Mmio(packed struct(u32) {
        /// Port Event Pin Identifier 0
        PID0: u5 = 0x0,
        /// Port Event Action 0
        EVACT0: u2 = 0x0,
        /// Port Event Enable Input 0
        PORTEI0: u1 = 0x0,
        /// Port Event Pin Identifier 1
        PID1: u5 = 0x0,
        /// Port Event Action 1
        EVACT1: u2 = 0x0,
        /// Port Event Enable Input 1
        PORTEI1: u1 = 0x0,
        /// Port Event Pin Identifier 2
        PID2: u5 = 0x0,
        /// Port Event Action 2
        EVACT2: u2 = 0x0,
        /// Port Event Enable Input 2
        PORTEI2: u1 = 0x0,
        /// Port Event Pin Identifier 3
        PID3: u5 = 0x0,
        /// Port Event Action 3
        EVACT3: u2 = 0x0,
        /// Port Event Enable Input 3
        PORTEI3: u1 = 0x0,
    }),
    /// Peripheral Multiplexing n - Group 1
    /// offset: 0xb0
    PMUX1_0: u32 = 0x0,
    /// Peripheral Multiplexing n - Group 1
    /// offset: 0xb4
    PMUX1_4: u32 = 0x0,
    /// Peripheral Multiplexing n - Group 1
    /// offset: 0xb8
    PMUX1_8: u32 = 0x0,
    /// Peripheral Multiplexing n - Group 1
    /// offset: 0xbc
    PMUX1_12: u32 = 0x0,
    /// Pin Configuration n - Group 1
    /// offset: 0xc0
    PINCFG1_0: u32 = 0x0,
    /// Pin Configuration n - Group 1
    /// offset: 0xc4
    PINCFG1_4: u32 = 0x0,
    /// Pin Configuration n - Group 1
    /// offset: 0xc8
    PINCFG1_8: u32 = 0x0,
    /// Pin Configuration n - Group 1
    /// offset: 0xcc
    PINCFG1_12: u32 = 0x0,
    /// Pin Configuration n - Group 1
    /// offset: 0xd0
    PINCFG1_16: u32 = 0x0,
    /// Pin Configuration n - Group 1
    /// offset: 0xd4
    PINCFG1_20: u32 = 0x0,
    /// Pin Configuration n - Group 1
    /// offset: 0xd8
    PINCFG1_24: u32 = 0x0,
    /// Pin Configuration n - Group 1
    /// offset: 0xdc
    PINCFG1_28: u32 = 0x0,
};
