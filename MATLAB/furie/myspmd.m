tic;
N=1000;
x=transpose(linspace(0,2*pi,N));
W=zeros(N);
spmd
    
    codistr = codistributor1d(1,[N/4 N/4 N/4 N/4]);
    C = codistributed(W,codistr);
    
    
   for i=1:N/4
       for j=1:N
      W(i,j)=exp(-2*sqrt(-1)*pi/N)^((i+(labindex-1)*N/4-1)*(j-1));
       end
   end   
   
   
end
M=gather(C);
t=toc
res3=fft(x);