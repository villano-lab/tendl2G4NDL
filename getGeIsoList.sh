#!/bin/sh

ls ../neutron_file/Ge/Ge070/lib/endf/random/n-Ge070-rand-0* |sed -E "s/.*-([0-9][0-9][0-9][0-9])(.gz)?.*/\\1/" > 70.txt
ls ../neutron_file/Ge/Ge072/lib/endf/random/n-Ge072-rand-0* |sed -E "s/.*-([0-9][0-9][0-9][0-9])(.gz)?.*/\\1/" > 72.txt
ls ../neutron_file/Ge/Ge073/lib/endf/random/n-Ge073-rand-0* |sed -E "s/.*-([0-9][0-9][0-9][0-9])(.gz)?.*/\\1/" > 73.txt
ls ../neutron_file/Ge/Ge074/lib/endf/random/n-Ge074-rand-0* |sed -E "s/.*-([0-9][0-9][0-9][0-9])(.gz)?.*/\\1/" > 74.txt
ls ../neutron_file/Ge/Ge076/lib/endf/random/n-Ge076-rand-0* |sed -E "s/.*-([0-9][0-9][0-9][0-9])(.gz)?.*/\\1/" > 76.txt
seq 0 300 > seq.txt

paste seq.txt 70.txt 72.txt 73.txt 74.txt 76.txt |awk '{if(NF==6){print "\t"$1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}}'
rm -f seq.txt
rm -f 70.txt
rm -f 72.txt
rm -f 73.txt
rm -f 74.txt
rm -f 76.txt
