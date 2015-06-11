function Val=ADCGET(ang)
Conv=ADC(ang);
decnum=sbin2dec(Conv);
Val=decnum-2048;
end