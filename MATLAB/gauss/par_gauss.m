function U=par_gauss(A) 
[M N]=size(A);
r=0;s=0;
while r==0 s=s+1; % ???????
if labindex==1
[m n]=size(A); % ?????? ???????
% ?? ?????? ???????? ??????? A ???????????,
% ??????????? ? ???????,
% ??????????? ?? ?????????, ??????????? ????????
qq=mod(m,numlabs); % ??????? ?? ???????
for otherLab = 2:numlabs
% ???????? ??????????????? ????? ??????? ?
labSend(qq,otherLab,6); % ??????? ?? ???????
[Asend q r]=par_getslice(A,otherLab,numlabs);
labSend(Asend,otherLab,3);
end
[A q r]=par_getslice(A,labindex,numlabs);
% ?????? ??????? ???? ???? ??????? A
[m n]=size(A);
for i=1:m
% ?????? ???? ???????? ?????????? ? ???????
% ? ??????????????????? ????
A(i,:)=A(i,:)/A(i,i);
% ?????? A(i,:) ?????? ???? ?????????? ???? ???????
for otherLab = 2:numlabs
labSend(A(i,:),otherLab,1);% ??????
labSend(i,otherLab,2); % ????? ??????
end
% ????????? ??????? ????????? ??? ????????? A(i,i)
for k=i+1:m
A(k,:)=A(i,:)*A(k,i)-A(k,:);
end
end
% A - ?????????????????? ??????????,
% ??????????? ????????
if s==1 % ?????? ???
U=A;
else
U=[U;zeros(m,N-n) A];
end
% ??????? ????? ??????? A, ?????? ??????????
% ??????? ????????? ??????????????? ???????
A=[];
for otherLab = 2:numlabs
Arecive=labReceive(otherLab,4);
A=[A;Arecive];
end
if (r==1 && qq==0)
U=[U;zeros(1,N-r) 1];
end
else
A=labReceive(1,3); % ??????????
q=labReceive(1,6); %
[m n]=size(A);
r=m;
for i=1:m+q
Arow=labReceive(1,1); %??????
j=labReceive(1,2); %??????
for k=1:m
A(k,:)=Arow*A(k,j)-A(k,:);
end
end
A=A(:,j+1:n); % ???????? ??????? ????????
% ?????? ????????? ???????
labSend(A,1,4);
U=[];
end
end
end