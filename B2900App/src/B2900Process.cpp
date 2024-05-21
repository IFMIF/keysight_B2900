#include <stdio.h>
#include <aSubRecord.h>
#include <dbDefs.h>
#include <epicsExport.h>
#include <registryFunction.h>
#include <subRecord.h>

static long arrayParse(aSubRecord *prec){
    long i;
    float *input, *output_current, *output_time;

    printf("arrayParse start");

    input = (float *)prec->a;
    output_current = (float *)prec->vala;
    output_time = (float *)prec->valb;
    
    for (i=0; i<prec->noa; i+=2){
        output_current[i/2] = input[i];
        output_time[i/2] = input[i+1];
    }

    return 0;
}

epicsRegisterFunction(arrayParse);