function [A q r]=par_getslice(A,labindex,numlabs)
[n n]=size(A); % ?????? ???????
q=mod(n,numlabs);% ??????? ?? ???????
if q==0 % ??????? ??? ???????
r=n/numlabs; A=A((labindex-1)*r+1:labindex*r,:);
else % ??????? ? ????????
r=(n-q)/numlabs;
if labindex==1
A=A(1:r+q,:);
else
A=A((labindex-1)*r+1+q:labindex*r+q,:);
end
end