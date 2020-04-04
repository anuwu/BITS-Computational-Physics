w = 2 ;
w0 = 1 ;
q = 1/2 ;
F = 0.5 ;

v_der = @(x,v,t) -(w0^2)*x - q*v + F*cos(w*t) ;
x_der = @(v) v ;

x(1) = 0.2 ;
v(1) = 0 ;
time(1) = 0 ;
h = 0.01 ;

it = 1 ;

for t = 0 : h : 25-h
    x_start = x(it) ;
    v_start = v(it) ;
    x_end = x_start + h*x_der(v_start) ;
    v_end = v_start + h*v_der(x_start , v_start , t) ;
    
    x(it + 1) = x(it) + h/2 * (x_der(v_start) + x_der(v_end)) ;
    v(it + 1) = v(it) + h/2 * (v_der(x_start, v_start,t) + v_der(x_end, v_end,t+h)) ;
    
    it = it + 1 ;
    time(it) = t + h ;
end

figure ('Name' , 'Time Plot') ;
hold on ;
plot (time , x , 'bo') ;
plot (time , v , 'r*') ;
hold off ;

figure ('Name' , 'Phase Space') ;
plot (x , v) ;

figure ('Name' , 'Phase Space with time') ;
plot3 (x , v , time) ;