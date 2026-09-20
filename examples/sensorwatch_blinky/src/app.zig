const gossamer = @import("gossamer");
comptime {
    // TODO: Is there a way to not need this?

    // Force `app_*` functions to be exported
    _ = gossamer;
}

pub const gossamer_options: gossamer.Options = .{
    .initFn = init,
    .setupFn = setup,
    .loopFn = loop,
};

extern fn delay_ms(ms: u16) void;

fn init() void {}
fn setup() void {
    led.out();
}
fn loop() bool {
    led.toggle();
    delay_ms(500);
    led.toggle();
    delay_ms(1000);
    return false;
}

// TODO: Don't hardcode these types

const hal_gpio = struct {
    pub const PORTA = 0;
    pub const PORTB = 1;
    pub const PORTC = 2;
};

const led = struct {
    const port = hal_gpio.PORTA;
    const pin = 20;

    pub fn out() void {
        PORT.group[port].dirset.reg = (1 << pin);
        PORT.group[port].pincfg[pin].reg |= PORT_PINCFG_INEN;
    }

    pub fn toggle() void {
        PORT.group[port].outtgl.reg = (1 << pin);
    }
};

// #define PORT_PINCFG_INEN_Pos        1            /**< \brief (PORT_PINCFG) Input Enable */
// #define PORT_PINCFG_INEN            (0x1ul << PORT_PINCFG_INEN_Pos)
const PORT_PINCFG_INEN = 0x1 << 1;

const PORT: *volatile Port = @ptrFromInt(0x41006000);

const Port = extern struct {
    group: [3]PortGroup,
};

const PortGroup = extern struct {
    // PORT_DIR_Type             DIR;         /**< \brief Offset: 0x00 (R/W 32) Data Direction */
    dir: u32,
    // PORT_DIRCLR_Type          DIRCLR;      /**< \brief Offset: 0x04 (R/W 32) Data Direction Clear */
    dirclr: u32,
    // PORT_DIRSET_Type          DIRSET;      /**< \brief Offset: 0x08 (R/W 32) Data Direction Set */
    dirset: extern union {
        reg: u32,
    },
    // PORT_DIRTGL_Type          DIRTGL;      /**< \brief Offset: 0x0C (R/W 32) Data Direction Toggle */
    dirtgl: u32,
    // PORT_OUT_Type             OUT;         /**< \brief Offset: 0x10 (R/W 32) Data Output Value */
    out: u32,
    // PORT_OUTCLR_Type          OUTCLR;      /**< \brief Offset: 0x14 (R/W 32) Data Output Value Clear */
    outclr: u32,
    // PORT_OUTSET_Type          OUTSET;      /**< \brief Offset: 0x18 (R/W 32) Data Output Value Set */
    outset: u32,
    // PORT_OUTTGL_Type          OUTTGL;      /**< \brief Offset: 0x1C (R/W 32) Data Output Value Toggle */
    outtgl: extern union {
        reg: u32,
    },
    // PORT_IN_Type              IN;          /**< \brief Offset: 0x20 (R/  32) Data Input Value */
    in: u32,
    // PORT_CTRL_Type            CTRL;        /**< \brief Offset: 0x24 (R/W 32) Control */
    ctrl: u32,
    // PORT_WRCONFIG_Type        WRCONFIG;    /**< \brief Offset: 0x28 ( /W 32) Write Configuration */
    wrconfig: u32,
    // PORT_EVCTRL_Type          EVCTRL;      /**< \brief Offset: 0x2C (R/W 32) Event Input Control */
    evctrl: u32,
    // PORT_PMUX_Type            PMUX[16];    /**< \brief Offset: 0x30 (R/W  8) Peripheral Multiplexing n */
    pmux: [16]u8,
    // PORT_PINCFG_Type          PINCFG[32];  /**< \brief Offset: 0x40 (R/W  8) Pin Configuration n */
    pincfg: [32]extern union {
        reg: u8,
    },
    //      RoReg8                    Reserved1[0x20];
    reserved1: [0x20]u8,
};
