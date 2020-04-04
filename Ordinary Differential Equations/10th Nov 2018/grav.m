gms = 4*pi^2 ;
beta = 2 ;

vx_der = @(x,y) -gms*x/((x^2 + y^2)^((beta+1)/2))  ;
x_der = @(vx) vx ;

vy_der = @(x,y) -gms*y/((x^2 + y^2)^((beta+1)/2)) ;
y_der = @(vy) vy ;


x(1) = 1 ;
y(1) = 0 ;
vx(1) = 0 ;
vy(1) = 2*pi ;
time(1) = 0 ;

it = 1 ;
h = 0.001 ;
for t = 0:h:1
    x(it + 1) = x(it) + h/2*(x_der(vx(it)) + x_der(vx(it) + h*vx_der(x(it) , y(it)))) ;
    vx(it + 1) = vx(it) + h/2*(vx_der(x(it) , y(it)) + vx_der(x(it) + h*x_der(vx(it)) , y(it)+h*y_der(vy(it)))) ;
    
    y(it + 1) = y(it) + h/2*(y_der(vy(it)) + y_der(vy(it) + h*vy_der(x(it) , y(it)))) ;
    vy(it + 1) = vy(it) + h/2*(vy_der(x(it) , y(it)) + vy_der(x(it) + h*x_der(vx(it)) , y(it)+h*y_der(vy(it)))) ;
    
    it = it + 1 ;
    time(it) = t + h ;
end

figure ('Name' , 'Plot') ;
plot (x , y) ;
xlabel ('X') ;
ylabel ('Y') ;