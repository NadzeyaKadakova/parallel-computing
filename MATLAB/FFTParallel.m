function R = FFTParallel(t,f)
tic
k=f';
n=size(t,2);
W=ones(n,n);
temp=exp(-1i*2*pi/n);
for i=0:n-1;
   W(2,i+1)=temp^i;
end
for i=2:n-1;
   W(i+1,:)=W(i,:).*W(2,:);
end;
spmd
    wc = codistributed(W, codistributor1d(1));
    xk=wc*k;    
end
R=gather(xk);
toc