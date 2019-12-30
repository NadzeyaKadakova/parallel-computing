n=1000;
m=500;
tic
X=randi(100,n,m);
spmd
    B=randi(100,m,n);
    codistr = codistributor1d(1,[n/2,n/2]);
    C = codistributed(X,codistr);
    C =C*B;
end
M=gather(C)
toc