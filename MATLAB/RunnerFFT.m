t=0:0.1:10;
f=4*sin(2*pi*t-pi/4)+3*cos(4*pi*t);
a1 = FFT(t,f);
a2 = FFTParallel(t,f);
a3 = a2';
a1==a3