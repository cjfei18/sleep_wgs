#!/bin/bash

for i in {1..22}; do
    ./gcta64 \
        --bfile chr${i} \
        --ld-score-region 200 \
        --ld-wind 1000 \
        --threads 64 \
        --out chr${i}
done
