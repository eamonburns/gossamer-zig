const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Advanced Encryption Standard
pub const AES = extern struct {
    /// Control A
    /// offset: 0x00
    CTRLA: mmio.Mmio(packed struct(u32) {
        /// Software Reset
        SWRST: u1 = 0x0,
        /// Enable
        ENABLE: u1 = 0x0,
        /// AES Modes of operation
        AESMODE: u3 = 0x0,
        /// CFB Types
        CFBS: u3 = 0x0,
        /// Keysize
        KEYSIZE: u2 = 0x0,
        /// Cipher mode
        CIPHER: u1 = 0x0,
        /// Start mode
        STARTMODE: u1 = 0x0,
        /// LOD Enable
        LOD: u1 = 0x0,
        /// Last key generation
        KEYGEN: u1 = 0x0,
        /// Xor Key operation
        XORKEY: u1 = 0x0,
        reserved16: u1 = 0,
        /// Counter measure types
        CTYPE: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// Control B
    /// offset: 0x04
    CTRLB: mmio.Mmio(packed struct(u8) {
        /// Manual Start
        START: u1 = 0x0,
        /// New message
        NEWMSG: u1 = 0x0,
        /// End of message
        EOM: u1 = 0x0,
        /// GF Multiplication
        GFMUL: u1 = 0x0,
        padding: u4 = 0,
    }),
    /// Interrupt Enable Clear
    /// offset: 0x05
    INTENCLR: mmio.Mmio(packed struct(u8) {
        /// Encryption Complete
        ENCCMP: u1 = 0x0,
        /// GF Multiplication Complete
        GFMCMP: u1 = 0x0,
        padding: u6 = 0,
    }),
    /// Interrupt Enable Set
    /// offset: 0x06
    INTENSET: mmio.Mmio(packed struct(u8) {
        /// Encryption Complete
        ENCCMP: u1 = 0x0,
        /// GF Multiplication Complete
        GFMCMP: u1 = 0x0,
        padding: u6 = 0,
    }),
    /// Interrupt Flag Status
    /// offset: 0x07
    INTFLAG: mmio.Mmio(packed struct(u8) {
        /// Encryption Complete
        ENCCMP: u1 = 0x0,
        /// GF Multiplication Complete
        GFMCMP: u1 = 0x0,
        padding: u6 = 0,
    }),
    /// Data buffer pointer
    /// offset: 0x08
    DATABUFPTR: mmio.Mmio(packed struct(u8) {
        /// Input Data Pointer
        INDATAPTR: u2 = 0x0,
        padding: u6 = 0,
    }),
    /// Debug control
    /// offset: 0x09
    DBGCTRL: mmio.Mmio(packed struct(u8) {
        /// Debug Run
        DBGRUN: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// offset: 0x0a
    reserved10: [2]u8,
    /// Keyword n
    /// offset: 0x0c
    KEYWORD0: u32 = 0x0,
    /// Keyword n
    /// offset: 0x10
    KEYWORD1: u32 = 0x0,
    /// Keyword n
    /// offset: 0x14
    KEYWORD2: u32 = 0x0,
    /// Keyword n
    /// offset: 0x18
    KEYWORD3: u32 = 0x0,
    /// Keyword n
    /// offset: 0x1c
    KEYWORD4: u32 = 0x0,
    /// Keyword n
    /// offset: 0x20
    KEYWORD5: u32 = 0x0,
    /// Keyword n
    /// offset: 0x24
    KEYWORD6: u32 = 0x0,
    /// Keyword n
    /// offset: 0x28
    KEYWORD7: u32 = 0x0,
    /// offset: 0x2c
    reserved44: [12]u8,
    /// Indata
    /// offset: 0x38
    INDATA: u32 = 0x0,
    /// Initialisation Vector n
    /// offset: 0x3c
    INTVECTV0: u32 = 0x0,
    /// Initialisation Vector n
    /// offset: 0x40
    INTVECTV1: u32 = 0x0,
    /// Initialisation Vector n
    /// offset: 0x44
    INTVECTV2: u32 = 0x0,
    /// Initialisation Vector n
    /// offset: 0x48
    INTVECTV3: u32 = 0x0,
    /// offset: 0x4c
    reserved76: [16]u8,
    /// Hash key n
    /// offset: 0x5c
    HASHKEY0: u32 = 0x0,
    /// Hash key n
    /// offset: 0x60
    HASHKEY1: u32 = 0x0,
    /// Hash key n
    /// offset: 0x64
    HASHKEY2: u32 = 0x0,
    /// Hash key n
    /// offset: 0x68
    HASHKEY3: u32 = 0x0,
    /// Galois Hash n
    /// offset: 0x6c
    GHASH0: u32 = 0x0,
    /// Galois Hash n
    /// offset: 0x70
    GHASH1: u32 = 0x0,
    /// Galois Hash n
    /// offset: 0x74
    GHASH2: u32 = 0x0,
    /// Galois Hash n
    /// offset: 0x78
    GHASH3: u32 = 0x0,
    /// offset: 0x7c
    reserved124: [4]u8,
    /// Cipher Length
    /// offset: 0x80
    CIPLEN: u32 = 0x0,
    /// Random Seed
    /// offset: 0x84
    RANDSEED: u32 = 0x0,
};
