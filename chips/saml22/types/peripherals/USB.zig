const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Universal Serial Bus
pub const USB = extern struct {
    /// USB is Device
    /// offset: 0x00
    DEVICE: extern struct {
        /// Control A
        /// offset: 0x00
        CTRLA: mmio.Mmio(packed struct(u8) {
            /// Software Reset
            SWRST: u1 = 0x0,
            /// Enable
            ENABLE: u1 = 0x0,
            /// Run in Standby Mode
            RUNSTDBY: u1 = 0x0,
            reserved7: u4 = 0,
            /// Operating Mode
            MODE: enum(u1) {
                /// Device Mode
                DEVICE = 0x0,
                _,
            } = .DEVICE,
        }),
        /// offset: 0x01
        reserved1: [1]u8,
        /// Synchronization Busy
        /// offset: 0x02
        SYNCBUSY: mmio.Mmio(packed struct(u8) {
            /// Software Reset Synchronization Busy
            SWRST: u1 = 0x0,
            /// Enable Synchronization Busy
            ENABLE: u1 = 0x0,
            padding: u6 = 0,
        }),
        /// USB Quality Of Service
        /// offset: 0x03
        QOSCTRL: mmio.Mmio(packed struct(u8) {
            /// Configuration Quality of Service
            CQOS: u2 = 0x3,
            /// Data Quality of Service
            DQOS: u2 = 0x3,
            padding: u4 = 0,
        }),
        /// offset: 0x04
        reserved4: [4]u8,
        /// DEVICE Control B
        /// offset: 0x08
        CTRLB: mmio.Mmio(packed struct(u16) {
            /// Detach
            DETACH: u1 = 0x1,
            /// Upstream Resume
            UPRSM: u1 = 0x0,
            /// Speed Configuration
            SPDCONF: enum(u2) {
                /// FS : Full Speed
                FS = 0x0,
                /// LS : Low Speed
                LS = 0x1,
                /// HS : High Speed capable
                HS = 0x2,
                /// HSTM: High Speed Test Mode (force high-speed mode for test mode)
                HSTM = 0x3,
            } = .FS,
            /// No Reply
            NREPLY: u1 = 0x0,
            /// Test mode J
            TSTJ: u1 = 0x0,
            /// Test mode K
            TSTK: u1 = 0x0,
            /// Test packet mode
            TSTPCKT: u1 = 0x0,
            /// Specific Operational Mode
            OPMODE2: u1 = 0x0,
            /// Global NAK
            GNAK: u1 = 0x0,
            /// Link Power Management Handshake
            LPMHDSK: enum(u2) {
                /// No handshake. LPM is not supported
                NO = 0x0,
                /// ACK
                ACK = 0x1,
                /// NYET
                NYET = 0x2,
                /// STALL
                STALL = 0x3,
            } = .NO,
            padding: u4 = 0,
        }),
        /// DEVICE Device Address
        /// offset: 0x0a
        DADD: mmio.Mmio(packed struct(u8) {
            /// Device Address
            DADD: u7 = 0x0,
            /// Device Address Enable
            ADDEN: u1 = 0x0,
        }),
        /// offset: 0x0b
        reserved11: [1]u8,
        /// DEVICE Status
        /// offset: 0x0c
        STATUS: mmio.Mmio(packed struct(u8) {
            reserved2: u2 = 0,
            /// Speed Status
            SPEED: enum(u2) {
                /// Full-speed mode
                FS = 0x0,
                /// High-speed mode
                HS = 0x1,
                /// Low-speed mode
                LS = 0x2,
                _,
            } = .FS,
            reserved6: u2 = 0,
            /// USB Line State Status
            LINESTATE: enum(u2) {
                /// SE0/RESET
                @"0" = 0x0,
                /// FS-J or LS-K State
                @"1" = 0x1,
                /// FS-K or LS-J State
                @"2" = 0x2,
                _,
            } = .@"1",
        }),
        /// Finite State Machine Status
        /// offset: 0x0d
        FSMSTATUS: mmio.Mmio(packed struct(u8) {
            /// Fine State Machine Status
            FSMSTATE: enum(u7) {
                /// OFF (L3). It corresponds to the powered-off, disconnected, and disabled state
                OFF = 0x1,
                /// ON (L0). It corresponds to the Idle and Active states
                ON = 0x2,
                /// SUSPEND (L2)
                SUSPEND = 0x4,
                /// SLEEP (L1)
                SLEEP = 0x8,
                /// DNRESUME. Down Stream Resume.
                DNRESUME = 0x10,
                /// UPRESUME. Up Stream Resume.
                UPRESUME = 0x20,
                /// RESET. USB lines Reset.
                RESET = 0x40,
                _,
            } = .OFF,
            padding: u1 = 0,
        }),
        /// offset: 0x0e
        reserved14: [2]u8,
        /// DEVICE Device Frame Number
        /// offset: 0x10
        FNUM: mmio.Mmio(packed struct(u16) {
            /// Micro Frame Number
            MFNUM: u3 = 0x0,
            /// Frame Number
            FNUM: u11 = 0x0,
            reserved15: u1 = 0,
            /// Frame Number CRC Error
            FNCERR: u1 = 0x0,
        }),
        /// offset: 0x12
        reserved18: [2]u8,
        /// DEVICE Device Interrupt Enable Clear
        /// offset: 0x14
        INTENCLR: mmio.Mmio(packed struct(u16) {
            /// Suspend Interrupt Enable
            SUSPEND: u1 = 0x0,
            /// Micro Start of Frame Interrupt Enable in High Speed Mode
            MSOF: u1 = 0x0,
            /// Start Of Frame Interrupt Enable
            SOF: u1 = 0x0,
            /// End of Reset Interrupt Enable
            EORST: u1 = 0x0,
            /// Wake Up Interrupt Enable
            WAKEUP: u1 = 0x0,
            /// End Of Resume Interrupt Enable
            EORSM: u1 = 0x0,
            /// Upstream Resume Interrupt Enable
            UPRSM: u1 = 0x0,
            /// Ram Access Interrupt Enable
            RAMACER: u1 = 0x0,
            /// Link Power Management Not Yet Interrupt Enable
            LPMNYET: u1 = 0x0,
            /// Link Power Management Suspend Interrupt Enable
            LPMSUSP: u1 = 0x0,
            padding: u6 = 0,
        }),
        /// offset: 0x16
        reserved22: [2]u8,
        /// DEVICE Device Interrupt Enable Set
        /// offset: 0x18
        INTENSET: mmio.Mmio(packed struct(u16) {
            /// Suspend Interrupt Enable
            SUSPEND: u1 = 0x0,
            /// Micro Start of Frame Interrupt Enable in High Speed Mode
            MSOF: u1 = 0x0,
            /// Start Of Frame Interrupt Enable
            SOF: u1 = 0x0,
            /// End of Reset Interrupt Enable
            EORST: u1 = 0x0,
            /// Wake Up Interrupt Enable
            WAKEUP: u1 = 0x0,
            /// End Of Resume Interrupt Enable
            EORSM: u1 = 0x0,
            /// Upstream Resume Interrupt Enable
            UPRSM: u1 = 0x0,
            /// Ram Access Interrupt Enable
            RAMACER: u1 = 0x0,
            /// Link Power Management Not Yet Interrupt Enable
            LPMNYET: u1 = 0x0,
            /// Link Power Management Suspend Interrupt Enable
            LPMSUSP: u1 = 0x0,
            padding: u6 = 0,
        }),
        /// offset: 0x1a
        reserved26: [2]u8,
        /// DEVICE Device Interrupt Flag
        /// offset: 0x1c
        INTFLAG: mmio.Mmio(packed struct(u16) {
            /// Suspend
            SUSPEND: u1 = 0x0,
            /// Micro Start of Frame in High Speed Mode
            MSOF: u1 = 0x0,
            /// Start Of Frame
            SOF: u1 = 0x0,
            /// End of Reset
            EORST: u1 = 0x0,
            /// Wake Up
            WAKEUP: u1 = 0x0,
            /// End Of Resume
            EORSM: u1 = 0x0,
            /// Upstream Resume
            UPRSM: u1 = 0x0,
            /// Ram Access
            RAMACER: u1 = 0x0,
            /// Link Power Management Not Yet
            LPMNYET: u1 = 0x0,
            /// Link Power Management Suspend
            LPMSUSP: u1 = 0x0,
            padding: u6 = 0,
        }),
        /// offset: 0x1e
        reserved30: [2]u8,
        /// DEVICE End Point Interrupt Summary
        /// offset: 0x20
        EPINTSMRY: mmio.Mmio(packed struct(u16) {
            /// End Point 0 Interrupt
            EPINT0: u1 = 0x0,
            /// End Point 1 Interrupt
            EPINT1: u1 = 0x0,
            /// End Point 2 Interrupt
            EPINT2: u1 = 0x0,
            /// End Point 3 Interrupt
            EPINT3: u1 = 0x0,
            /// End Point 4 Interrupt
            EPINT4: u1 = 0x0,
            /// End Point 5 Interrupt
            EPINT5: u1 = 0x0,
            /// End Point 6 Interrupt
            EPINT6: u1 = 0x0,
            /// End Point 7 Interrupt
            EPINT7: u1 = 0x0,
            padding: u8 = 0,
        }),
        /// offset: 0x22
        reserved34: [2]u8,
        /// Descriptor Address
        /// offset: 0x24
        DESCADD: mmio.Mmio(packed struct(u32) {
            /// Descriptor Address Value
            DESCADD: u32 = 0x0,
        }),
        /// USB PAD Calibration
        /// offset: 0x28
        PADCAL: mmio.Mmio(packed struct(u16) {
            /// USB Pad Transp calibration
            TRANSP: u5 = 0x0,
            reserved6: u1 = 0,
            /// USB Pad Transn calibration
            TRANSN: u5 = 0x0,
            reserved12: u1 = 0,
            /// USB Pad Trim calibration
            TRIM: u3 = 0x0,
            padding: u1 = 0,
        }),
        /// offset: 0x2a
        reserved42: [214]u8,
        /// DEVICE End Point Configuration
        /// offset: 0x100
        EPCFG0: mmio.Mmio(packed struct(u8) {
            /// End Point Type0
            EPTYPE0: u3 = 0x0,
            reserved4: u1 = 0,
            /// End Point Type1
            EPTYPE1: u3 = 0x0,
            /// NYET Token Disable
            NYETDIS: u1 = 0x0,
        }),
        /// offset: 0x101
        reserved257: [3]u8,
        /// DEVICE End Point Pipe Status Clear
        /// offset: 0x104
        EPSTATUSCLR0: mmio.Mmio(packed struct(u8) {
            /// Data Toggle OUT Clear
            DTGLOUT: u1 = 0x0,
            /// Data Toggle IN Clear
            DTGLIN: u1 = 0x0,
            /// Current Bank Clear
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request Clear
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request Clear
            STALLRQ1: u1 = 0x0,
            /// Bank 0 Ready Clear
            BK0RDY: u1 = 0x0,
            /// Bank 1 Ready Clear
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Pipe Status Set
        /// offset: 0x105
        EPSTATUSSET0: mmio.Mmio(packed struct(u8) {
            /// Data Toggle OUT Set
            DTGLOUT: u1 = 0x0,
            /// Data Toggle IN Set
            DTGLIN: u1 = 0x0,
            /// Current Bank Set
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request Set
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request Set
            STALLRQ1: u1 = 0x0,
            /// Bank 0 Ready Set
            BK0RDY: u1 = 0x0,
            /// Bank 1 Ready Set
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Pipe Status
        /// offset: 0x106
        EPSTATUS0: mmio.Mmio(packed struct(u8) {
            /// Data Toggle Out
            DTGLOUT: u1 = 0x0,
            /// Data Toggle In
            DTGLIN: u1 = 0x0,
            /// Current Bank
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request
            STALLRQ1: u1 = 0x0,
            /// Bank 0 ready
            BK0RDY: u1 = 0x0,
            /// Bank 1 ready
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Interrupt Flag
        /// offset: 0x107
        EPINTFLAG0: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1
            TRCPT1: u1 = 0x0,
            /// Error Flow 0
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1
            TRFAIL1: u1 = 0x0,
            /// Received Setup
            RXSTP: u1 = 0x0,
            /// Stall 0 In/out
            STALL0: u1 = 0x0,
            /// Stall 1 In/out
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// DEVICE End Point Interrupt Clear Flag
        /// offset: 0x108
        EPINTENCLR0: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0 Interrupt Disable
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1 Interrupt Disable
            TRCPT1: u1 = 0x0,
            /// Error Flow 0 Interrupt Disable
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1 Interrupt Disable
            TRFAIL1: u1 = 0x0,
            /// Received Setup Interrupt Disable
            RXSTP: u1 = 0x0,
            /// Stall 0 In/Out Interrupt Disable
            STALL0: u1 = 0x0,
            /// Stall 1 In/Out Interrupt Disable
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// DEVICE End Point Interrupt Set Flag
        /// offset: 0x109
        EPINTENSET0: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0 Interrupt Enable
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1 Interrupt Enable
            TRCPT1: u1 = 0x0,
            /// Error Flow 0 Interrupt Enable
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1 Interrupt Enable
            TRFAIL1: u1 = 0x0,
            /// Received Setup Interrupt Enable
            RXSTP: u1 = 0x0,
            /// Stall 0 In/out Interrupt enable
            STALL0: u1 = 0x0,
            /// Stall 1 In/out Interrupt enable
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// offset: 0x10a
        reserved266: [22]u8,
        /// DEVICE End Point Configuration
        /// offset: 0x120
        EPCFG1: mmio.Mmio(packed struct(u8) {
            /// End Point Type0
            EPTYPE0: u3 = 0x0,
            reserved4: u1 = 0,
            /// End Point Type1
            EPTYPE1: u3 = 0x0,
            /// NYET Token Disable
            NYETDIS: u1 = 0x0,
        }),
        /// offset: 0x121
        reserved289: [3]u8,
        /// DEVICE End Point Pipe Status Clear
        /// offset: 0x124
        EPSTATUSCLR1: mmio.Mmio(packed struct(u8) {
            /// Data Toggle OUT Clear
            DTGLOUT: u1 = 0x0,
            /// Data Toggle IN Clear
            DTGLIN: u1 = 0x0,
            /// Current Bank Clear
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request Clear
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request Clear
            STALLRQ1: u1 = 0x0,
            /// Bank 0 Ready Clear
            BK0RDY: u1 = 0x0,
            /// Bank 1 Ready Clear
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Pipe Status Set
        /// offset: 0x125
        EPSTATUSSET1: mmio.Mmio(packed struct(u8) {
            /// Data Toggle OUT Set
            DTGLOUT: u1 = 0x0,
            /// Data Toggle IN Set
            DTGLIN: u1 = 0x0,
            /// Current Bank Set
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request Set
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request Set
            STALLRQ1: u1 = 0x0,
            /// Bank 0 Ready Set
            BK0RDY: u1 = 0x0,
            /// Bank 1 Ready Set
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Pipe Status
        /// offset: 0x126
        EPSTATUS1: mmio.Mmio(packed struct(u8) {
            /// Data Toggle Out
            DTGLOUT: u1 = 0x0,
            /// Data Toggle In
            DTGLIN: u1 = 0x0,
            /// Current Bank
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request
            STALLRQ1: u1 = 0x0,
            /// Bank 0 ready
            BK0RDY: u1 = 0x0,
            /// Bank 1 ready
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Interrupt Flag
        /// offset: 0x127
        EPINTFLAG1: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1
            TRCPT1: u1 = 0x0,
            /// Error Flow 0
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1
            TRFAIL1: u1 = 0x0,
            /// Received Setup
            RXSTP: u1 = 0x0,
            /// Stall 0 In/out
            STALL0: u1 = 0x0,
            /// Stall 1 In/out
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// DEVICE End Point Interrupt Clear Flag
        /// offset: 0x128
        EPINTENCLR1: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0 Interrupt Disable
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1 Interrupt Disable
            TRCPT1: u1 = 0x0,
            /// Error Flow 0 Interrupt Disable
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1 Interrupt Disable
            TRFAIL1: u1 = 0x0,
            /// Received Setup Interrupt Disable
            RXSTP: u1 = 0x0,
            /// Stall 0 In/Out Interrupt Disable
            STALL0: u1 = 0x0,
            /// Stall 1 In/Out Interrupt Disable
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// DEVICE End Point Interrupt Set Flag
        /// offset: 0x129
        EPINTENSET1: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0 Interrupt Enable
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1 Interrupt Enable
            TRCPT1: u1 = 0x0,
            /// Error Flow 0 Interrupt Enable
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1 Interrupt Enable
            TRFAIL1: u1 = 0x0,
            /// Received Setup Interrupt Enable
            RXSTP: u1 = 0x0,
            /// Stall 0 In/out Interrupt enable
            STALL0: u1 = 0x0,
            /// Stall 1 In/out Interrupt enable
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// offset: 0x12a
        reserved298: [22]u8,
        /// DEVICE End Point Configuration
        /// offset: 0x140
        EPCFG2: mmio.Mmio(packed struct(u8) {
            /// End Point Type0
            EPTYPE0: u3 = 0x0,
            reserved4: u1 = 0,
            /// End Point Type1
            EPTYPE1: u3 = 0x0,
            /// NYET Token Disable
            NYETDIS: u1 = 0x0,
        }),
        /// offset: 0x141
        reserved321: [3]u8,
        /// DEVICE End Point Pipe Status Clear
        /// offset: 0x144
        EPSTATUSCLR2: mmio.Mmio(packed struct(u8) {
            /// Data Toggle OUT Clear
            DTGLOUT: u1 = 0x0,
            /// Data Toggle IN Clear
            DTGLIN: u1 = 0x0,
            /// Current Bank Clear
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request Clear
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request Clear
            STALLRQ1: u1 = 0x0,
            /// Bank 0 Ready Clear
            BK0RDY: u1 = 0x0,
            /// Bank 1 Ready Clear
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Pipe Status Set
        /// offset: 0x145
        EPSTATUSSET2: mmio.Mmio(packed struct(u8) {
            /// Data Toggle OUT Set
            DTGLOUT: u1 = 0x0,
            /// Data Toggle IN Set
            DTGLIN: u1 = 0x0,
            /// Current Bank Set
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request Set
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request Set
            STALLRQ1: u1 = 0x0,
            /// Bank 0 Ready Set
            BK0RDY: u1 = 0x0,
            /// Bank 1 Ready Set
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Pipe Status
        /// offset: 0x146
        EPSTATUS2: mmio.Mmio(packed struct(u8) {
            /// Data Toggle Out
            DTGLOUT: u1 = 0x0,
            /// Data Toggle In
            DTGLIN: u1 = 0x0,
            /// Current Bank
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request
            STALLRQ1: u1 = 0x0,
            /// Bank 0 ready
            BK0RDY: u1 = 0x0,
            /// Bank 1 ready
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Interrupt Flag
        /// offset: 0x147
        EPINTFLAG2: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1
            TRCPT1: u1 = 0x0,
            /// Error Flow 0
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1
            TRFAIL1: u1 = 0x0,
            /// Received Setup
            RXSTP: u1 = 0x0,
            /// Stall 0 In/out
            STALL0: u1 = 0x0,
            /// Stall 1 In/out
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// DEVICE End Point Interrupt Clear Flag
        /// offset: 0x148
        EPINTENCLR2: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0 Interrupt Disable
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1 Interrupt Disable
            TRCPT1: u1 = 0x0,
            /// Error Flow 0 Interrupt Disable
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1 Interrupt Disable
            TRFAIL1: u1 = 0x0,
            /// Received Setup Interrupt Disable
            RXSTP: u1 = 0x0,
            /// Stall 0 In/Out Interrupt Disable
            STALL0: u1 = 0x0,
            /// Stall 1 In/Out Interrupt Disable
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// DEVICE End Point Interrupt Set Flag
        /// offset: 0x149
        EPINTENSET2: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0 Interrupt Enable
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1 Interrupt Enable
            TRCPT1: u1 = 0x0,
            /// Error Flow 0 Interrupt Enable
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1 Interrupt Enable
            TRFAIL1: u1 = 0x0,
            /// Received Setup Interrupt Enable
            RXSTP: u1 = 0x0,
            /// Stall 0 In/out Interrupt enable
            STALL0: u1 = 0x0,
            /// Stall 1 In/out Interrupt enable
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// offset: 0x14a
        reserved330: [22]u8,
        /// DEVICE End Point Configuration
        /// offset: 0x160
        EPCFG3: mmio.Mmio(packed struct(u8) {
            /// End Point Type0
            EPTYPE0: u3 = 0x0,
            reserved4: u1 = 0,
            /// End Point Type1
            EPTYPE1: u3 = 0x0,
            /// NYET Token Disable
            NYETDIS: u1 = 0x0,
        }),
        /// offset: 0x161
        reserved353: [3]u8,
        /// DEVICE End Point Pipe Status Clear
        /// offset: 0x164
        EPSTATUSCLR3: mmio.Mmio(packed struct(u8) {
            /// Data Toggle OUT Clear
            DTGLOUT: u1 = 0x0,
            /// Data Toggle IN Clear
            DTGLIN: u1 = 0x0,
            /// Current Bank Clear
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request Clear
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request Clear
            STALLRQ1: u1 = 0x0,
            /// Bank 0 Ready Clear
            BK0RDY: u1 = 0x0,
            /// Bank 1 Ready Clear
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Pipe Status Set
        /// offset: 0x165
        EPSTATUSSET3: mmio.Mmio(packed struct(u8) {
            /// Data Toggle OUT Set
            DTGLOUT: u1 = 0x0,
            /// Data Toggle IN Set
            DTGLIN: u1 = 0x0,
            /// Current Bank Set
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request Set
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request Set
            STALLRQ1: u1 = 0x0,
            /// Bank 0 Ready Set
            BK0RDY: u1 = 0x0,
            /// Bank 1 Ready Set
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Pipe Status
        /// offset: 0x166
        EPSTATUS3: mmio.Mmio(packed struct(u8) {
            /// Data Toggle Out
            DTGLOUT: u1 = 0x0,
            /// Data Toggle In
            DTGLIN: u1 = 0x0,
            /// Current Bank
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request
            STALLRQ1: u1 = 0x0,
            /// Bank 0 ready
            BK0RDY: u1 = 0x0,
            /// Bank 1 ready
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Interrupt Flag
        /// offset: 0x167
        EPINTFLAG3: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1
            TRCPT1: u1 = 0x0,
            /// Error Flow 0
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1
            TRFAIL1: u1 = 0x0,
            /// Received Setup
            RXSTP: u1 = 0x0,
            /// Stall 0 In/out
            STALL0: u1 = 0x0,
            /// Stall 1 In/out
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// DEVICE End Point Interrupt Clear Flag
        /// offset: 0x168
        EPINTENCLR3: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0 Interrupt Disable
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1 Interrupt Disable
            TRCPT1: u1 = 0x0,
            /// Error Flow 0 Interrupt Disable
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1 Interrupt Disable
            TRFAIL1: u1 = 0x0,
            /// Received Setup Interrupt Disable
            RXSTP: u1 = 0x0,
            /// Stall 0 In/Out Interrupt Disable
            STALL0: u1 = 0x0,
            /// Stall 1 In/Out Interrupt Disable
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// DEVICE End Point Interrupt Set Flag
        /// offset: 0x169
        EPINTENSET3: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0 Interrupt Enable
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1 Interrupt Enable
            TRCPT1: u1 = 0x0,
            /// Error Flow 0 Interrupt Enable
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1 Interrupt Enable
            TRFAIL1: u1 = 0x0,
            /// Received Setup Interrupt Enable
            RXSTP: u1 = 0x0,
            /// Stall 0 In/out Interrupt enable
            STALL0: u1 = 0x0,
            /// Stall 1 In/out Interrupt enable
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// offset: 0x16a
        reserved362: [22]u8,
        /// DEVICE End Point Configuration
        /// offset: 0x180
        EPCFG4: mmio.Mmio(packed struct(u8) {
            /// End Point Type0
            EPTYPE0: u3 = 0x0,
            reserved4: u1 = 0,
            /// End Point Type1
            EPTYPE1: u3 = 0x0,
            /// NYET Token Disable
            NYETDIS: u1 = 0x0,
        }),
        /// offset: 0x181
        reserved385: [3]u8,
        /// DEVICE End Point Pipe Status Clear
        /// offset: 0x184
        EPSTATUSCLR4: mmio.Mmio(packed struct(u8) {
            /// Data Toggle OUT Clear
            DTGLOUT: u1 = 0x0,
            /// Data Toggle IN Clear
            DTGLIN: u1 = 0x0,
            /// Current Bank Clear
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request Clear
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request Clear
            STALLRQ1: u1 = 0x0,
            /// Bank 0 Ready Clear
            BK0RDY: u1 = 0x0,
            /// Bank 1 Ready Clear
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Pipe Status Set
        /// offset: 0x185
        EPSTATUSSET4: mmio.Mmio(packed struct(u8) {
            /// Data Toggle OUT Set
            DTGLOUT: u1 = 0x0,
            /// Data Toggle IN Set
            DTGLIN: u1 = 0x0,
            /// Current Bank Set
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request Set
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request Set
            STALLRQ1: u1 = 0x0,
            /// Bank 0 Ready Set
            BK0RDY: u1 = 0x0,
            /// Bank 1 Ready Set
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Pipe Status
        /// offset: 0x186
        EPSTATUS4: mmio.Mmio(packed struct(u8) {
            /// Data Toggle Out
            DTGLOUT: u1 = 0x0,
            /// Data Toggle In
            DTGLIN: u1 = 0x0,
            /// Current Bank
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request
            STALLRQ1: u1 = 0x0,
            /// Bank 0 ready
            BK0RDY: u1 = 0x0,
            /// Bank 1 ready
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Interrupt Flag
        /// offset: 0x187
        EPINTFLAG4: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1
            TRCPT1: u1 = 0x0,
            /// Error Flow 0
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1
            TRFAIL1: u1 = 0x0,
            /// Received Setup
            RXSTP: u1 = 0x0,
            /// Stall 0 In/out
            STALL0: u1 = 0x0,
            /// Stall 1 In/out
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// DEVICE End Point Interrupt Clear Flag
        /// offset: 0x188
        EPINTENCLR4: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0 Interrupt Disable
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1 Interrupt Disable
            TRCPT1: u1 = 0x0,
            /// Error Flow 0 Interrupt Disable
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1 Interrupt Disable
            TRFAIL1: u1 = 0x0,
            /// Received Setup Interrupt Disable
            RXSTP: u1 = 0x0,
            /// Stall 0 In/Out Interrupt Disable
            STALL0: u1 = 0x0,
            /// Stall 1 In/Out Interrupt Disable
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// DEVICE End Point Interrupt Set Flag
        /// offset: 0x189
        EPINTENSET4: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0 Interrupt Enable
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1 Interrupt Enable
            TRCPT1: u1 = 0x0,
            /// Error Flow 0 Interrupt Enable
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1 Interrupt Enable
            TRFAIL1: u1 = 0x0,
            /// Received Setup Interrupt Enable
            RXSTP: u1 = 0x0,
            /// Stall 0 In/out Interrupt enable
            STALL0: u1 = 0x0,
            /// Stall 1 In/out Interrupt enable
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// offset: 0x18a
        reserved394: [22]u8,
        /// DEVICE End Point Configuration
        /// offset: 0x1a0
        EPCFG5: mmio.Mmio(packed struct(u8) {
            /// End Point Type0
            EPTYPE0: u3 = 0x0,
            reserved4: u1 = 0,
            /// End Point Type1
            EPTYPE1: u3 = 0x0,
            /// NYET Token Disable
            NYETDIS: u1 = 0x0,
        }),
        /// offset: 0x1a1
        reserved417: [3]u8,
        /// DEVICE End Point Pipe Status Clear
        /// offset: 0x1a4
        EPSTATUSCLR5: mmio.Mmio(packed struct(u8) {
            /// Data Toggle OUT Clear
            DTGLOUT: u1 = 0x0,
            /// Data Toggle IN Clear
            DTGLIN: u1 = 0x0,
            /// Current Bank Clear
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request Clear
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request Clear
            STALLRQ1: u1 = 0x0,
            /// Bank 0 Ready Clear
            BK0RDY: u1 = 0x0,
            /// Bank 1 Ready Clear
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Pipe Status Set
        /// offset: 0x1a5
        EPSTATUSSET5: mmio.Mmio(packed struct(u8) {
            /// Data Toggle OUT Set
            DTGLOUT: u1 = 0x0,
            /// Data Toggle IN Set
            DTGLIN: u1 = 0x0,
            /// Current Bank Set
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request Set
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request Set
            STALLRQ1: u1 = 0x0,
            /// Bank 0 Ready Set
            BK0RDY: u1 = 0x0,
            /// Bank 1 Ready Set
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Pipe Status
        /// offset: 0x1a6
        EPSTATUS5: mmio.Mmio(packed struct(u8) {
            /// Data Toggle Out
            DTGLOUT: u1 = 0x0,
            /// Data Toggle In
            DTGLIN: u1 = 0x0,
            /// Current Bank
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request
            STALLRQ1: u1 = 0x0,
            /// Bank 0 ready
            BK0RDY: u1 = 0x0,
            /// Bank 1 ready
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Interrupt Flag
        /// offset: 0x1a7
        EPINTFLAG5: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1
            TRCPT1: u1 = 0x0,
            /// Error Flow 0
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1
            TRFAIL1: u1 = 0x0,
            /// Received Setup
            RXSTP: u1 = 0x0,
            /// Stall 0 In/out
            STALL0: u1 = 0x0,
            /// Stall 1 In/out
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// DEVICE End Point Interrupt Clear Flag
        /// offset: 0x1a8
        EPINTENCLR5: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0 Interrupt Disable
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1 Interrupt Disable
            TRCPT1: u1 = 0x0,
            /// Error Flow 0 Interrupt Disable
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1 Interrupt Disable
            TRFAIL1: u1 = 0x0,
            /// Received Setup Interrupt Disable
            RXSTP: u1 = 0x0,
            /// Stall 0 In/Out Interrupt Disable
            STALL0: u1 = 0x0,
            /// Stall 1 In/Out Interrupt Disable
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// DEVICE End Point Interrupt Set Flag
        /// offset: 0x1a9
        EPINTENSET5: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0 Interrupt Enable
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1 Interrupt Enable
            TRCPT1: u1 = 0x0,
            /// Error Flow 0 Interrupt Enable
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1 Interrupt Enable
            TRFAIL1: u1 = 0x0,
            /// Received Setup Interrupt Enable
            RXSTP: u1 = 0x0,
            /// Stall 0 In/out Interrupt enable
            STALL0: u1 = 0x0,
            /// Stall 1 In/out Interrupt enable
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// offset: 0x1aa
        reserved426: [22]u8,
        /// DEVICE End Point Configuration
        /// offset: 0x1c0
        EPCFG6: mmio.Mmio(packed struct(u8) {
            /// End Point Type0
            EPTYPE0: u3 = 0x0,
            reserved4: u1 = 0,
            /// End Point Type1
            EPTYPE1: u3 = 0x0,
            /// NYET Token Disable
            NYETDIS: u1 = 0x0,
        }),
        /// offset: 0x1c1
        reserved449: [3]u8,
        /// DEVICE End Point Pipe Status Clear
        /// offset: 0x1c4
        EPSTATUSCLR6: mmio.Mmio(packed struct(u8) {
            /// Data Toggle OUT Clear
            DTGLOUT: u1 = 0x0,
            /// Data Toggle IN Clear
            DTGLIN: u1 = 0x0,
            /// Current Bank Clear
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request Clear
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request Clear
            STALLRQ1: u1 = 0x0,
            /// Bank 0 Ready Clear
            BK0RDY: u1 = 0x0,
            /// Bank 1 Ready Clear
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Pipe Status Set
        /// offset: 0x1c5
        EPSTATUSSET6: mmio.Mmio(packed struct(u8) {
            /// Data Toggle OUT Set
            DTGLOUT: u1 = 0x0,
            /// Data Toggle IN Set
            DTGLIN: u1 = 0x0,
            /// Current Bank Set
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request Set
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request Set
            STALLRQ1: u1 = 0x0,
            /// Bank 0 Ready Set
            BK0RDY: u1 = 0x0,
            /// Bank 1 Ready Set
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Pipe Status
        /// offset: 0x1c6
        EPSTATUS6: mmio.Mmio(packed struct(u8) {
            /// Data Toggle Out
            DTGLOUT: u1 = 0x0,
            /// Data Toggle In
            DTGLIN: u1 = 0x0,
            /// Current Bank
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request
            STALLRQ1: u1 = 0x0,
            /// Bank 0 ready
            BK0RDY: u1 = 0x0,
            /// Bank 1 ready
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Interrupt Flag
        /// offset: 0x1c7
        EPINTFLAG6: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1
            TRCPT1: u1 = 0x0,
            /// Error Flow 0
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1
            TRFAIL1: u1 = 0x0,
            /// Received Setup
            RXSTP: u1 = 0x0,
            /// Stall 0 In/out
            STALL0: u1 = 0x0,
            /// Stall 1 In/out
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// DEVICE End Point Interrupt Clear Flag
        /// offset: 0x1c8
        EPINTENCLR6: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0 Interrupt Disable
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1 Interrupt Disable
            TRCPT1: u1 = 0x0,
            /// Error Flow 0 Interrupt Disable
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1 Interrupt Disable
            TRFAIL1: u1 = 0x0,
            /// Received Setup Interrupt Disable
            RXSTP: u1 = 0x0,
            /// Stall 0 In/Out Interrupt Disable
            STALL0: u1 = 0x0,
            /// Stall 1 In/Out Interrupt Disable
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// DEVICE End Point Interrupt Set Flag
        /// offset: 0x1c9
        EPINTENSET6: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0 Interrupt Enable
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1 Interrupt Enable
            TRCPT1: u1 = 0x0,
            /// Error Flow 0 Interrupt Enable
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1 Interrupt Enable
            TRFAIL1: u1 = 0x0,
            /// Received Setup Interrupt Enable
            RXSTP: u1 = 0x0,
            /// Stall 0 In/out Interrupt enable
            STALL0: u1 = 0x0,
            /// Stall 1 In/out Interrupt enable
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// offset: 0x1ca
        reserved458: [22]u8,
        /// DEVICE End Point Configuration
        /// offset: 0x1e0
        EPCFG7: mmio.Mmio(packed struct(u8) {
            /// End Point Type0
            EPTYPE0: u3 = 0x0,
            reserved4: u1 = 0,
            /// End Point Type1
            EPTYPE1: u3 = 0x0,
            /// NYET Token Disable
            NYETDIS: u1 = 0x0,
        }),
        /// offset: 0x1e1
        reserved481: [3]u8,
        /// DEVICE End Point Pipe Status Clear
        /// offset: 0x1e4
        EPSTATUSCLR7: mmio.Mmio(packed struct(u8) {
            /// Data Toggle OUT Clear
            DTGLOUT: u1 = 0x0,
            /// Data Toggle IN Clear
            DTGLIN: u1 = 0x0,
            /// Current Bank Clear
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request Clear
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request Clear
            STALLRQ1: u1 = 0x0,
            /// Bank 0 Ready Clear
            BK0RDY: u1 = 0x0,
            /// Bank 1 Ready Clear
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Pipe Status Set
        /// offset: 0x1e5
        EPSTATUSSET7: mmio.Mmio(packed struct(u8) {
            /// Data Toggle OUT Set
            DTGLOUT: u1 = 0x0,
            /// Data Toggle IN Set
            DTGLIN: u1 = 0x0,
            /// Current Bank Set
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request Set
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request Set
            STALLRQ1: u1 = 0x0,
            /// Bank 0 Ready Set
            BK0RDY: u1 = 0x0,
            /// Bank 1 Ready Set
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Pipe Status
        /// offset: 0x1e6
        EPSTATUS7: mmio.Mmio(packed struct(u8) {
            /// Data Toggle Out
            DTGLOUT: u1 = 0x0,
            /// Data Toggle In
            DTGLIN: u1 = 0x0,
            /// Current Bank
            CURBK: u1 = 0x0,
            reserved4: u1 = 0,
            /// Stall 0 Request
            STALLRQ0: u1 = 0x0,
            /// Stall 1 Request
            STALLRQ1: u1 = 0x0,
            /// Bank 0 ready
            BK0RDY: u1 = 0x0,
            /// Bank 1 ready
            BK1RDY: u1 = 0x0,
        }),
        /// DEVICE End Point Interrupt Flag
        /// offset: 0x1e7
        EPINTFLAG7: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1
            TRCPT1: u1 = 0x0,
            /// Error Flow 0
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1
            TRFAIL1: u1 = 0x0,
            /// Received Setup
            RXSTP: u1 = 0x0,
            /// Stall 0 In/out
            STALL0: u1 = 0x0,
            /// Stall 1 In/out
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// DEVICE End Point Interrupt Clear Flag
        /// offset: 0x1e8
        EPINTENCLR7: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0 Interrupt Disable
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1 Interrupt Disable
            TRCPT1: u1 = 0x0,
            /// Error Flow 0 Interrupt Disable
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1 Interrupt Disable
            TRFAIL1: u1 = 0x0,
            /// Received Setup Interrupt Disable
            RXSTP: u1 = 0x0,
            /// Stall 0 In/Out Interrupt Disable
            STALL0: u1 = 0x0,
            /// Stall 1 In/Out Interrupt Disable
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
        /// DEVICE End Point Interrupt Set Flag
        /// offset: 0x1e9
        EPINTENSET7: mmio.Mmio(packed struct(u8) {
            /// Transfer Complete 0 Interrupt Enable
            TRCPT0: u1 = 0x0,
            /// Transfer Complete 1 Interrupt Enable
            TRCPT1: u1 = 0x0,
            /// Error Flow 0 Interrupt Enable
            TRFAIL0: u1 = 0x0,
            /// Error Flow 1 Interrupt Enable
            TRFAIL1: u1 = 0x0,
            /// Received Setup Interrupt Enable
            RXSTP: u1 = 0x0,
            /// Stall 0 In/out Interrupt enable
            STALL0: u1 = 0x0,
            /// Stall 1 In/out Interrupt enable
            STALL1: u1 = 0x0,
            padding: u1 = 0,
        }),
    },
};
