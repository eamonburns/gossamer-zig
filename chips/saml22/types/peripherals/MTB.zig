const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Cortex-M0+ Micro-Trace Buffer
pub const MTB = extern struct {
    /// MTB Position
    /// offset: 0x00
    POSITION: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Pointer Value Wraps
        WRAP: u1 = 0x0,
        /// Trace Packet Location Pointer
        POINTER: u29 = 0x0,
    }),
    /// MTB Master
    /// offset: 0x04
    MASTER: mmio.Mmio(packed struct(u32) {
        /// Maximum Value of the Trace Buffer in SRAM
        MASK: u5 = 0x0,
        /// Trace Start Input Enable
        TSTARTEN: u1 = 0x0,
        /// Trace Stop Input Enable
        TSTOPEN: u1 = 0x0,
        /// Special Function Register Write Privilege
        SFRWPRIV: u1 = 0x0,
        /// SRAM Privilege
        RAMPRIV: u1 = 0x0,
        /// Halt Request
        HALTREQ: u1 = 0x0,
        reserved31: u21 = 0,
        /// Main Trace Enable
        EN: u1 = 0x0,
    }),
    /// MTB Flow
    /// offset: 0x08
    FLOW: mmio.Mmio(packed struct(u32) {
        /// Auto Stop Tracing
        AUTOSTOP: u1 = 0x0,
        /// Auto Halt Request
        AUTOHALT: u1 = 0x0,
        reserved3: u1 = 0,
        /// Watermark value
        WATERMARK: u29 = 0x0,
    }),
    /// MTB Base
    /// offset: 0x0c
    BASE: u32 = 0x0,
    /// offset: 0x10
    reserved16: [3824]u8,
    /// MTB Integration Mode Control
    /// offset: 0xf00
    ITCTRL: u32 = 0x0,
    /// offset: 0xf04
    reserved3844: [156]u8,
    /// MTB Claim Set
    /// offset: 0xfa0
    CLAIMSET: u32 = 0x0,
    /// MTB Claim Clear
    /// offset: 0xfa4
    CLAIMCLR: u32 = 0x0,
    /// offset: 0xfa8
    reserved4008: [8]u8,
    /// MTB Lock Access
    /// offset: 0xfb0
    LOCKACCESS: u32 = 0x0,
    /// MTB Lock Status
    /// offset: 0xfb4
    LOCKSTATUS: u32 = 0x0,
    /// MTB Authentication Status
    /// offset: 0xfb8
    AUTHSTATUS: u32 = 0x0,
    /// MTB Device Architecture
    /// offset: 0xfbc
    DEVARCH: u32 = 0x0,
    /// offset: 0xfc0
    reserved4032: [8]u8,
    /// MTB Device Configuration
    /// offset: 0xfc8
    DEVID: u32 = 0x0,
    /// MTB Device Type
    /// offset: 0xfcc
    DEVTYPE: u32 = 0x0,
    /// Peripheral Identification 4
    /// offset: 0xfd0
    PID4: u32 = 0x0,
    /// Peripheral Identification 5
    /// offset: 0xfd4
    PID5: u32 = 0x0,
    /// Peripheral Identification 6
    /// offset: 0xfd8
    PID6: u32 = 0x0,
    /// Peripheral Identification 7
    /// offset: 0xfdc
    PID7: u32 = 0x0,
    /// Peripheral Identification 0
    /// offset: 0xfe0
    PID0: u32 = 0x0,
    /// Peripheral Identification 1
    /// offset: 0xfe4
    PID1: u32 = 0x0,
    /// Peripheral Identification 2
    /// offset: 0xfe8
    PID2: u32 = 0x0,
    /// Peripheral Identification 3
    /// offset: 0xfec
    PID3: u32 = 0x0,
    /// Component Identification 0
    /// offset: 0xff0
    CID0: u32 = 0x0,
    /// Component Identification 1
    /// offset: 0xff4
    CID1: u32 = 0x0,
    /// Component Identification 2
    /// offset: 0xff8
    CID2: u32 = 0x0,
    /// Component Identification 3
    /// offset: 0xffc
    CID3: u32 = 0x0,
};
