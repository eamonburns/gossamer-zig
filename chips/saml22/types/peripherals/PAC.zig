const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Peripheral Access Controller
pub const PAC = extern struct {
    /// Write control
    /// offset: 0x00
    WRCTRL: mmio.Mmio(packed struct(u32) {
        /// Peripheral identifier
        PERID: u16 = 0x0,
        /// Peripheral access control key
        KEY: enum(u8) {
            /// No action
            OFF = 0x0,
            /// Clear protection
            CLR = 0x1,
            /// Set protection
            SET = 0x2,
            /// Set and lock protection
            SETLCK = 0x3,
            _,
        } = .OFF,
        padding: u8 = 0,
    }),
    /// Event control
    /// offset: 0x04
    EVCTRL: mmio.Mmio(packed struct(u8) {
        /// Peripheral acess error event output
        ERREO: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// offset: 0x05
    reserved5: [3]u8,
    /// Interrupt enable clear
    /// offset: 0x08
    INTENCLR: mmio.Mmio(packed struct(u8) {
        /// Peripheral access error interrupt disable
        ERR: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// Interrupt enable set
    /// offset: 0x09
    INTENSET: mmio.Mmio(packed struct(u8) {
        /// Peripheral access error interrupt enable
        ERR: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// offset: 0x0a
    reserved10: [6]u8,
    /// Bridge interrupt flag status
    /// offset: 0x10
    INTFLAGAHB: mmio.Mmio(packed struct(u32) {
        /// FLASH
        FLASH_: u1 = 0x0,
        /// HSRAMCM0P
        HSRAMCM0P_: u1 = 0x0,
        /// HSRAMDSU
        HSRAMDSU_: u1 = 0x0,
        /// HPB1
        HPB1_: u1 = 0x0,
        /// HPB0
        HPB0_: u1 = 0x0,
        /// HPB2
        HPB2_: u1 = 0x0,
        /// HSRAMDMAC
        HSRAMDMAC_: u1 = 0x0,
        padding: u25 = 0,
    }),
    /// Peripheral interrupt flag status - Bridge A
    /// offset: 0x14
    INTFLAGA: mmio.Mmio(packed struct(u32) {
        /// PAC
        PAC_: u1 = 0x0,
        /// PM
        PM_: u1 = 0x0,
        /// MCLK
        MCLK_: u1 = 0x0,
        /// RSTC
        RSTC_: u1 = 0x0,
        /// OSCCTRL
        OSCCTRL_: u1 = 0x0,
        /// OSC32KCTRL
        OSC32KCTRL_: u1 = 0x0,
        /// SUPC
        SUPC_: u1 = 0x0,
        /// GCLK
        GCLK_: u1 = 0x0,
        /// WDT
        WDT_: u1 = 0x0,
        /// RTC
        RTC_: u1 = 0x0,
        /// EIC
        EIC_: u1 = 0x0,
        /// FREQM
        FREQM_: u1 = 0x0,
        padding: u20 = 0,
    }),
    /// Peripheral interrupt flag status - Bridge B
    /// offset: 0x18
    INTFLAGB: mmio.Mmio(packed struct(u32) {
        /// USB
        USB_: u1 = 0x0,
        /// DSU
        DSU_: u1 = 0x0,
        /// NVMCTRL
        NVMCTRL_: u1 = 0x0,
        /// PORT
        PORT_: u1 = 0x0,
        /// DMAC
        DMAC_: u1 = 0x0,
        /// MTB
        MTB_: u1 = 0x0,
        padding: u26 = 0,
    }),
    /// Peripheral interrupt flag status - Bridge C
    /// offset: 0x1c
    INTFLAGC: mmio.Mmio(packed struct(u32) {
        /// EVSYS
        EVSYS_: u1 = 0x0,
        /// SERCOM0
        SERCOM0_: u1 = 0x0,
        /// SERCOM1
        SERCOM1_: u1 = 0x0,
        /// SERCOM2
        SERCOM2_: u1 = 0x0,
        /// SERCOM3
        SERCOM3_: u1 = 0x0,
        reserved7: u2 = 0,
        /// TCC0
        TCC0_: u1 = 0x0,
        /// TC0
        TC0_: u1 = 0x0,
        /// TC1
        TC1_: u1 = 0x0,
        /// TC2
        TC2_: u1 = 0x0,
        /// TC3
        TC3_: u1 = 0x0,
        /// ADC
        ADC_: u1 = 0x0,
        /// AC
        AC_: u1 = 0x0,
        /// PTC
        PTC_: u1 = 0x0,
        /// SLCD
        SLCD_: u1 = 0x0,
        /// AES
        AES_: u1 = 0x0,
        /// TRNG
        TRNG_: u1 = 0x0,
        /// CCL
        CCL_: u1 = 0x0,
        padding: u13 = 0,
    }),
    /// offset: 0x20
    reserved32: [20]u8,
    /// Peripheral write protection status - Bridge A
    /// offset: 0x34
    STATUSA: mmio.Mmio(packed struct(u32) {
        /// PAC APB Protect Enable
        PAC_: u1 = 0x0,
        /// PM APB Protect Enable
        PM_: u1 = 0x0,
        /// MCLK APB Protect Enable
        MCLK_: u1 = 0x0,
        /// RSTC APB Protect Enable
        RSTC_: u1 = 0x0,
        /// OSCCTRL APB Protect Enable
        OSCCTRL_: u1 = 0x0,
        /// OSC32KCTRL APB Protect Enable
        OSC32KCTRL_: u1 = 0x0,
        /// SUPC APB Protect Enable
        SUPC_: u1 = 0x0,
        /// GCLK APB Protect Enable
        GCLK_: u1 = 0x0,
        /// WDT APB Protect Enable
        WDT_: u1 = 0x0,
        /// RTC APB Protect Enable
        RTC_: u1 = 0x0,
        /// EIC APB Protect Enable
        EIC_: u1 = 0x0,
        /// FREQM APB Protect Enable
        FREQM_: u1 = 0x0,
        padding: u20 = 0,
    }),
    /// Peripheral write protection status - Bridge B
    /// offset: 0x38
    STATUSB: mmio.Mmio(packed struct(u32) {
        /// USB APB Protect Enable
        USB_: u1 = 0x0,
        /// DSU APB Protect Enable
        DSU_: u1 = 0x1,
        /// NVMCTRL APB Protect Enable
        NVMCTRL_: u1 = 0x0,
        /// PORT APB Protect Enable
        PORT_: u1 = 0x0,
        /// DMAC APB Protect Enable
        DMAC_: u1 = 0x0,
        /// MTB APB Protect Enable
        MTB_: u1 = 0x0,
        padding: u26 = 0,
    }),
    /// Peripheral write protection status - Bridge C
    /// offset: 0x3c
    STATUSC: mmio.Mmio(packed struct(u32) {
        /// EVSYS APB Protect Enable
        EVSYS_: u1 = 0x0,
        /// SERCOM0 APB Protect Enable
        SERCOM0_: u1 = 0x0,
        /// SERCOM1 APB Protect Enable
        SERCOM1_: u1 = 0x0,
        /// SERCOM2 APB Protect Enable
        SERCOM2_: u1 = 0x0,
        /// SERCOM3 APB Protect Enable
        SERCOM3_: u1 = 0x0,
        reserved7: u2 = 0,
        /// TCC0 APB Protect Enable
        TCC0_: u1 = 0x0,
        /// TC0 APB Protect Enable
        TC0_: u1 = 0x0,
        /// TC1 APB Protect Enable
        TC1_: u1 = 0x0,
        /// TC2 APB Protect Enable
        TC2_: u1 = 0x0,
        /// TC3 APB Protect Enable
        TC3_: u1 = 0x0,
        /// ADC APB Protect Enable
        ADC_: u1 = 0x0,
        /// AC APB Protect Enable
        AC_: u1 = 0x0,
        /// PTC APB Protect Enable
        PTC_: u1 = 0x0,
        /// SLCD APB Protect Enable
        SLCD_: u1 = 0x0,
        /// AES APB Protect Enable
        AES_: u1 = 0x0,
        /// TRNG APB Protect Enable
        TRNG_: u1 = 0x0,
        /// CCL APB Protect Enable
        CCL_: u1 = 0x0,
        padding: u13 = 0,
    }),
};
