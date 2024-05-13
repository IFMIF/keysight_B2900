TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE
# Build the IOC application
PROD_IOC = B2900

# DG645.dbd will be created and installed
DBD += B2900.dbd

# DG645.dbd will include these files:
B2900_DBD += base.dbd
B2900_DBD += calcSupport.dbd
B2900_DBD += stream.dbd
B2900_DBD += asyn.dbd
B2900_DBD += drvAsynSerialPort.dbd
B2900_DBD += drvAsynIPPort.dbd

# Link in the code from our support library
B2900_LIBS += stream calc pcre seq pv sscan
B2900_LIBS += asyn

# DG645_registerRecordDeviceDriver.cpp derives from DG645.dbd
B2900_SRCS += B2900_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
B2900_SRCS_DEFAULT += B2900Main.cpp
B2900_SRCS_vxWorks += -nil-

# Finally link IOC to the EPICS Base libraries
B2900_LIBS += $(EPICS_BASE_IOC_LIBS)
B2900_SYS_LIBS += usb-1.0

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE
