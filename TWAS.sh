#!/bin/bash

conda activate ldsc_env
python ./munge_sumstats.py \
    --sumstats TWAS/sleep_res.txt \
    --out TWAS/sumstats/newsum \
    --chunksize 500000 \
    --snp rsID \
    --a1 REF \
    --a2 ALT \
    --signed-sumstats Z_stat,0 \
    --p pvalue \
    --N-col N


conda activate fusion_env
files=(TWAS/sumstats/newsum*.gz)

for file in "${files[@]}"; do
    filename=$(basename "$file")

    out_filename="${filename%.sumstats.gz}"
    out_path="TWAS/result/$out_filename"

    for i in {1..22}; do
        Rscript ./FUSION.assoc_test.R \
            --sumstats "$file" \
            --weights "TWAS/CMC.BRAIN.RNASEQ.pos" \
            --weights_dir "TWAS/" \
            --ref_ld_chr "TWAS/LDREF/1000G.EUR." \
            --chr "$i" \
            --out "$out_path.chr$i.dat"
    done
done