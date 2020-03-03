#!/bin/sh

#set the origin directory
ODIR=/local/cdms/geant4.10.01.p02-install/share/Geant4-10.1.2/data/G4NDL4.5


#get ready to cry blood. 
#First find all files that already exist in random_xns and pipe to a file
find random_xns -maxdepth 4 -mindepth 4 -type f |sed -E "s/.*(\/Elastic\/CrossSection\/.*)(.z)?.*/\\1/" |awk '{names[$0]++}END{for(i in names){print i;}}' >grepout.txt

#now find all EXCEPT those and put them in a file
find ${ODIR}/Elastic/ -type f |sed -E "s/.*(\/Elastic\/.*)(.z)?.*/\\1/"|grep -v -f grepout.txt > linkfiles.txt

#cat grepout.txt
#cat linkfiles.txt
./linkthese.sh linkfiles.txt random_xns/Random0000/

rm -f grepout.txt
rm -f linkfiles.txt


#find random_xns -maxdepth 3 -mindepth 3 -type f |grep 'Elastic\/'

#| sed -E "s/.*(Random[0-9][0-9][0-9]).*/\\1/"
find random_xns -maxdepth 1 -mindepth 1 -type d |sort |awk -v odir=${ODIR} '{

  #system("echo ln -s "odir"/Capture "$0"/Capture");
  #system("echo ln -s "odir"/Elastic/FS "$0"/Elastic/FS");
  #system("echo ln -s "odir"/Fission "$0"/Fission");
  #system("echo ln -s "odir"/Inelastic "$0"/Inelastic");
  #system("echo ln -s "odir"/IsotopeProduction "$0"/IsotopeProduction");
  #system("echo ln -s "odir"/JENDL_HE "$0"/JENDL_HE");
  #system("echo ln -s "odir"/ThermalScattering "$0"/ThermalScattering");

}'
