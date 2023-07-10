#!/bin/sh 

input_file=$1
output_format=$2
output_file=$3
output_dir=$4

Rscript -e "rmarkdown::render('$input_file', output_format = '$output_format',output_dir=$output_dir,output_file = '$output_file')"