const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Main Clock
pub const MCLK = extern struct {
    /// offset: 0x00
    reserved0: [1]u8,
    /// Interrupt Enable Clear
    /// offset: 0x01
    INTENCLR: mmio.Mmio(packed struct(u8) {
        /// Clock Ready Interrupt Enable
        CKRDY: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// Interrupt Enable Set
    /// offset: 0x02
    INTENSET: mmio.Mmio(packed struct(u8) {
        /// Clock Ready Interrupt Enable
        CKRDY: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// Interrupt Flag Status and Clear
    /// offset: 0x03
    INTFLAG: mmio.Mmio(packed struct(u8) {
        /// Clock Ready
        CKRDY: u1 = 0x1,
        padding: u7 = 0,
    }),
    /// CPU Clock Division
    /// offset: 0x04
    CPUDIV: mmio.Mmio(packed struct(u8) {
        /// CPU Clock Division Factor
        CPUDIV: enum(u8) {
            /// Divide by 1
            DIV1 = 0x1,
            /// Divide by 2
            DIV2 = 0x2,
            /// Divide by 4
            DIV4 = 0x4,
            /// Divide by 8
            DIV8 = 0x8,
            /// Divide by 16
            DIV16 = 0x10,
            /// Divide by 32
            DIV32 = 0x20,
            /// Divide by 64
            DIV64 = 0x40,
            /// Divide by 128
            DIV128 = 0x80,
            _,
        } = .DIV1,
    }),
    /// offset: 0x05
    reserved5: [1]u8,
    /// Backup Clock Division
    /// offset: 0x06
    BUPDIV: mmio.Mmio(packed struct(u8) {
        /// Backup Clock Division Factor
        BUPDIV: enum(u8) {
            /// Divide by 1
            DIV1 = 0x1,
            /// Divide by 2
            DIV2 = 0x2,
            /// Divide by 4
            DIV4 = 0x4,
            /// Divide by 8
            DIV8 = 0x8,
            /// Divide by 16
            DIV16 = 0x10,
            /// Divide by 32
            DIV32 = 0x20,
            /// Divide by 64
            DIV64 = 0x40,
            /// Divide by 128
            DIV128 = 0x80,
            _,
        } = .DIV1,
    }),
    /// offset: 0x07
    reserved7: [9]u8,
    /// AHB Mask
    /// offset: 0x10
    AHBMASK: mmio.Mmio(packed struct(u32) {
        /// HPB0 AHB Clock Mask
        HPB0_: u1 = 0x1,
        /// HPB1 AHB Clock Mask
        HPB1_: u1 = 0x1,
        /// HPB2 AHB Clock Mask
        HPB2_: u1 = 0x1,
        /// DMAC AHB Clock Mask
        DMAC_: u1 = 0x1,
        /// USB AHB Clock Mask
        USB_: u1 = 0x1,
        /// DSU AHB Clock Mask
        DSU_: u1 = 0x1,
        reserved7: u1 = 0,
        /// PAC AHB Clock Mask
        PAC_: u1 = 0x1,
        /// NVMCTRL AHB Clock Mask
        NVMCTRL_: u1 = 0x1,
        /// HSRAM AHB Clock Mask
        HSRAM_: u1 = 0x1,
        /// NVMCTRL_PICACHU AHB Clock Mask
        NVMCTRL_PICACHU_: u1 = 0x1,
        padding: u21 = 0,
    }),
    /// APBA Mask
    /// offset: 0x14
    APBAMASK: mmio.Mmio(packed struct(u32) {
        /// PAC APB Clock Enable
        PAC_: u1 = 0x1,
        /// PM APB Clock Enable
        PM_: u1 = 0x1,
        /// MCLK APB Clock Enable
        MCLK_: u1 = 0x1,
        /// RSTC APB Clock Enable
        RSTC_: u1 = 0x1,
        /// OSCCTRL APB Clock Enable
        OSCCTRL_: u1 = 0x1,
        /// OSC32KCTRL APB Clock Enable
        OSC32KCTRL_: u1 = 0x1,
        /// SUPC APB Clock Enable
        SUPC_: u1 = 0x1,
        /// GCLK APB Clock Enable
        GCLK_: u1 = 0x1,
        /// WDT APB Clock Enable
        WDT_: u1 = 0x1,
        /// RTC APB Clock Enable
        RTC_: u1 = 0x1,
        /// EIC APB Clock Enable
        EIC_: u1 = 0x1,
        /// FREQM APB Clock Enable
        FREQM_: u1 = 0x1,
        padding: u20 = 0,
    }),
    /// APBB Mask
    /// offset: 0x18
    APBBMASK: mmio.Mmio(packed struct(u32) {
        /// USB APB Clock Enable
        USB_: u1 = 0x1,
        /// DSU APB Clock Enable
        DSU_: u1 = 0x1,
        /// NVMCTRL APB Clock Enable
        NVMCTRL_: u1 = 0x1,
        /// PORT APB Clock Enable
        PORT_: u1 = 0x1,
        padding: u28 = 0,
    }),
    /// APBC Mask
    /// offset: 0x1c
    APBCMASK: mmio.Mmio(packed struct(u32) {
        /// EVSYS APB Clock Enable
        EVSYS_: u1 = 0x1,
        /// SERCOM0 APB Clock Enable
        SERCOM0_: u1 = 0x1,
        /// SERCOM1 APB Clock Enable
        SERCOM1_: u1 = 0x1,
        /// SERCOM2 APB Clock Enable
        SERCOM2_: u1 = 0x1,
        /// SERCOM3 APB Clock Enable
        SERCOM3_: u1 = 0x1,
        reserved7: u2 = 0,
        /// TCC0 APB Clock Enable
        TCC0_: u1 = 0x1,
        /// TC0 APB Clock Enable
        TC0_: u1 = 0x1,
        /// TC1 APB Clock Enable
        TC1_: u1 = 0x1,
        /// TC2 APB Clock Enable
        TC2_: u1 = 0x1,
        /// TC3 APB Clock Enable
        TC3_: u1 = 0x1,
        /// ADC APB Clock Enable
        ADC_: u1 = 0x1,
        /// AC APB Clock Enable
        AC_: u1 = 0x1,
        /// PTC APB Clock Enable
        PTC_: u1 = 0x1,
        /// SLCD APB Clock Enable
        SLCD_: u1 = 0x1,
        /// AES APB Clock Enable
        AES_: u1 = 0x1,
        /// TRNG APB Clock Enable
        TRNG_: u1 = 0x1,
        /// CCL APB Clock Enable
        CCL_: u1 = 0x1,
        padding: u13 = 0,
    }),
};
