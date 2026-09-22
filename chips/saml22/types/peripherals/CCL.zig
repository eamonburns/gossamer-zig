const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Configurable Custom Logic
pub const CCL = extern struct {
    /// Control
    /// offset: 0x00
    CTRL: mmio.Mmio(packed struct(u8) {
        /// Software Reset
        SWRST: u1 = 0x0,
        /// Enable
        ENABLE: u1 = 0x0,
        reserved6: u4 = 0,
        /// Run during Standby
        RUNSTDBY: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x01
    reserved1: [3]u8,
    /// SEQ Control x
    /// offset: 0x04
    SEQCTRL0: mmio.Mmio(packed struct(u8) {
        /// Sequential Selection
        SEQSEL: enum(u4) {
            /// Sequential logic is disabled
            DISABLE = 0x0,
            /// D flip flop
            DFF = 0x1,
            /// JK flip flop
            JK = 0x2,
            /// D latch
            LATCH = 0x3,
            /// RS latch
            RS = 0x4,
            _,
        } = .DISABLE,
        padding: u4 = 0,
    }),
    /// SEQ Control x
    /// offset: 0x05
    SEQCTRL1: mmio.Mmio(packed struct(u8) {
        /// Sequential Selection
        SEQSEL: enum(u4) {
            /// Sequential logic is disabled
            DISABLE = 0x0,
            /// D flip flop
            DFF = 0x1,
            /// JK flip flop
            JK = 0x2,
            /// D latch
            LATCH = 0x3,
            /// RS latch
            RS = 0x4,
            _,
        } = .DISABLE,
        padding: u4 = 0,
    }),
    /// offset: 0x06
    reserved6: [2]u8,
    /// LUT Control x
    /// offset: 0x08
    LUTCTRL0: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// LUT Enable
        ENABLE: u1 = 0x0,
        reserved4: u2 = 0,
        /// Filter Selection
        FILTSEL: enum(u2) {
            /// Filter disabled
            DISABLE = 0x0,
            /// Synchronizer enabled
            SYNCH = 0x1,
            /// Filter enabled
            FILTER = 0x2,
            _,
        } = .DISABLE,
        reserved7: u1 = 0,
        /// Edge Selection
        EDGESEL: u1 = 0x0,
        /// Input Selection 0
        INSEL0: enum(u4) {
            /// Masked input
            MASK = 0x0,
            /// Feedback input source
            FEEDBACK = 0x1,
            /// Linked LUT input source
            LINK = 0x2,
            /// Event in put source
            EVENT = 0x3,
            /// I/O pin input source
            IO = 0x4,
            /// AC input source
            AC = 0x5,
            /// TC input source
            TC = 0x6,
            /// Alternate TC input source
            ALTTC = 0x7,
            /// TCC input source
            TCC = 0x8,
            /// SERCOM inout source
            SERCOM = 0x9,
            _,
        } = .MASK,
        /// Input Selection 1
        INSEL1: u4 = 0x0,
        /// Input Selection 2
        INSEL2: u4 = 0x0,
        /// Input Event Invert
        INVEI: u1 = 0x0,
        /// Event Input Enable
        LUTEI: u1 = 0x0,
        /// Event Output Enable
        LUTEO: u1 = 0x0,
        reserved24: u1 = 0,
        /// Truth Value
        TRUTH: u8 = 0x0,
    }),
    /// LUT Control x
    /// offset: 0x0c
    LUTCTRL1: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// LUT Enable
        ENABLE: u1 = 0x0,
        reserved4: u2 = 0,
        /// Filter Selection
        FILTSEL: enum(u2) {
            /// Filter disabled
            DISABLE = 0x0,
            /// Synchronizer enabled
            SYNCH = 0x1,
            /// Filter enabled
            FILTER = 0x2,
            _,
        } = .DISABLE,
        reserved7: u1 = 0,
        /// Edge Selection
        EDGESEL: u1 = 0x0,
        /// Input Selection 0
        INSEL0: enum(u4) {
            /// Masked input
            MASK = 0x0,
            /// Feedback input source
            FEEDBACK = 0x1,
            /// Linked LUT input source
            LINK = 0x2,
            /// Event in put source
            EVENT = 0x3,
            /// I/O pin input source
            IO = 0x4,
            /// AC input source
            AC = 0x5,
            /// TC input source
            TC = 0x6,
            /// Alternate TC input source
            ALTTC = 0x7,
            /// TCC input source
            TCC = 0x8,
            /// SERCOM inout source
            SERCOM = 0x9,
            _,
        } = .MASK,
        /// Input Selection 1
        INSEL1: u4 = 0x0,
        /// Input Selection 2
        INSEL2: u4 = 0x0,
        /// Input Event Invert
        INVEI: u1 = 0x0,
        /// Event Input Enable
        LUTEI: u1 = 0x0,
        /// Event Output Enable
        LUTEO: u1 = 0x0,
        reserved24: u1 = 0,
        /// Truth Value
        TRUTH: u8 = 0x0,
    }),
    /// LUT Control x
    /// offset: 0x10
    LUTCTRL2: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// LUT Enable
        ENABLE: u1 = 0x0,
        reserved4: u2 = 0,
        /// Filter Selection
        FILTSEL: enum(u2) {
            /// Filter disabled
            DISABLE = 0x0,
            /// Synchronizer enabled
            SYNCH = 0x1,
            /// Filter enabled
            FILTER = 0x2,
            _,
        } = .DISABLE,
        reserved7: u1 = 0,
        /// Edge Selection
        EDGESEL: u1 = 0x0,
        /// Input Selection 0
        INSEL0: enum(u4) {
            /// Masked input
            MASK = 0x0,
            /// Feedback input source
            FEEDBACK = 0x1,
            /// Linked LUT input source
            LINK = 0x2,
            /// Event in put source
            EVENT = 0x3,
            /// I/O pin input source
            IO = 0x4,
            /// AC input source
            AC = 0x5,
            /// TC input source
            TC = 0x6,
            /// Alternate TC input source
            ALTTC = 0x7,
            /// TCC input source
            TCC = 0x8,
            /// SERCOM inout source
            SERCOM = 0x9,
            _,
        } = .MASK,
        /// Input Selection 1
        INSEL1: u4 = 0x0,
        /// Input Selection 2
        INSEL2: u4 = 0x0,
        /// Input Event Invert
        INVEI: u1 = 0x0,
        /// Event Input Enable
        LUTEI: u1 = 0x0,
        /// Event Output Enable
        LUTEO: u1 = 0x0,
        reserved24: u1 = 0,
        /// Truth Value
        TRUTH: u8 = 0x0,
    }),
    /// LUT Control x
    /// offset: 0x14
    LUTCTRL3: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// LUT Enable
        ENABLE: u1 = 0x0,
        reserved4: u2 = 0,
        /// Filter Selection
        FILTSEL: enum(u2) {
            /// Filter disabled
            DISABLE = 0x0,
            /// Synchronizer enabled
            SYNCH = 0x1,
            /// Filter enabled
            FILTER = 0x2,
            _,
        } = .DISABLE,
        reserved7: u1 = 0,
        /// Edge Selection
        EDGESEL: u1 = 0x0,
        /// Input Selection 0
        INSEL0: enum(u4) {
            /// Masked input
            MASK = 0x0,
            /// Feedback input source
            FEEDBACK = 0x1,
            /// Linked LUT input source
            LINK = 0x2,
            /// Event in put source
            EVENT = 0x3,
            /// I/O pin input source
            IO = 0x4,
            /// AC input source
            AC = 0x5,
            /// TC input source
            TC = 0x6,
            /// Alternate TC input source
            ALTTC = 0x7,
            /// TCC input source
            TCC = 0x8,
            /// SERCOM inout source
            SERCOM = 0x9,
            _,
        } = .MASK,
        /// Input Selection 1
        INSEL1: u4 = 0x0,
        /// Input Selection 2
        INSEL2: u4 = 0x0,
        /// Input Event Invert
        INVEI: u1 = 0x0,
        /// Event Input Enable
        LUTEI: u1 = 0x0,
        /// Event Output Enable
        LUTEO: u1 = 0x0,
        reserved24: u1 = 0,
        /// Truth Value
        TRUTH: u8 = 0x0,
    }),
};
