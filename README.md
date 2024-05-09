# DG645 EPICS Support (WIP)

This a basic EPICS support for the DG645 Delay Generator from Stanford Research Systems. The support used StreamDevice module to communicate the serial command through the Ethernet interface.

Features:
- [x] Delay
- [x] Trigger
- [ ] Burst
- [ ] Options and configuration

This is a Work in Progress, be careful!

## Requierements

The support has been tested with the following EPICS ecosystem:
- base 7.0.7
- asyn 4.44.2
- StreamDevice 2.8.16

## Building

First, edit the RELEAESE file to match with the different EPICS modules.

Then, one can build the DG645 support:

```
make
```

## Usage

A soft IOC is available. Edit the `iocBoot\iocDG645\st.cmd` with the correct IP.
