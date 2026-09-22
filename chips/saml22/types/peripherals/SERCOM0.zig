const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Serial Communication Interface 0
pub const SERCOM0 = extern struct {
    /// I2C Master Mode
    /// offset: 0x00
    I2CM: extern struct {
        /// I2CM Control A
        /// offset: 0x00
        CTRLA: mmio.Mmio(packed struct(u32) {
            /// Software Reset
            SWRST: u1 = 0x0,
            /// Enable
            ENABLE: u1 = 0x0,
            /// Operating Mode
            MODE: u3 = 0x0,
            reserved7: u2 = 0,
            /// Run in Standby
            RUNSTDBY: u1 = 0x0,
            reserved16: u8 = 0,
            /// Pin Usage
            PINOUT: u1 = 0x0,
            reserved20: u3 = 0,
            /// SDA Hold Time
            SDAHOLD: u2 = 0x0,
            /// Master SCL Low Extend Timeout
            MEXTTOEN: u1 = 0x0,
            /// Slave SCL Low Extend Timeout
            SEXTTOEN: u1 = 0x0,
            /// Transfer Speed
            SPEED: u2 = 0x0,
            reserved27: u1 = 0,
            /// SCL Clock Stretch Mode
            SCLSM: u1 = 0x0,
            /// Inactive Time-Out
            INACTOUT: u2 = 0x0,
            /// SCL Low Timeout Enable
            LOWTOUTEN: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// I2CM Control B
        /// offset: 0x04
        CTRLB: mmio.Mmio(packed struct(u32) {
            reserved8: u8 = 0,
            /// Smart Mode Enable
            SMEN: u1 = 0x0,
            /// Quick Command Enable
            QCEN: u1 = 0x0,
            reserved16: u6 = 0,
            /// Command
            CMD: u2 = 0x0,
            /// Acknowledge Action
            ACKACT: u1 = 0x0,
            padding: u13 = 0,
        }),
        /// offset: 0x08
        reserved8: [4]u8,
        /// I2CM Baud Rate
        /// offset: 0x0c
        BAUD: mmio.Mmio(packed struct(u32) {
            /// Baud Rate Value
            BAUD: u8 = 0x0,
            /// Baud Rate Value Low
            BAUDLOW: u8 = 0x0,
            /// High Speed Baud Rate Value
            HSBAUD: u8 = 0x0,
            /// High Speed Baud Rate Value Low
            HSBAUDLOW: u8 = 0x0,
        }),
        /// offset: 0x10
        reserved16: [4]u8,
        /// I2CM Interrupt Enable Clear
        /// offset: 0x14
        INTENCLR: mmio.Mmio(packed struct(u8) {
            /// Master On Bus Interrupt Disable
            MB: u1 = 0x0,
            /// Slave On Bus Interrupt Disable
            SB: u1 = 0x0,
            reserved7: u5 = 0,
            /// Combined Error Interrupt Disable
            ERROR: u1 = 0x0,
        }),
        /// offset: 0x15
        reserved21: [1]u8,
        /// I2CM Interrupt Enable Set
        /// offset: 0x16
        INTENSET: mmio.Mmio(packed struct(u8) {
            /// Master On Bus Interrupt Enable
            MB: u1 = 0x0,
            /// Slave On Bus Interrupt Enable
            SB: u1 = 0x0,
            reserved7: u5 = 0,
            /// Combined Error Interrupt Enable
            ERROR: u1 = 0x0,
        }),
        /// offset: 0x17
        reserved23: [1]u8,
        /// I2CM Interrupt Flag Status and Clear
        /// offset: 0x18
        INTFLAG: mmio.Mmio(packed struct(u8) {
            /// Master On Bus Interrupt
            MB: u1 = 0x0,
            /// Slave On Bus Interrupt
            SB: u1 = 0x0,
            reserved7: u5 = 0,
            /// Combined Error Interrupt
            ERROR: u1 = 0x0,
        }),
        /// offset: 0x19
        reserved25: [1]u8,
        /// I2CM Status
        /// offset: 0x1a
        STATUS: mmio.Mmio(packed struct(u16) {
            /// Bus Error
            BUSERR: u1 = 0x0,
            /// Arbitration Lost
            ARBLOST: u1 = 0x0,
            /// Received Not Acknowledge
            RXNACK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Bus State
            BUSSTATE: u2 = 0x0,
            /// SCL Low Timeout
            LOWTOUT: u1 = 0x0,
            /// Clock Hold
            CLKHOLD: u1 = 0x0,
            /// Master SCL Low Extend Timeout
            MEXTTOUT: u1 = 0x0,
            /// Slave SCL Low Extend Timeout
            SEXTTOUT: u1 = 0x0,
            /// Length Error
            LENERR: u1 = 0x0,
            padding: u5 = 0,
        }),
        /// I2CM Synchronization Busy
        /// offset: 0x1c
        SYNCBUSY: mmio.Mmio(packed struct(u32) {
            /// Software Reset Synchronization Busy
            SWRST: u1 = 0x0,
            /// SERCOM Enable Synchronization Busy
            ENABLE: u1 = 0x0,
            /// System Operation Synchronization Busy
            SYSOP: u1 = 0x0,
            padding: u29 = 0,
        }),
        /// offset: 0x20
        reserved32: [4]u8,
        /// I2CM Address
        /// offset: 0x24
        ADDR: mmio.Mmio(packed struct(u32) {
            /// Address Value
            ADDR: u11 = 0x0,
            reserved13: u2 = 0,
            /// Length Enable
            LENEN: u1 = 0x0,
            /// High Speed Mode
            HS: u1 = 0x0,
            /// Ten Bit Addressing Enable
            TENBITEN: u1 = 0x0,
            /// Length
            LEN: u8 = 0x0,
            padding: u8 = 0,
        }),
        /// I2CM Data
        /// offset: 0x28
        DATA: mmio.Mmio(packed struct(u8) {
            /// Data Value
            DATA: u8 = 0x0,
        }),
        /// offset: 0x29
        reserved41: [7]u8,
        /// I2CM Debug Control
        /// offset: 0x30
        DBGCTRL: mmio.Mmio(packed struct(u8) {
            /// Debug Mode
            DBGSTOP: u1 = 0x0,
            padding: u7 = 0,
        }),
    },
};
