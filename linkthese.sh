#!/bin/sh

linkfile=$1
randdir=$2
EXE=${3:-echo}

#set the origin directory
ODIR=/local/cdms/geant4.10.01.p02-install/share/Geant4-10.1.2/data/G4NDL4.5

cat ${linkfile} | awk -v exe=${EXE} -v randir=${randdir} -v odir=${ODIR} '{

  system("echo ln -s "odir $0" "randir $0);
  
  if(exe=="exe"){
    system("ln -s "odir $0" "randir $0);
  }

}'
