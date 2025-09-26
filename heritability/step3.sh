#!/bin/bash

for maf in {1..4}; do
    for ld in {1..2}; do
        for i in {1..40}; do
            ./gcta64 \
                --mbfile plink_file.txt \
                --make-grm-alg 1 \
                --make-grm-part 40 ${i} \
                --threads 128 \
                --extract maf${maf}_ld${ld}_snplist.txt \
                --out maf${maf}_ld${ld}
        done
    done
done