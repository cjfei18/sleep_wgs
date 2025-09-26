#!/bin/bash

phenotype=$1
./gcta64 \
    --HEreg \
    --mgrm mgrm_full.list \
    --pheno ${phenotype}.txt \
    --qcovar sleep_qcovar.txt \
    --covar sleep_covar.txt \
    --out ${phenotype}_h2 \
    --thread-num 48