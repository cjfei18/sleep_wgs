#!/bin/bash

for chrom in {1..22};
do
regenie \
  --step 2 \
  --chr ${chrom} \
  --keep id.txt \
  --bed Individual_Q0_unre_Caucasian_chr${chrom} \
  --phenoFile qt.txt \
  --covarFile cov_pc20.txt \
  --catCovarList sex \
  --pred step1/qt/step1_pred.list \
  --qt \
  --minMAC 1 \
  --bsize 1000 \
  --threads 150 \
  --write-samples \
  --print-pheno \
  --out step2_single/qt/step2_chr${chrom}
done
