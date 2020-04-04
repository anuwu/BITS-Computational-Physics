B = 0.001 ;
m = 0.5 ;
g = 32 ;
S = 10^-4 ;
w = 60*pi ;

vx_der = @(vx) -(B/m)*vx ;
x_der = @(vx) vx ;

vy_der = -g ;
y_der = @(vy) vy ;

vz_der = @(vx) +(S*w)*vx ;
z_der = @(vz) vz ;

x(1) = 0 ;
z(1) = 0 ;
y(1) = 4 ;
vx(1) = 147 ;
vy(1) = 0 ;
vz(1) = 0 ;
time(1) = 0 ;

it = 1 ;
h = 0.01 ;
for t = 0:h:0.49
    x(it + 1) = x(it) + h*x_der(vx(it)) ;
    vx(it + 1) = vx(it) + h*vx_der(vx(it)) ;
    
    y(it + 1) = y(it) + h*y_der(vy(it)) ;
    vy(it + 1) = vy(it) + h*vy_der ;
    
    z(it + 1) = z(it) + h*z_der(vz(it)) ;
    vz(it + 1) = vz(it) + h*vz_der(vx(it)) ;
    
    it = it + 1 ;
    time(it) = t + h ;
end

figure ('Name' , 'Time Plot of Positions') ;
hold on 
%plot (time , x , 'bo') ;
plot (time , y , 'ro') ;
plot (time , z , 'go') ;
hold off

figure ('Name' , 'Time Plot of Velocities') ;
hold on
%plot (time , vx , 'bo') ;
plot (time , vy , 'ro') ;
plot (time , vz , 'go') ;

figure ('Name' , 'X-Plot') ;
hold on
plot (x , y , 'ro') ;
plot (x , z , 'go') ;
hold off 

%figure ('Name' , '3-D plot') ;
%plot3 (x,y,z) 