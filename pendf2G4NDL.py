import ENDF6
import matplotlib.pyplot as plt
from math import ceil

f = open('tape21')
lines = f.readlines()
sec = ENDF6.find_section(lines, MF=3, MT=2)  # total cross-section
x, y = ENDF6.read_table(sec)
f.close()

out = open('output.txt','w')
#out.write("G4NDL\nENDF/B-VII.1\n2\n0\n%d\n"%(int(ceil(len(x)/3))))	
out.write("G4NDL\nENDF/B-VII.1\n2\n0\n%d\n"%(len(x)))	
for i in range(len(x)):
	out.write("%e %e"%(x[i],y[i]))
	if (i+1)%3 == 0:
		out.write("\n")
	else:
		out.write(" ")
out.close()

#plt.figure()
#plt.scatter(x, y, marker='.')
#plt.xscale('log')
#plt.yscale('log')
#plt.xlabel('Energy [eV]')
#plt.ylabel('Cross-section [barn]')
#plt.show()
