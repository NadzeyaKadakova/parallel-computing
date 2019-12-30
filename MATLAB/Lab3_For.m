D = randi(100,n,m);
E = randi(100,m,n);
F = zeros(n,m);
tic
for i = 1:n
    for j = 1:m
  F(i,j) = dot(D(i,:),E(:,j));  
    end
end
toc