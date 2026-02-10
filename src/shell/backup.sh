#!/bin/bash
for file in *.c;
do
 cp $file ${file}.bkup;
done