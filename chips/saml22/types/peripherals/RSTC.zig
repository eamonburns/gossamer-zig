const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Reset Controller
pub const RSTC = extern struct {
    /// Reset Cause
    /// offset: 0x00
    RCAUSE: mmio.Mmio(packed struct(u8) {
        /// Power On Reset
        POR: u1 = 0x0,
        /// Brown Out CORE Detector Reset
        BODCORE: u1 = 0x0,
        /// Brown Out VDD Detector Reset
        BODVDD: u1 = 0x0,
        reserved4: u1 = 0,
        /// External Reset
        EXT: u1 = 0x0,
        /// Watchdog Reset
        WDT: u1 = 0x0,
        /// System Reset Request
        SYST: u1 = 0x0,
        /// Backup Reset
        BACKUP: u1 = 0x0,
    }),
    /// offset: 0x01
    reserved1: [1]u8,
    /// Backup Exit Source
    /// offset: 0x02
    BKUPEXIT: mmio.Mmio(packed struct(u8) {
        reserved1: u1 = 0,
        /// Real Timer Counter Interrupt
        RTC: u1 = 0x0,
        /// Battery Backup Power Switch
        BBPS: u1 = 0x0,
        padding: u5 = 0,
    }),
};
