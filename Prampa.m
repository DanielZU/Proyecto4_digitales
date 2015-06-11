T=0:10:2550;
%yk=-128:1:127;

i=1;
fida=fopen('test_pid.txt','r');
while(!feof(fida))
   Output=fscanf(fida,"%s\n","C");
   yka(i)=pf2dec(Output,0,1);
   i=i+1;
   end
fclose(fida);

yk=(yka/2**11);
Sal1=I_PD(yk,1);
Sal= round((Sal1*2)+128);

ykb=zeros(256);
i=1;
fidb=fopen('output.txt','r');
while(!feof(fidb))
   Output=fscanf(fidb,"%s\n","C");
   ykb(i)=pf2dec(Output,0,1);
   i=i+1;
   end
fclose(fidb);

%subplot(3,1,1),plot(T(1:200),yk(1:200), 'LineWidth',2);
%title('Entrada');
%subplot(3,1,2),plot(T(1:200),ykb(1:200),'LineWidth',2);
%title('Salida IPD');
%subplot(3,1,3),plot(T(1:200),Sal(1:200),'LineWidth',2);
%title('Salida Ideal');

plot(T(1:50),yk(1:50));
hold on
%plot(T(1:50),ykb(1:50));
%hold on
plot(T(1:50),Sal(1:50));
