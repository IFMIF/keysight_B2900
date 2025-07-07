TOP = ..
include $(TOP)/configure/CONFIG

#==============================================================================
# DB/DBD files
#==============================================================================

# <name>.dbd will be generated from <name>Include.dbd
DBD += keysight_B2900.dbd

# Install .dbd and .db files
DB += keysight_B2900.db
#DB += keysight_B2900_process.db
DB += keysight_B2900.proto

#==============================================================================
# Source and libraries
#==============================================================================

# Build B2900 as a library for an IOC
LIBRARY_IOC = keysight_B2900

# Library source files
# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
keysight_B2900_SRCS += keysight_B2900_registerRecordDeviceDriver.cpp
keysight_B2900_SRCS += keysight_B2900_process.cpp

# Link the required libraries
keysight_B2900_LIBS += stream calc seq pv sscan asyn
keysight_B2900_LIBS += $(EPICS_BASE_IOC_LIBS)

#==============================================================================
# EPICS build rules
#==============================================================================

include $(TOP)/configure/RULES
#  ADD EXTRA GNUMAKE RULES BELOW HERE
