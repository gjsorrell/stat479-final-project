#!/bin/bash
cat $1.tsv | cut -f7,8,9,10,14 > extract_$1.tsv

tar -xzf R402.tar.gz

export PATH=$PWD/R/bin:$PATH
export RHOME=$PWD/R
export R_LIBS=$PWD/packages


Rscript job.R $1