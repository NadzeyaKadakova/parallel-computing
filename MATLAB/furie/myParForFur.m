tic;
N=1000;
W=zeros(N);
W(1,:)=1;
W(:,1)=1;
x=transpose(linspace(0,2*pi,N));
res=transpose(linspace(0,1,N));
parfor i=2:N
    for j=2:N
        W(i,j)=exp(-2*sqrt(-1)*pi/N)^((i-1)*(j-1));
    end
end

parfor i=1:N
    s=0;
       for k=1:N
       s=s+W(i,k)*x(k,1);
       end
      res(i,1)=s;
end
t=toc
res1=fft(x);
