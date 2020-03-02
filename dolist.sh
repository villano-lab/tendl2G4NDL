#!/bin/sh

MAX=${1:-0}
EXE=${2:-echo}

#get the isotopes list and date stamp that shit. 
filename=GeIsoList-`date "+%Y-%m-%d-%H:%M:%S"`
./getGeIsoList.sh > ${filename}

#add one to MAX so it works with the head command 
MAX="$((MAX+1))"
#seq -f %03g 0 ${MAX} |awk -v exe=${EXE} '
head -n ${MAX} ${filename} |awk -v exe=${EXE} '
{
 system("echo mkdir -p random_xns/Random" $1"/Elastic/CrossSection");
 system("echo ./tendl2G4NDL ../neutron_file/Ge/Ge070/lib/endf/random/n-Ge070-rand-"$2".gz random_xns/Random"$1"/Elastic/CrossSection/32_70_Germanium.z n-Ge070 "$1);
 system("echo ./tendl2G4NDL ../neutron_file/Ge/Ge072/lib/endf/random/n-Ge072-rand-"$3".gz random_xns/Random"$1"/Elastic/CrossSection/32_72_Germanium.z n-Ge072 "$1);
 system("echo ./tendl2G4NDL ../neutron_file/Ge/Ge073/lib/endf/random/n-Ge073-rand-"$4".gz random_xns/Random"$1"/Elastic/CrossSection/32_73_Germanium.z n-Ge073 "$1);
 system("echo ./tendl2G4NDL ../neutron_file/Ge/Ge074/lib/endf/random/n-Ge074-rand-"$5".gz random_xns/Random"$1"/Elastic/CrossSection/32_74_Germanium.z n-Ge074 "$1);
 system("echo ./tendl2G4NDL ../neutron_file/Ge/Ge076/lib/endf/random/n-Ge076-rand-"$6".gz random_xns/Random"$1"/Elastic/CrossSection/32_76_Germanium.z n-Ge076 "$1);

 if(exe=="exe"){
   print "doing it!"
   system("mkdir -p random_xns/Random" $1"/Elastic/CrossSection");
   system("./tendl2G4NDL ../neutron_file/Ge/Ge070/lib/endf/random/n-Ge070-rand-"$2".gz random_xns/Random"$1"/Elastic/CrossSection/32_70_Germanium.z n-Ge070 "$1);
   system("./tendl2G4NDL ../neutron_file/Ge/Ge072/lib/endf/random/n-Ge072-rand-"$3".gz random_xns/Random"$1"/Elastic/CrossSection/32_72_Germanium.z n-Ge072 "$1);
   system("./tendl2G4NDL ../neutron_file/Ge/Ge073/lib/endf/random/n-Ge073-rand-"$4".gz random_xns/Random"$1"/Elastic/CrossSection/32_73_Germanium.z n-Ge073 "$1);
   system("./tendl2G4NDL ../neutron_file/Ge/Ge074/lib/endf/random/n-Ge074-rand-"$5".gz random_xns/Random"$1"/Elastic/CrossSection/32_74_Germanium.z n-Ge074 "$1);
   system("./tendl2G4NDL ../neutron_file/Ge/Ge076/lib/endf/random/n-Ge076-rand-"$6".gz random_xns/Random"$1"/Elastic/CrossSection/32_76_Germanium.z n-Ge076 "$1);
 }
}'
