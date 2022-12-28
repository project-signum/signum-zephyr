Signum Zephyr
=============

[Zephyr Getting Started Guide](https://docs.zephyrproject.org/latest/getting_started/index.html)

```console
$ west init -m git@github.com:signumembedded/signum-zephyr.git signum-zephyr
$ cd signum-zephyr
$ west update
```

Analog Devices Pluto
--------------------

### U-Boot


#### Build U-Boot:

```console
$ git clone -b pluto https://github.com/analogdevicesinc/u-boot-xlnx.git
$ cd u-boot-xlnx
$ make distclean
$ make zynq_pluto_defconfig
$ export PATH=~/.local/zephyr-sdk-0.15.2/arm-zephyr-eabi/bin/:$PATH
$ export CROSS_COMPILE=arm-zephyr-eabi-
$ export DEVICE_TREE="zynq-pluto-sdr"
$ make
```

#### Connect JTAG:

```console
$ ~/.local/Xilinx/Vivado/2021.1/bin/xsdb
xsdb% connect
xsdb% targets -set -filter {name =~ "ARM*#0"}
```

### Hold USR_BTN (S1) and reset:

```console
xsdb% rst
```

### Load SPL:

```console
xsdb% dow -data spl/u-boot-spl.bin 0x0
xsdb% rwr pc 0x0
xsdb% con
```

### Load Zephyr:

```console
xsdb% stop
xsdb% dow build/zephyr/zephyr.elf
xsdb% con
```

References
----------

- https://docs.zephyrproject.org/latest/boards/arm/zybo/doc/index.html
- https://github.com/Xilinx/meta-xilinx/blob/master/README.booting.md#loading-via-jtag
- [Xilinx U-boot Wiki](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842223/U-boot)

