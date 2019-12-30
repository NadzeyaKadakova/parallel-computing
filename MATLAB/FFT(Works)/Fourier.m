t=0:0.01:5;
f=5+2*cos(2*pi*t-pi/4)+3*cos(4*pi*t);
k=f';
tic
n=size(f,2);
W=ones(n,n);
temp=exp(-1i*2*pi/n);

for i=0:n-1;
   W(2,i+1)=temp^i;
end

for i=2:n-1;
   W(i+1,:)=W(i,:).*W(2,:);
end

spmd
    u = codistributed(W, codistributor1d(1));  % by row
    h=u*k;
    
end
C1=gather(h);
toc
%%
tic
buildFFT=fft(f);
toc
%%
subplot(131),plot(t,f);
subplot(132),plot(t,real(C1));
subplot(133),plot(t,buildFFT);

