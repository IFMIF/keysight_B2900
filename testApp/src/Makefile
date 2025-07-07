TOP = ../..
include $(TOP)/configure/CONFIG

#==============================================================================
# DB/DBD files
#==============================================================================

# Create the application DBD file from the library DBD file
DBD += keysight_B2900_test.dbd
keysight_B2900_test_DBD += keysight_B2900.dbd

#==============================================================================
# Source and libraries
#==============================================================================

# Build an IOC application
PROD_IOC = keysight_B2900_test

# Application source files
# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
keysight_B2900_test_SRCS += keysight_B2900_test_registerRecordDeviceDriver.cpp
keysight_B2900_test_SRCS_DEFAULT += main.cpp

# Add a definition for each support application used by this application
# N1470App_LIBS += N1470 calc stream asyn pcre seq pv sscan
keysight_B2900_test_LIBS += keysight_B2900
keysight_B2900_test_LIBS += stream calc seq pv sscan asyn
keysight_B2900_test_LIBS += $(EPICS_BASE_IOC_LIBS)

#==============================================================================
# EPICS build rules
#==============================================================================

include $(TOP)/configure/RULES
#  ADD EXTRA GNUMAKE RULES BELOW HERE
USR_CXXFLAGS += -Wno-deprecated -Werror -fPIC
