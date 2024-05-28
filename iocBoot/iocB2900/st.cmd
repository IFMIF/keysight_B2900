#!../../bin/linux-x86_64/B2900

#- You may have to change DG645 to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"
epicsEnvSet "STREAM_PROTOCOL_PATH" "$(TOP)/db"
epicsEnvSet "IP" "hebt-electrometer"
epicsEnvSet "IPport" "5025"

# Macro prefix
epicsEnvSet "P" "DIAG:"
epicsEnvSet "R" "B2900:"
epicsEnvSet "FETCH_SIZE" "4000"

## Register all support components
dbLoadDatabase "dbd/B2900.dbd"
B2900_registerRecordDeviceDriver pdbbase

drvAsynIPPortConfigure("L0","$(IP):$(IPport)",0,0,0) 

asynSetTraceMask("L0", 0, 4)
asynSetTraceIOMask("L0", 0, 6)

epicsThreadSleep(2)


## Load record instances
#dbLoadRecords("db/asynRecord.db","P=$(P),R=$(R),PORT=L0,ADDR=0,IMAX=200,OMAX=200")
dbLoadRecords("db/B2900.db","P=$(P),R=$(R),PORT=L0,A=0,FETCH_SIZE=$(FETCH_SIZE)")
dbLoadRecords("db/B2900Process.db","P=$(P),R=$(R),FETCH_SIZE=$(FETCH_SIZE)")

cd "${TOP}/iocBoot/${IOC}"
iocInit

