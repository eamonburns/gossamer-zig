const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Non-Volatile Memory Controller
pub const NVMCTRL = extern struct {
    /// Control A
    /// offset: 0x00
    CTRLA: mmio.Mmio(packed struct(u16) {
        /// Command
        CMD: enum(u7) {
            /// Erase Row - Erases the row addressed by the ADDR register.
            ER = 0x2,
            /// Write Page - Writes the contents of the page buffer to the page addressed by the ADDR register.
            WP = 0x4,
            /// Erase Auxiliary Row - Erases the auxiliary row addressed by the ADDR register. This command can be given only when the security bit is not set and only to the user configuration row.
            EAR = 0x5,
            /// Write Auxiliary Page - Writes the contents of the page buffer to the page addressed by the ADDR register. This command can be given only when the security bit is not set and only to the user configuration row.
            WAP = 0x6,
            /// Security Flow Command
            SF = 0xa,
            /// Write lockbits
            WL = 0xf,
            /// RWW EEPROM area Erase Row - Erases the row addressed by the ADDR register.
            RWWEEER = 0x1a,
            /// RWW EEPROM Write Page - Writes the contents of the page buffer to the page addressed by the ADDR register.
            RWWEEWP = 0x1c,
            /// Lock Region - Locks the region containing the address location in the ADDR register.
            LR = 0x40,
            /// Unlock Region - Unlocks the region containing the address location in the ADDR register.
            UR = 0x41,
            /// Sets the power reduction mode.
            SPRM = 0x42,
            /// Clears the power reduction mode.
            CPRM = 0x43,
            /// Page Buffer Clear - Clears the page buffer.
            PBC = 0x44,
            /// Set Security Bit - Sets the security bit by writing 0x00 to the first byte in the lockbit row.
            SSB = 0x45,
            /// Invalidate all cache lines.
            INVALL = 0x46,
            _,
        } = @fromBackingInt(@intCast(0x0)),
        reserved8: u1 = 0,
        /// Command Execution
        CMDEX: enum(u8) {
            /// Execution Key
            KEY = 0xa5,
            _,
        } = @fromBackingInt(@intCast(0x0)),
    }),
    /// offset: 0x02
    reserved2: [2]u8,
    /// Control B
    /// offset: 0x04
    CTRLB: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// NVM Read Wait States
        RWS: enum(u4) {
            /// Single Auto Wait State
            SINGLE = 0x0,
            /// Half Auto Wait State
            HALF = 0x1,
            /// Dual Auto Wait State
            DUAL = 0x2,
            _,
        } = .SINGLE,
        reserved7: u2 = 0,
        /// Manual Write
        MANW: u1 = 0x1,
        /// Power Reduction Mode during Sleep
        SLEEPPRM: enum(u2) {
            /// NVM block enters low-power mode when entering sleep.NVM block exits low-power mode upon first access.
            WAKEONACCESS = 0x0,
            /// NVM block enters low-power mode when entering sleep.NVM block exits low-power mode when exiting sleep.
            WAKEUPINSTANT = 0x1,
            /// Auto power reduction disabled.
            DISABLED = 0x3,
            _,
        } = .WAKEONACCESS,
        reserved11: u1 = 0,
        /// fast wake-up
        FWUP: u1 = 0x0,
        reserved16: u4 = 0,
        /// NVMCTRL Read Mode
        READMODE: enum(u2) {
            /// The NVM Controller (cache system) does not insert wait states on a cache miss. Gives the best system performance.
            NO_MISS_PENALTY = 0x0,
            /// Reduces power consumption of the cache system, but inserts a wait state each time there is a cache miss. This mode may not be relevant if CPU performance is required, as the application will be stalled and may lead to increase run time.
            LOW_POWER = 0x1,
            /// The cache system ensures that a cache hit or miss takes the same amount of time, determined by the number of programmed flash wait states. This mode can be used for real-time applications that require deterministic execution timings.
            DETERMINISTIC = 0x2,
            _,
        } = .NO_MISS_PENALTY,
        /// Cache Disable
        CACHEDIS: u1 = 0x0,
        padding: u13 = 0,
    }),
    /// NVM Parameter
    /// offset: 0x08
    PARAM: mmio.Mmio(packed struct(u32) {
        /// NVM Pages
        NVMP: u16 = 0x0,
        /// Page Size
        PSZ: enum(u3) {
            /// 8 bytes
            @"8" = 0x0,
            /// 16 bytes
            @"16" = 0x1,
            /// 32 bytes
            @"32" = 0x2,
            /// 64 bytes
            @"64" = 0x3,
            /// 128 bytes
            @"128" = 0x4,
            /// 256 bytes
            @"256" = 0x5,
            /// 512 bytes
            @"512" = 0x6,
            /// 1024 bytes
            @"1024" = 0x7,
        } = .@"8",
        reserved20: u1 = 0,
        /// RWW EEPROM Pages
        RWWEEP: u12 = 0x0,
    }),
    /// Interrupt Enable Clear
    /// offset: 0x0c
    INTENCLR: mmio.Mmio(packed struct(u8) {
        /// NVM Ready Interrupt Enable
        READY: u1 = 0x0,
        /// Error Interrupt Enable
        ERROR: u1 = 0x0,
        padding: u6 = 0,
    }),
    /// offset: 0x0d
    reserved13: [3]u8,
    /// Interrupt Enable Set
    /// offset: 0x10
    INTENSET: mmio.Mmio(packed struct(u8) {
        /// NVM Ready Interrupt Enable
        READY: u1 = 0x0,
        /// Error Interrupt Enable
        ERROR: u1 = 0x0,
        padding: u6 = 0,
    }),
    /// offset: 0x11
    reserved17: [3]u8,
    /// Interrupt Flag Status and Clear
    /// offset: 0x14
    INTFLAG: mmio.Mmio(packed struct(u8) {
        /// NVM Ready
        READY: u1 = 0x0,
        /// Error
        ERROR: u1 = 0x0,
        padding: u6 = 0,
    }),
    /// offset: 0x15
    reserved21: [3]u8,
    /// Status
    /// offset: 0x18
    STATUS: mmio.Mmio(packed struct(u16) {
        /// Power Reduction Mode
        PRM: u1 = 0x0,
        /// NVM Page Buffer Active Loading
        LOAD: u1 = 0x0,
        /// Programming Error Status
        PROGE: u1 = 0x0,
        /// Lock Error Status
        LOCKE: u1 = 0x0,
        /// NVM Error
        NVME: u1 = 0x0,
        reserved8: u3 = 0,
        /// Security Bit Status
        SB: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// offset: 0x1a
    reserved26: [2]u8,
    /// Address
    /// offset: 0x1c
    ADDR: mmio.Mmio(packed struct(u32) {
        /// NVM Address
        ADDR: u22 = 0x0,
        padding: u10 = 0,
    }),
    /// Lock Section
    /// offset: 0x20
    LOCK: mmio.Mmio(packed struct(u16) {
        /// Region Lock Bits
        LOCK: u16 = 0x0,
    }),
};
