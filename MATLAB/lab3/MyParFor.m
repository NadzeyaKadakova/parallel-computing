function [ t ] = MyParFor( mA,mB )
tic;
mC=zeros(length(mA(:,1)),length(mB(1,:)));
I=length(mA(:,1));
J=length(mB(1,:));
K=length(mA(1,:));
parfor i=1:I
    for j=1:J   
       for k=1:K
       mC(i,j)=mC(i,j)+mA(i,k)*mB(k,j);
       end
    end    
end
t=toc;
end
