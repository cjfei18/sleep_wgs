#!/bin/bash

for chrom in {1..22};
do
regenie \
  --step 2 \
  --chr ${chrom} \
  --keep id.txt \
  --bed GeneCentric_Q0_unre_Caucasian_chr${chrom} \
  --phenoFile bt.txt \
  --covarFile cov_pc20.txt \
  --catCovarList sex \
  --pred step1/bt/step1_pred.list \
  --anno-file annotationfile.txt \
  --set-list listfile.txt \
  --mask-def maskfile.txt \
  --aaf-bins 0.01 \
  --minMAC 1 \
  --vc-tests skato,acato-full \
  --vc-maxAAF 0.01 \
  --rgc-gene-p \
  --write-mask \
  --bt \
  --firth --approx \
  --pThresh 0.01 \
  --bsize 200 \
  --threads 150 \
  --write-samples \
  --print-pheno \
  --out step2_gene/bt/step2_chr${chrom}
done

