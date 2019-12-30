N=4;
n=N/2;
Wn = rand;
spmd
    
    for j =1:N
    for i=1:n
        t=0;
        if mod(labindex,2)==0
            t=n;
        end            
    A(j,i)=Wn^(i*(j+t));
    end
    end
    if mod(labindex,2)~=0
        A([1:N],1)=1;
    end
     A(1,[1:n]) = 1;
     A     
end
M=gather(S)

