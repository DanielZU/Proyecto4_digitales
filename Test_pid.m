## Author: Kaleb Alfaro Badilla <kaleb.23415@gmail.com>
## Script: rampa_response.m


res = 3.3/(2**12 - 1);

T=(0:5e-3:4000*5e-3);%Muestreo a 1/44.1kHz
Ramp=(3*T)+1.65;

%Generación del vector de estímulos en un archivo .txt
fid= fopen('test_pid.txt', 'w');

for  i=1:length(Ramp)
	if(Ramp(i)<0)
		fprintf (fid, '%s \n',dec2bin(bitcmp(-round(Ramp(i)/res),13)+1,13));
	else
		fprintf (fid, '%s \n',dec2bin(round(Ramp(i)/res),13));		
	endif
endfor

fclose(fid);
