#!../bin/linux-x86_64/keysight_B2900_test

< envPaths

# Settings
epicsEnvSet("BOOT_DIR", ${PWD})
epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/db")
epicsEnvSet("DEVICE_HOSTNAME", "keysight-b2900.local:5025")
epicsEnvSet("BUS", "L0")

epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/db")
epicsEnvSet("P", "DIAG:")
epicsEnvSet("R", "B2900:")
epicsEnvSet("FETCH_SIZE", "20000")
epicsEnvSet("DATA_SIZE", "10000")

# Register all support components
cd "$(TOP)/dbd"
dbLoadDatabase("keysight_B2900.dbd")
keysight_B2900_test_registerRecordDeviceDriver(pdbbase)

# Set up IOC/hardware links - TCP port
#     (link, host, priority, noAutoConnect, noEosProcessing)
drvAsynIPPortConfigure("$(BUS)", "$(DEVICE_HOSTNAME)", 0, 0, 0) 
epicsThreadSleep(2)

# Only for debugging
asynSetTraceMask("$(BUS)", 0, 4)
asynSetTraceIOMask("$(BUS)", 0, 6)

# Load record instances
cd "$(TOP)/db"
dbLoadRecords("keysight_B2900.db","P=$(P),R=$(R),PORT=$(BUS),A=0,FETCH_SIZE=$(FETCH_SIZE),DATA_SIZE=$(DATA_SIZE)")

# Start the IOC control loop
cd $(BOOT_DIR)
iocInit()
