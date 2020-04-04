eps = 2 ;
k = 1 ;
a = 3 ;

v_der = @(x) -k*x^a ;
x_der = @(v) v ;

x(1) = 0 ;
v(1) = 0.5 ;
time(1) = 0 ;
h = 0.01 ;

it = 1 ;

for t = 0 : h : 150 - h 
    x_start = x(it) ;
    v_start = v(it) ;
    x_end = x_start + h*x_der(v_start) ;
    v_end = v_start + h*v_der(x_start) ;
 
    %x(it+1) = x_end ;
    %v(it+1) = v_end ;
    
    x(it + 1) = x(it) + h/2 * (x_der(v_start) + x_der(v_end)) ;
    v(it + 1) = v(it) + h/2 * (v_der(x_start) + v_der(x_end)) ;
    
    it = it + 1 ;
    time(it) = t + h ;
end

figure ('Name' , 'Time Plot') ;
hold on ;
plot (time , x , 'bo') ;
plot (time , v , 'r*') ;
hold off ;

figure ('Name' , 'Phase Space') ;
hold on ;
plot (x , v) ;

fourier = fft(x) ;
abs_fourier = abs(fftshift(fourier)) ;
norm_fourier = abs_fourier/max(abs_fourier) ;
figure ('Name' , 'Fourier Transform') ;
plot (time , norm_fourier) ;

