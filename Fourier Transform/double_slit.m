a = input('Enter the width of the slit\n') ;
b = input('Enter the separation\n') ;

it = 1 ;
for y = -10:0.1:-(a+b/2+0.1)
    f(it) = 0 ;
    it = it + 1 ;
end

for y = -(a+b/2):0.1:(-b/2)
    f(it) = 1 ;
    it = it +1 ;
end

for y = -(b/2-0.1):0.1:(b/2-0.1)
    f(it) = 0 ;
    it = it + 1 ;
end

for y = b/2:0.1:b/2+a
   f(it) = 1 ;
   it = it + 1 ;
end

for y = (b/2+a+0.1):0.1:10
    f(it) = 0 ;
    it = it + 1 ;
end

y_f = fft(f) ;
absy_f = abs(fftshift(y_f)) ;
norm_f = absy_f/max(absy_f) ;
u = -10:0.1:10 ;

plot (u , norm_f) ;
