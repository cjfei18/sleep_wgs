#!/bin/bash

for chrom in {1..22};
do
regenie \
  --step 2 \
  --chr ${chrom} \
  --keep id.txt \
  --bed Individual_Q0_unre_Caucasian_chr${chrom} \
  --phenoFile bt.txt \
  --covarFile cov_pc20.txt \
  --catCovarList sex \
  --pred step1/bt/step1_pred.list \
  --bt \
  --firth --approx \
  --pThresh 0.01 \
  --minMAC 1 \
  --bsize 1000 \
  --threads 150 \
  --write-samples \
  --print-pheno \
  --out step2_single/bt/step2_chr${chrom}
done


