function Sal=I_PD(ykn,ref)
n=length(ykn);
yk=ykn;
yk1=0;
ik1=0;
Sal=zeros(1,n);
for i=1:n
    pk=18*yk(i);
    ek=ref-yk(i);
    i1=7*ek+ik1;
     if(i1>63)
      ik=63;
    elseif(i1<-64)
      ik=-64;
    else
      ik=i1;
    end
    dk=150*(yk(i)-yk1);
    %Sal(i)=(ik-pk-dk);
    dal1=(ik-pk);
    if(dal1>63)
      sal1=63;
    elseif(dal1<-64)
      sal1=-64;
    else
      sal1=dal1;
    end
    dal=(sal1-dk);
    if(dal>63)
      Sal(i)=63;
    elseif(dal<-64)
      Sal(i)=-64;
    else
      Sal(i)=dal;
    end
    %disp(Sal(i));
    yk1=yk(i);
    ik1=ik;
end
end
%Sal(i)=(ik-pk-dk);