A = randi(100,n,m);
B = randi(100,m,n);
C = zeros(n,m);
tic
parfor i = 1:n
    for j = 1:m
  C(i,j) = dot(A(i,:),B(:,j));  
    end
end
toc