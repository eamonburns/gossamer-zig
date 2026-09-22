const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Device Service Unit
pub const DSU = extern struct {
    /// Control
    /// offset: 0x00
    CTRL: mmio.Mmio(packed struct(u8) {
        /// Software Reset
        SWRST: u1 = 0x0,
        reserved2: u1 = 0,
        /// 32-bit Cyclic Redundancy Code
        CRC: u1 = 0x0,
        /// Memory built-in self-test
        MBIST: u1 = 0x0,
        /// Chip-Erase
        CE: u1 = 0x0,
        reserved6: u1 = 0,
        /// Auxiliary Row Read
        ARR: u1 = 0x0,
        /// Start Memory Stream Access
        SMSA: u1 = 0x0,
    }),
    /// Status A
    /// offset: 0x01
    STATUSA: mmio.Mmio(packed struct(u8) {
        /// Done
        DONE: u1 = 0x0,
        /// CPU Reset Phase Extension
        CRSTEXT: u1 = 0x0,
        /// Bus Error
        BERR: u1 = 0x0,
        /// Failure
        FAIL: u1 = 0x0,
        /// Protection Error
        PERR: u1 = 0x0,
        padding: u3 = 0,
    }),
    /// Status B
    /// offset: 0x02
    STATUSB: mmio.Mmio(packed struct(u8) {
        /// Protected
        PROT: u1 = 0x0,
        /// Debugger Present
        DBGPRES: u1 = 0x0,
        /// Debug Communication Channel 0 Dirty
        DCCD0: u1 = 0x0,
        /// Debug Communication Channel 1 Dirty
        DCCD1: u1 = 0x0,
        /// Hot-Plugging Enable
        HPE: u1 = 0x0,
        padding: u3 = 0,
    }),
    /// offset: 0x03
    reserved3: [1]u8,
    /// Address
    /// offset: 0x04
    ADDR: mmio.Mmio(packed struct(u32) {
        /// Access Mode
        AMOD: u2 = 0x0,
        /// Address
        ADDR: u30 = 0x0,
    }),
    /// Length
    /// offset: 0x08
    LENGTH: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Length
        LENGTH: u30 = 0x0,
    }),
    /// Data
    /// offset: 0x0c
    DATA: mmio.Mmio(packed struct(u32) {
        /// Data
        DATA: u32 = 0x0,
    }),
    /// Debug Communication Channel n
    /// offset: 0x10
    DCC0: mmio.Mmio(packed struct(u32) {
        /// Data
        DATA: u32 = 0x0,
    }),
    /// Debug Communication Channel n
    /// offset: 0x14
    DCC1: mmio.Mmio(packed struct(u32) {
        /// Data
        DATA: u32 = 0x0,
    }),
    /// Device Identification
    /// offset: 0x18
    DID: mmio.Mmio(packed struct(u32) {
        /// Device Select
        DEVSEL: u8 = 0x5,
        /// Revision Number
        REVISION: u4 = 0x1,
        /// Die Number
        DIE: u4 = 0x0,
        /// Series
        SERIES: enum(u6) {
            /// Cortex-M0+ processor, basic feature set
            @"0" = 0x0,
            /// Cortex-M0+ processor, USB
            @"1" = 0x1,
            _,
        } = @fromBackingInt(@intCast(0x2)),
        reserved23: u1 = 0,
        /// Family
        FAMILY: enum(u5) {
            /// General purpose microcontroller
            @"0" = 0x0,
            /// PicoPower
            @"1" = 0x1,
            _,
        } = .@"1",
        /// Processor
        PROCESSOR: enum(u4) {
            /// Cortex-M0
            @"0" = 0x0,
            /// Cortex-M0+
            @"1" = 0x1,
            /// Cortex-M3
            @"2" = 0x2,
            /// Cortex-M4
            @"3" = 0x3,
            _,
        } = .@"1",
    }),
    /// offset: 0x1c
    reserved28: [212]u8,
    /// Device Configuration
    /// offset: 0xf0
    DCFG0: mmio.Mmio(packed struct(u32) {
        /// Device Configuration
        DCFG: u32 = 0x0,
    }),
    /// Device Configuration
    /// offset: 0xf4
    DCFG1: mmio.Mmio(packed struct(u32) {
        /// Device Configuration
        DCFG: u32 = 0x0,
    }),
    /// offset: 0xf8
    reserved248: [3848]u8,
    /// CoreSight ROM Table Entry 0
    /// offset: 0x1000
    ENTRY0: mmio.Mmio(packed struct(u32) {
        /// Entry Present
        EPRES: u1 = 0x0,
        /// Format
        FMT: u1 = 0x1,
        reserved12: u10 = 0,
        /// Address Offset
        ADDOFF: u20 = 0x9F0FC,
    }),
    /// CoreSight ROM Table Entry 1
    /// offset: 0x1004
    ENTRY1: u32 = 0x7002,
    /// CoreSight ROM Table End
    /// offset: 0x1008
    END: mmio.Mmio(packed struct(u32) {
        /// End Marker
        END: u32 = 0x0,
    }),
    /// offset: 0x100c
    reserved4108: [4032]u8,
    /// CoreSight ROM Table Memory Type
    /// offset: 0x1fcc
    MEMTYPE: mmio.Mmio(packed struct(u32) {
        /// System Memory Present
        SMEMP: u1 = 0x0,
        padding: u31 = 0,
    }),
    /// Peripheral Identification 4
    /// offset: 0x1fd0
    PID4: mmio.Mmio(packed struct(u32) {
        /// JEP-106 Continuation Code
        JEPCC: u4 = 0x0,
        /// 4KB count
        FKBC: u4 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Identification 5
    /// offset: 0x1fd4
    PID5: u32 = 0x0,
    /// Peripheral Identification 6
    /// offset: 0x1fd8
    PID6: u32 = 0x0,
    /// Peripheral Identification 7
    /// offset: 0x1fdc
    PID7: u32 = 0x0,
    /// Peripheral Identification 0
    /// offset: 0x1fe0
    PID0: mmio.Mmio(packed struct(u32) {
        /// Part Number Low
        PARTNBL: u8 = 0xD0,
        padding: u24 = 0,
    }),
    /// Peripheral Identification 1
    /// offset: 0x1fe4
    PID1: mmio.Mmio(packed struct(u32) {
        /// Part Number High
        PARTNBH: u4 = 0xC,
        /// Low part of the JEP-106 Identity Code
        JEPIDCL: u4 = 0xF,
        padding: u24 = 0,
    }),
    /// Peripheral Identification 2
    /// offset: 0x1fe8
    PID2: mmio.Mmio(packed struct(u32) {
        /// JEP-106 Identity Code High
        JEPIDCH: u3 = 0x1,
        /// JEP-106 Identity Code is used
        JEPU: u1 = 0x1,
        /// Revision Number
        REVISION: u4 = 0x0,
        padding: u24 = 0,
    }),
    /// Peripheral Identification 3
    /// offset: 0x1fec
    PID3: mmio.Mmio(packed struct(u32) {
        /// ARM CUSMOD
        CUSMOD: u4 = 0x0,
        /// Revision Number
        REVAND: u4 = 0x0,
        padding: u24 = 0,
    }),
    /// Component Identification 0
    /// offset: 0x1ff0
    CID0: mmio.Mmio(packed struct(u32) {
        /// Preamble Byte 0
        PREAMBLEB0: u8 = 0xD,
        padding: u24 = 0,
    }),
    /// Component Identification 1
    /// offset: 0x1ff4
    CID1: mmio.Mmio(packed struct(u32) {
        /// Preamble
        PREAMBLE: u4 = 0x0,
        /// Component Class
        CCLASS: u4 = 0x1,
        padding: u24 = 0,
    }),
    /// Component Identification 2
    /// offset: 0x1ff8
    CID2: mmio.Mmio(packed struct(u32) {
        /// Preamble Byte 2
        PREAMBLEB2: u8 = 0x5,
        padding: u24 = 0,
    }),
    /// Component Identification 3
    /// offset: 0x1ffc
    CID3: mmio.Mmio(packed struct(u32) {
        /// Preamble Byte 3
        PREAMBLEB3: u8 = 0xB1,
        padding: u24 = 0,
    }),
};
