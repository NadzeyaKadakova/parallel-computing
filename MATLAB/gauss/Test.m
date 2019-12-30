A = rand(700,700);
tic
r1 = gauss(A);
toc
tic
r2 = par_gauss(A);
toc