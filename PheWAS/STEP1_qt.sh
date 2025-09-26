#!/bin/bash

regenie \
  --step 1 \
  --bed ukb_cal_allChrs_hg38 \
  --extract qc_pass.snplist \
  --keep id.txt \
  --phenoFile qt.txt \
  --covarFile cov_pc20.txt \
  --catCovarList sex \
  --qt \
  --bsize 1000 \
  --threads 150 \
  --lowmem \
  --lowmem-prefix step1/qt/tmp/step1 \
  --out step1/qt/step1

