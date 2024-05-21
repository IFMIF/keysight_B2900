#include <stdio.h>
#include <aSubRecord.h>
#include <dbDefs.h>
#include <epicsExport.h>
#include <registryFunction.h>
#include <subRecord.h>

static long arrayParse(aSubRecord *prec){
    long i;
    float *input, *output_current, *output_time;

    // Pointers assignation to their correct prec
    input = (float *)prec->a;
    output_current = (float *)prec->vala;
    output_time = (float *)prec->valb;

    // Parsing the input into the outputs (nea is the limit of the current processed measure)
    for (i=0; i<prec->nea; i+=2){
        output_current[i/2] = input[i];
        output_time[i/2] = input[i+1];
    }

    // Setting the limits of the arrays
    prec->neva = prec->nea/2;
    prec->nevb = prec->nea/2;

    return 0;
}

epicsRegisterFunction(arrayParse);
