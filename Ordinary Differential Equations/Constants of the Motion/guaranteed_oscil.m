m = 1;
k = 1;

v_der = @(x) -(k/m)*x ;
x_der = @(v) v ;
h = 0.1 ;

v(1) = 1 ;
x(1) = 0 ;
E = 1/2 * (m*(v(1))^2 + k*(x(1))^2) ;
time(1) = 0 ;

it = 1 ;
for t = 0 : h : 20-h 
    v_start = v(it) ;
    x_start = x(it) ;
    v_end = v_start + h*v_der(x_start) ;
    x_end = x_start + h*x_der(v_start) ;
    
    v(it + 1) = v(it) + h/2 * (v_der(x_start) + v_der(x_end)) ;
    x(it + 1) = x(it) + h/2 * (x_der(v_start) + x_der(v_end)) ;
    
    it = it + 1 ;
    time(it) = t + h ;
    
    v_test = sqrt(2/m*(E - k/2*(x(it)^2))) ;
    if v(it) < 0
        v(it) = -v_test ;
    else if v(it) > 0
        v(it) = v_test ;
        else if v(it) == 0
        v(it) = 0 ;
            end
        end
    end
    
end

hold on ;
plot (time , x , 'ro') ;
plot (time , v , 'b^') ;
