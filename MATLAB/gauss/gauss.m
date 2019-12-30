function A=gauss(A)
[m n]=size(A);
for i=1:n
A(i,:)=A(i,:)/A(i,i);
for k=i+1:n
A(k,:)=A(i,:)*A(k,i)-A(k,:);
end
end