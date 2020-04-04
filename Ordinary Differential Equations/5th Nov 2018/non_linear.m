w = 0.25 ;
g = 9.8 ;
l = 9.8 ;
w0 = sqrt(g/l) ;
q = 1/2 ;
F = 1.44 ;

theta_der = @(u2) u2 ;
theta_dot_der = @(u1,u2,t) -(w0^2)*sin(u1) - q*u2 + F*cos(w*t) ;

theta_1(1) = pi/3 ;
theta_dot_1(1) = 0 ;
theta_2(1) = pi/3 + 0.01 ;
theta_dot_2(1) = 0 ;
del_theta(1) = 0.01 ;
max_del_theta(1) = 0.01 ;

time(1) = 0 ;
h = 0.01 ;

it = 1 ;

for t = 0 : h : 10-h
    theta_start_1 = theta_1(it) ;
    theta_dot_start_1 = theta_dot_1(it) ;
    theta_end = theta_start_1 + h*theta_der(theta_dot_start_1) ;
    theta_dot_end = theta_dot_start_1 + h*theta_dot_der(theta_start_1 , theta_dot_start_1 , t) ;
    
    theta_1(it + 1) = theta_1(it) + h/2 * (theta_der(theta_dot_start_1) + theta_der(theta_dot_end)) ;
    theta_dot_1(it + 1) = theta_dot_1(it) + h/2 * (theta_dot_der(theta_start_1, theta_dot_start_1,t) + theta_dot_der(theta_end, theta_dot_end,t+h)) ;
    
    theta_start_2 = theta_2(it) ;
    theta_dot_start_2 = theta_dot_2(it) ;
    theta_end = theta_start_2 + h*theta_der(theta_dot_start_2) ;
    theta_dot_end = theta_dot_start_2 + h*theta_dot_der(theta_start_2 , theta_dot_start_2 , t) ;
    
    theta_2(it + 1) = theta_2(it) + h/2 * (theta_der(theta_dot_start_2) + theta_der(theta_dot_end)) ;
    theta_dot_2(it + 1) = theta_dot_2(it) + h/2 * (theta_dot_der(theta_start_2, theta_dot_start_2,t) + theta_dot_der(theta_end, theta_dot_end,t+h)) ;
    
    it = it + 1 ;
    del_theta(it) = abs(theta_1(it) - theta_2(it)) ;
    max_del_theta(it) = max(del_theta) ;
    time(it) = t + h ;
    
end

    

%{
figure ('Name' , 'Time Plot') ;
hold on ;
plot (time , theta_1 , 'bo') ;
plot (time , theta_dot_1 , 'r*') ;
hold off ;
%}

%{
fourier = fft(theta_1) ;
f_shift = fftshift(fourier) ;
abs_f = abs(f_shift) ;
norm_f = abs_f/max(abs_f) ;

figure ('Name' , 'Frequency plot') ;
plot (time , norm_f) ;
%}

hold on ;
plot (time , del_theta , 'bo') ;
plot (time , max_del_theta , 'r*') ;
