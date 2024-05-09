#!../../bin/linux-x86_64/B2900

#- You may have to change DG645 to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"
epicsEnvSet "STREAM_PROTOCOL_PATH" "$(TOP)/db"
epicsEnvSet "IP" "172.16.8.235"
epicsEnvSet "IPport" "5025"

# Macro prefix
epicsEnvSet "P" "DCU08:"
epicsEnvSet "R" "B2900:"

## Register all support components
dbLoadDatabase "dbd/B2900.dbd"
DG645_registerRecordDeviceDriver pdbbase

drvAsynIPPortConfigure("L0","$(IP):$(IPport)",0,0,0) 

asynSetTraceMask("L0", 0, 4)
asynSetTraceIOMask("L0", 0, 6)

epicsThreadSleep(2)


## Load record instances
#dbLoadRecords("db/asynRecord.db","P=$(P),R=$(R),PORT=L0,ADDR=0,IMAX=200,OMAX=200")
dbLoadRecords("db/B2900.db","P=$(P),R=$(R),PORT=L0,A=0")

cd "${TOP}/iocBoot/${IOC}"
iocInit

