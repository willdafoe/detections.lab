#!/bin/sh -l

input_file = $1
output_format = $2
output_file = $3

ln -s /render.R .

Rscript render.R $input_file $output_format
