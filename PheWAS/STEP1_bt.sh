#!/bin/bash

regenie \
  --step 1 \
  --bed ukb_cal_allChrs_hg38 \
  --extract qc_pass.snplist \
  --keep id.txt \
  --phenoFile bt.txt \
  --covarFile cov_pc20.txt \
  --catCovarList sex \
  --bt \
  --bsize 1000 \
  --threads 150 \
  --lowmem \
  --lowmem-prefix step1/bt/tmp/step1 \
  --out step1/bt/step1
