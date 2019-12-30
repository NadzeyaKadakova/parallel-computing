function [ t ] = MyFor(mA,mB )
tic;
mC=randi(1,length(mA(:,1)));
for i=1:length(mA(:,1))
    for j=1:length(mB(1,:))
    s=0;
       for k=1:length(mA(1,:))
       s=s+mA(i,k)*mB(k,j);
       end
      mC(i,j)=s;
    end    
end
t=toc;
end

