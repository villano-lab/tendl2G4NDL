#!/bin/sh

MAX=${1:-0}
EXE=${2:-echo}

#./tendl2G4NDL ../neutron_file/Ge/Ge070/lib/endf/random/n-Ge070-rand-0001.gz test.zz
seq -f %03g 0 ${MAX} |awk -v exe=${EXE} '
{
 system("echo mkdir -p random_xns/Random" $0"/Elastic/CrossSection");
 system("echo ./tendl2G4NDL ../neutron_file/Ge/Ge070/lib/endf/random/n-Ge070-rand-0"$0".gz random_xns/Random"$0"/Elastic/CrossSection/32_70_Germanium.z n-Ge070 "$0);
 system("echo ./tendl2G4NDL ../neutron_file/Ge/Ge072/lib/endf/random/n-Ge072-rand-0"$0".gz random_xns/Random"$0"/Elastic/CrossSection/32_72_Germanium.z n-Ge072 "$0);
 system("echo ./tendl2G4NDL ../neutron_file/Ge/Ge073/lib/endf/random/n-Ge073-rand-0"$0".gz random_xns/Random"$0"/Elastic/CrossSection/32_73_Germanium.z n-Ge073 "$0);
 system("echo ./tendl2G4NDL ../neutron_file/Ge/Ge074/lib/endf/random/n-Ge074-rand-0"$0".gz random_xns/Random"$0"/Elastic/CrossSection/32_74_Germanium.z n-Ge074 "$0);
 system("echo ./tendl2G4NDL ../neutron_file/Ge/Ge076/lib/endf/random/n-Ge076-rand-0"$0".gz random_xns/Random"$0"/Elastic/CrossSection/32_76_Germanium.z n-Ge076 "$0);

 if(exe=="exe"){
   print "doing it!"
   system("mkdir -p random_xns/Random" $0"/Elastic/CrossSection");
   system("./tendl2G4NDL ../neutron_file/Ge/Ge070/lib/endf/random/n-Ge070-rand-0"$0".gz random_xns/Random"$0"/Elastic/CrossSection/32_70_Germanium.z n-Ge070 "$0);
   system("./tendl2G4NDL ../neutron_file/Ge/Ge072/lib/endf/random/n-Ge072-rand-0"$0".gz random_xns/Random"$0"/Elastic/CrossSection/32_72_Germanium.z n-Ge072 "$0);
   system("./tendl2G4NDL ../neutron_file/Ge/Ge073/lib/endf/random/n-Ge073-rand-0"$0".gz random_xns/Random"$0"/Elastic/CrossSection/32_73_Germanium.z n-Ge073 "$0);
   system("./tendl2G4NDL ../neutron_file/Ge/Ge074/lib/endf/random/n-Ge074-rand-0"$0".gz random_xns/Random"$0"/Elastic/CrossSection/32_74_Germanium.z n-Ge074 "$0);
   system("./tendl2G4NDL ../neutron_file/Ge/Ge076/lib/endf/random/n-Ge076-rand-0"$0".gz random_xns/Random"$0"/Elastic/CrossSection/32_76_Germanium.z n-Ge076 "$0);
 }
}'
