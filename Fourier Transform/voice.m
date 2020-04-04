recobj = audiorecorder ;
disp ('Start speaking') ;
recordblocking (recobj , 5) ;
disp('End of recording') ;
%play(recobj) ;
y = getaudiodata(recobj) ;

figure (1)
plot(y) ;
n = length(y) ;
fsft = (-n/2 : n/2-1)/5 ;
yy = fft(y) ;

figure(2) ;
plot(fsft, abs(fftshift(yy))) ;


%{

I(u) = 16 * a^2 * cos^2(2*pi*u*a) * sinc^2(2*pi*u*a) ;
a = 0.5 ;
b = 2 ;


%}