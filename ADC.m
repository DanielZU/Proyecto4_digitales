function Conv=ADC(ang)
num=-0.0115*ang+2.1056;
num1=(num+2)*0.825;
fact=4095/3.3;
val=num1*fact;
bin=round(val);
Conv=strcat('0',dec2bin(bin,12));
end