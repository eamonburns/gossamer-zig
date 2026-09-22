const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Direct Memory Access Controller
pub const DMAC = extern struct {
    /// Control
    /// offset: 0x00
    CTRL: mmio.Mmio(packed struct(u16) {
        /// Software Reset
        SWRST: u1 = 0x0,
        /// DMA Enable
        DMAENABLE: u1 = 0x0,
        /// CRC Enable
        CRCENABLE: u1 = 0x0,
        reserved8: u5 = 0,
        /// Priority Level 0 Enable
        LVLEN0: u1 = 0x0,
        /// Priority Level 1 Enable
        LVLEN1: u1 = 0x0,
        /// Priority Level 2 Enable
        LVLEN2: u1 = 0x0,
        /// Priority Level 3 Enable
        LVLEN3: u1 = 0x0,
        padding: u4 = 0,
    }),
    /// CRC Control
    /// offset: 0x02
    CRCCTRL: mmio.Mmio(packed struct(u16) {
        /// CRC Beat Size
        CRCBEATSIZE: enum(u2) {
            /// 8-bit bus transfer
            BYTE = 0x0,
            /// 16-bit bus transfer
            HWORD = 0x1,
            /// 32-bit bus transfer
            WORD = 0x2,
            _,
        } = .BYTE,
        /// CRC Polynomial Type
        CRCPOLY: enum(u2) {
            /// CRC-16 (CRC-CCITT)
            CRC16 = 0x0,
            /// CRC32 (IEEE 802.3)
            CRC32 = 0x1,
            _,
        } = .CRC16,
        reserved8: u4 = 0,
        /// CRC Input Source
        CRCSRC: enum(u6) {
            /// No action
            NOACT = 0x0,
            /// I/O interface
            IO = 0x1,
            _,
        } = .NOACT,
        padding: u2 = 0,
    }),
    /// CRC Data Input
    /// offset: 0x04
    CRCDATAIN: mmio.Mmio(packed struct(u32) {
        /// CRC Data Input
        CRCDATAIN: u32 = 0x0,
    }),
    /// CRC Checksum
    /// offset: 0x08
    CRCCHKSUM: mmio.Mmio(packed struct(u32) {
        /// CRC Checksum
        CRCCHKSUM: u32 = 0x0,
    }),
    /// CRC Status
    /// offset: 0x0c
    CRCSTATUS: mmio.Mmio(packed struct(u8) {
        /// CRC Module Busy
        CRCBUSY: u1 = 0x0,
        /// CRC Zero
        CRCZERO: u1 = 0x0,
        padding: u6 = 0,
    }),
    /// Debug Control
    /// offset: 0x0d
    DBGCTRL: mmio.Mmio(packed struct(u8) {
        /// Debug Run
        DBGRUN: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// QOS Control
    /// offset: 0x0e
    QOSCTRL: mmio.Mmio(packed struct(u8) {
        /// Write-Back Quality of Service
        WRBQOS: enum(u2) {
            /// Background (no sensitive operation)
            DISABLE = 0x0,
            /// Sensitive Bandwidth
            LOW = 0x1,
            /// Sensitive Latency
            MEDIUM = 0x2,
            /// Critical Latency
            HIGH = 0x3,
        } = .MEDIUM,
        /// Fetch Quality of Service
        FQOS: enum(u2) {
            /// Background (no sensitive operation)
            DISABLE = 0x0,
            /// Sensitive Bandwidth
            LOW = 0x1,
            /// Sensitive Latency
            MEDIUM = 0x2,
            /// Critical Latency
            HIGH = 0x3,
        } = .MEDIUM,
        /// Data Transfer Quality of Service
        DQOS: enum(u2) {
            /// Background (no sensitive operation)
            DISABLE = 0x0,
            /// Sensitive Bandwidth
            LOW = 0x1,
            /// Sensitive Latency
            MEDIUM = 0x2,
            /// Critical Latency
            HIGH = 0x3,
        } = .MEDIUM,
        padding: u2 = 0,
    }),
    /// offset: 0x0f
    reserved15: [1]u8,
    /// Software Trigger Control
    /// offset: 0x10
    SWTRIGCTRL: mmio.Mmio(packed struct(u32) {
        /// Channel 0 Software Trigger
        SWTRIG0: u1 = 0x0,
        /// Channel 1 Software Trigger
        SWTRIG1: u1 = 0x0,
        /// Channel 2 Software Trigger
        SWTRIG2: u1 = 0x0,
        /// Channel 3 Software Trigger
        SWTRIG3: u1 = 0x0,
        /// Channel 4 Software Trigger
        SWTRIG4: u1 = 0x0,
        /// Channel 5 Software Trigger
        SWTRIG5: u1 = 0x0,
        /// Channel 6 Software Trigger
        SWTRIG6: u1 = 0x0,
        /// Channel 7 Software Trigger
        SWTRIG7: u1 = 0x0,
        /// Channel 8 Software Trigger
        SWTRIG8: u1 = 0x0,
        /// Channel 9 Software Trigger
        SWTRIG9: u1 = 0x0,
        /// Channel 10 Software Trigger
        SWTRIG10: u1 = 0x0,
        /// Channel 11 Software Trigger
        SWTRIG11: u1 = 0x0,
        /// Channel 12 Software Trigger
        SWTRIG12: u1 = 0x0,
        /// Channel 13 Software Trigger
        SWTRIG13: u1 = 0x0,
        /// Channel 14 Software Trigger
        SWTRIG14: u1 = 0x0,
        /// Channel 15 Software Trigger
        SWTRIG15: u1 = 0x0,
        padding: u16 = 0,
    }),
    /// Priority Control 0
    /// offset: 0x14
    PRICTRL0: mmio.Mmio(packed struct(u32) {
        /// Level 0 Channel Priority Number
        LVLPRI0: u4 = 0x0,
        reserved7: u3 = 0,
        /// Level 0 Round-Robin Scheduling Enable
        RRLVLEN0: u1 = 0x0,
        /// Level 1 Channel Priority Number
        LVLPRI1: u4 = 0x0,
        reserved15: u3 = 0,
        /// Level 1 Round-Robin Scheduling Enable
        RRLVLEN1: u1 = 0x0,
        /// Level 2 Channel Priority Number
        LVLPRI2: u4 = 0x0,
        reserved23: u3 = 0,
        /// Level 2 Round-Robin Scheduling Enable
        RRLVLEN2: u1 = 0x0,
        /// Level 3 Channel Priority Number
        LVLPRI3: u4 = 0x0,
        reserved31: u3 = 0,
        /// Level 3 Round-Robin Scheduling Enable
        RRLVLEN3: u1 = 0x0,
    }),
    /// offset: 0x18
    reserved24: [8]u8,
    /// Interrupt Pending
    /// offset: 0x20
    INTPEND: mmio.Mmio(packed struct(u16) {
        /// Channel ID
        ID: u4 = 0x0,
        reserved8: u4 = 0,
        /// Transfer Error
        TERR: u1 = 0x0,
        /// Transfer Complete
        TCMPL: u1 = 0x0,
        /// Channel Suspend
        SUSP: u1 = 0x0,
        reserved13: u2 = 0,
        /// Fetch Error
        FERR: u1 = 0x0,
        /// Busy
        BUSY: u1 = 0x0,
        /// Pending
        PEND: u1 = 0x0,
    }),
    /// offset: 0x22
    reserved34: [2]u8,
    /// Interrupt Status
    /// offset: 0x24
    INTSTATUS: mmio.Mmio(packed struct(u32) {
        /// Channel 0 Pending Interrupt
        CHINT0: u1 = 0x0,
        /// Channel 1 Pending Interrupt
        CHINT1: u1 = 0x0,
        /// Channel 2 Pending Interrupt
        CHINT2: u1 = 0x0,
        /// Channel 3 Pending Interrupt
        CHINT3: u1 = 0x0,
        /// Channel 4 Pending Interrupt
        CHINT4: u1 = 0x0,
        /// Channel 5 Pending Interrupt
        CHINT5: u1 = 0x0,
        /// Channel 6 Pending Interrupt
        CHINT6: u1 = 0x0,
        /// Channel 7 Pending Interrupt
        CHINT7: u1 = 0x0,
        /// Channel 8 Pending Interrupt
        CHINT8: u1 = 0x0,
        /// Channel 9 Pending Interrupt
        CHINT9: u1 = 0x0,
        /// Channel 10 Pending Interrupt
        CHINT10: u1 = 0x0,
        /// Channel 11 Pending Interrupt
        CHINT11: u1 = 0x0,
        /// Channel 12 Pending Interrupt
        CHINT12: u1 = 0x0,
        /// Channel 13 Pending Interrupt
        CHINT13: u1 = 0x0,
        /// Channel 14 Pending Interrupt
        CHINT14: u1 = 0x0,
        /// Channel 15 Pending Interrupt
        CHINT15: u1 = 0x0,
        padding: u16 = 0,
    }),
    /// Busy Channels
    /// offset: 0x28
    BUSYCH: mmio.Mmio(packed struct(u32) {
        /// Busy Channel 0
        BUSYCH0: u1 = 0x0,
        /// Busy Channel 1
        BUSYCH1: u1 = 0x0,
        /// Busy Channel 2
        BUSYCH2: u1 = 0x0,
        /// Busy Channel 3
        BUSYCH3: u1 = 0x0,
        /// Busy Channel 4
        BUSYCH4: u1 = 0x0,
        /// Busy Channel 5
        BUSYCH5: u1 = 0x0,
        /// Busy Channel 6
        BUSYCH6: u1 = 0x0,
        /// Busy Channel 7
        BUSYCH7: u1 = 0x0,
        /// Busy Channel 8
        BUSYCH8: u1 = 0x0,
        /// Busy Channel 9
        BUSYCH9: u1 = 0x0,
        /// Busy Channel 10
        BUSYCH10: u1 = 0x0,
        /// Busy Channel 11
        BUSYCH11: u1 = 0x0,
        /// Busy Channel 12
        BUSYCH12: u1 = 0x0,
        /// Busy Channel 13
        BUSYCH13: u1 = 0x0,
        /// Busy Channel 14
        BUSYCH14: u1 = 0x0,
        /// Busy Channel 15
        BUSYCH15: u1 = 0x0,
        padding: u16 = 0,
    }),
    /// Pending Channels
    /// offset: 0x2c
    PENDCH: mmio.Mmio(packed struct(u32) {
        /// Pending Channel 0
        PENDCH0: u1 = 0x0,
        /// Pending Channel 1
        PENDCH1: u1 = 0x0,
        /// Pending Channel 2
        PENDCH2: u1 = 0x0,
        /// Pending Channel 3
        PENDCH3: u1 = 0x0,
        /// Pending Channel 4
        PENDCH4: u1 = 0x0,
        /// Pending Channel 5
        PENDCH5: u1 = 0x0,
        /// Pending Channel 6
        PENDCH6: u1 = 0x0,
        /// Pending Channel 7
        PENDCH7: u1 = 0x0,
        /// Pending Channel 8
        PENDCH8: u1 = 0x0,
        /// Pending Channel 9
        PENDCH9: u1 = 0x0,
        /// Pending Channel 10
        PENDCH10: u1 = 0x0,
        /// Pending Channel 11
        PENDCH11: u1 = 0x0,
        /// Pending Channel 12
        PENDCH12: u1 = 0x0,
        /// Pending Channel 13
        PENDCH13: u1 = 0x0,
        /// Pending Channel 14
        PENDCH14: u1 = 0x0,
        /// Pending Channel 15
        PENDCH15: u1 = 0x0,
        padding: u16 = 0,
    }),
    /// Active Channel and Levels
    /// offset: 0x30
    ACTIVE: mmio.Mmio(packed struct(u32) {
        /// Level 0 Channel Trigger Request Executing
        LVLEX0: u1 = 0x0,
        /// Level 1 Channel Trigger Request Executing
        LVLEX1: u1 = 0x0,
        /// Level 2 Channel Trigger Request Executing
        LVLEX2: u1 = 0x0,
        /// Level 3 Channel Trigger Request Executing
        LVLEX3: u1 = 0x0,
        reserved8: u4 = 0,
        /// Active Channel ID
        ID: u5 = 0x0,
        reserved15: u2 = 0,
        /// Active Channel Busy
        ABUSY: u1 = 0x0,
        /// Active Channel Block Transfer Count
        BTCNT: u16 = 0x0,
    }),
    /// Descriptor Memory Section Base Address
    /// offset: 0x34
    BASEADDR: mmio.Mmio(packed struct(u32) {
        /// Descriptor Memory Base Address
        BASEADDR: u32 = 0x0,
    }),
    /// Write-Back Memory Section Base Address
    /// offset: 0x38
    WRBADDR: mmio.Mmio(packed struct(u32) {
        /// Write-Back Memory Base Address
        WRBADDR: u32 = 0x0,
    }),
    /// offset: 0x3c
    reserved60: [3]u8,
    /// Channel ID
    /// offset: 0x3f
    CHID: mmio.Mmio(packed struct(u8) {
        /// Channel ID
        ID: u4 = 0x0,
        padding: u4 = 0,
    }),
    /// Channel Control A
    /// offset: 0x40
    CHCTRLA: mmio.Mmio(packed struct(u8) {
        /// Channel Software Reset
        SWRST: u1 = 0x0,
        /// Channel Enable
        ENABLE: u1 = 0x0,
        reserved6: u4 = 0,
        /// Channel run in standby
        RUNSTDBY: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x41
    reserved65: [3]u8,
    /// Channel Control B
    /// offset: 0x44
    CHCTRLB: mmio.Mmio(packed struct(u32) {
        /// Event Input Action
        EVACT: enum(u3) {
            /// No action
            NOACT = 0x0,
            /// Transfer and periodic transfer trigger
            TRIG = 0x1,
            /// Conditional transfer trigger
            CTRIG = 0x2,
            /// Conditional block transfer
            CBLOCK = 0x3,
            /// Channel suspend operation
            SUSPEND = 0x4,
            /// Channel resume operation
            RESUME = 0x5,
            /// Skip next block suspend action
            SSKIP = 0x6,
            _,
        } = .NOACT,
        /// Channel Event Input Enable
        EVIE: u1 = 0x0,
        /// Channel Event Output Enable
        EVOE: u1 = 0x0,
        /// Channel Arbitration Level
        LVL: u2 = 0x0,
        reserved8: u1 = 0,
        /// Trigger Source
        TRIGSRC: enum(u6) {
            /// Only software/event triggers
            DISABLE = 0x0,
            _,
        } = .DISABLE,
        reserved22: u8 = 0,
        /// Trigger Action
        TRIGACT: enum(u2) {
            /// One trigger required for each block transfer
            BLOCK = 0x0,
            /// One trigger required for each beat transfer
            BEAT = 0x2,
            /// One trigger required for each transaction
            TRANSACTION = 0x3,
            _,
        } = .BLOCK,
        /// Software Command
        CMD: enum(u2) {
            /// No action
            NOACT = 0x0,
            /// Channel suspend operation
            SUSPEND = 0x1,
            /// Channel resume operation
            RESUME = 0x2,
            _,
        } = .NOACT,
        padding: u6 = 0,
    }),
    /// offset: 0x48
    reserved72: [4]u8,
    /// Channel Interrupt Enable Clear
    /// offset: 0x4c
    CHINTENCLR: mmio.Mmio(packed struct(u8) {
        /// Channel Transfer Error Interrupt Enable
        TERR: u1 = 0x0,
        /// Channel Transfer Complete Interrupt Enable
        TCMPL: u1 = 0x0,
        /// Channel Suspend Interrupt Enable
        SUSP: u1 = 0x0,
        padding: u5 = 0,
    }),
    /// Channel Interrupt Enable Set
    /// offset: 0x4d
    CHINTENSET: mmio.Mmio(packed struct(u8) {
        /// Channel Transfer Error Interrupt Enable
        TERR: u1 = 0x0,
        /// Channel Transfer Complete Interrupt Enable
        TCMPL: u1 = 0x0,
        /// Channel Suspend Interrupt Enable
        SUSP: u1 = 0x0,
        padding: u5 = 0,
    }),
    /// Channel Interrupt Flag Status and Clear
    /// offset: 0x4e
    CHINTFLAG: mmio.Mmio(packed struct(u8) {
        /// Channel Transfer Error
        TERR: u1 = 0x0,
        /// Channel Transfer Complete
        TCMPL: u1 = 0x0,
        /// Channel Suspend
        SUSP: u1 = 0x0,
        padding: u5 = 0,
    }),
    /// Channel Status
    /// offset: 0x4f
    CHSTATUS: mmio.Mmio(packed struct(u8) {
        /// Channel Pending
        PEND: u1 = 0x0,
        /// Channel Busy
        BUSY: u1 = 0x0,
        /// Channel Fetch Error
        FERR: u1 = 0x0,
        padding: u5 = 0,
    }),
};
