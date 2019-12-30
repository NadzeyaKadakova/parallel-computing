n=1000;
m=500;
spmd
    B=randi(100,m,n);
    X=randi(100,n,m);
    codistr = codistributor1d(1,[n/4 n/4 n/4 n/4]);
    C = codistributed(X,codistr);
    C =C*B;
end
M=gather(C);