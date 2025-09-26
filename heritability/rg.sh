#!/bin/bash

i=$1
j=$2
./gcta64 \
    --HEreg-bivar ${i} ${j} \
    --mgrm mgrm_full.list \
    --pheno sleep_rg.txt \
    --qcovar sleep_qcovar.txt \
    --covar sleep_covar.txt \
    --out sleep_rg/rg_${i}_${j} \
    --thread-num 48