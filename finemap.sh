#!/bin/bash

# Calculate pairwise variant LD
for pheno in $pheno_list; do
    outputpath="./input_file/ldfile/${pheno}"
    mkdir -p "$outputpath"
    while read line; do
        region=`echo $line | awk '{print \$1}'`
        chr=$(echo $region | awk -F':' '{print \$1}')
        snpfile="./input_file/snplist/${pheno}/${pheno}_${region}.rsid"
        plink \
            --bfile /path/to/WGS_data/chr${chr} \
            --keep ./sleep_ids.txt \
            --extract ${snpfile} \
            --r inter-chr \
            --ld-window-r2 0 \
            --out ${outputpath}/${pheno}_${region}
    done < ./pheno_region/${pheno}_merged_regions.txt
done

# Run FINEMAP
./finemap_v1.4.2_x86_64 \
    --sss \
    --log \
    --corr-config 0.95 \
    --n-causal-snps 10 \
    --n-iter 100 \
    --prob-cred-set 0.99 \
    --in-files ./input_file/masterfile/${pheno}_master \
    --n-threads 48