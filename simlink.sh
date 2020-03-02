#!/bin/sh

#set the origin directory
ODIR=/local/cdms/geant4.10.01.p02-install/share/Geant4-10.1.2/data/G4NDL4.5

#| sed -E "s/.*(Random[0-9][0-9][0-9]).*/\\1/"
find random_xns -maxdepth 1 -mindepth 1 -type d |sort |awk -v odir=${ODIR} '{

  system("echo ln -s "odir"/Capture "$0"/Capture");
  system("echo ln -s "odir"/Elastic/FS "$0"/Elastic/FS");
  system("echo ln -s "odir"/Fission "$0"/Fission");
  system("echo ln -s "odir"/Inelastic "$0"/Inelastic");
  system("echo ln -s "odir"/IsotopeProduction "$0"/IsotopeProduction");
  system("echo ln -s "odir"/JENDL_HE "$0"/JENDL_HE");
  system("echo ln -s "odir"/ThermalScattering "$0"/ThermalScattering");

}'
