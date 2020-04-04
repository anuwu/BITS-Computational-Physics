f = @(y) y^2 + 1 ;

h = 1/100 ;
x0 = 0 ;
y0 = 0 ;

x(1) = x0 ;
y(1) = y0 ;


it = 1 ;
for i = 0 : h : 1-h
    y_start = f(y(it)) ;
    y_end = f(y(it) + h*f(y(it))) ;
    m = (y_start + y_end)/2 ;
    y(it+1) = y(it) + h*m ;
    x(it+1)= x(it)+h ;
    it = it+1 ;    
end

plot (x , y , 'o' , x , tan(x)) ;