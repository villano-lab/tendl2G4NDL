#!/bin/sh

EXE=${1:-echo}

#set the origin directory
ODIR=/local/cdms/geant4.10.01.p02-install/share/Geant4-10.1.2/data/G4NDL4.5


#get ready to cry blood. 
#First find all files that already exist in random_xns and pipe to a file
find random_xns -maxdepth 4 -mindepth 4 -type f |sed -E "s/.*(\/Elastic\/CrossSection\/.*)(.z)?.*/\\1/" |awk '{names[$0]++}END{for(i in names){print i;}}' >grepout.txt

#now find all EXCEPT those and put them in a file
find ${ODIR}/Elastic/ -type f |sed -E "s/.*(\/Elastic\/.*)(.z)?.*/\\1/"|grep -v -f grepout.txt > linkfiles.txt

#cat grepout.txt
#cat linkfiles.txt

rm -f grepout.txt


#find random_xns -maxdepth 3 -mindepth 3 -type f |grep 'Elastic\/'

#WARNING: the calls beyond this point are really hard to exit from
#probably because they happen fast and spawn new processes; CTRL-C will not exit immediately,
#use the "max" parameter to start with a small sample, say max=2. 

#set max to 999999999999 or something to be sure to do all of them
#FIXME: maybe this script should just do one Random directory, with the directory name
#as a second input. 
find random_xns -maxdepth 1 -mindepth 1 -type d |sort |awk -v exe=${EXE} -v max=2 -v odir=${ODIR} '{

  if(NR<max){
    system("echo ln -s "odir"/Capture "$0"/Capture");
    #dont need to link the fs files, they are linked individually
    #system("echo ln -s "odir"/Elastic/FS "$0"/Elastic/FS");
    system("echo ln -s "odir"/Fission "$0"/Fission");
    system("echo ln -s "odir"/Inelastic "$0"/Inelastic");
    system("echo ln -s "odir"/IsotopeProduction "$0"/IsotopeProduction");
    system("echo ln -s "odir"/JENDL_HE "$0"/JENDL_HE");
    system("echo ln -s "odir"/ThermalScattering "$0"/ThermalScattering");
    system("./linkthese.sh linkfiles.txt "$0); 

    if(exe=="exe"){
      system("ln -s "odir"/Capture "$0"/Capture");
      #dont need to link the fs files, they are linked individually
      #system("ln -s "odir"/Elastic/FS "$0"/Elastic/FS");
      system("ln -s "odir"/Fission "$0"/Fission");
      system("ln -s "odir"/Inelastic "$0"/Inelastic");
      system("ln -s "odir"/IsotopeProduction "$0"/IsotopeProduction");
      system("ln -s "odir"/JENDL_HE "$0"/JENDL_HE");
      system("ln -s "odir"/ThermalScattering "$0"/ThermalScattering");
      system("./linkthese.sh linkfiles.txt "$0" exe"); 
    }
  }

}'
rm -f linkfiles.txt
