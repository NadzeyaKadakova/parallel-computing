function R = FFT(t,f)
tic
R = fft(f,length(t));
toc
