%%parpool('local',2)
n=1000;
m=1000;
A=randi(100,n,m);
B=randi(100,m,n);
C=zeros(n,m);
index=[1:n/2;n/2+1:n];
tic
spmd
    codistrRow = codistributor1d(1,[n/2,n/2]);
    codistrColumn = codistributor1d(2,[n/2,n/2]);
    
    u = codistributed(A, codistrRow);
    v = codistributed(B, codistrColumn);  
    r= codistributed(C, codistrRow) ;
    
    temp=getLocalPart(v);
    r(index(labindex,:),index(labindex,:)) = getLocalPart(u)*temp;
  
    temp=labSendReceive(mod(labindex,2)+1,3-labindex,getLocalPart(v)); 
    r(index(labindex,:),index(mod(labindex,2)+1,:))=getLocalPart(u)*temp;
end
C=gather(r);
toc
A*B;