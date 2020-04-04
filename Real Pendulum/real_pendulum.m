g = 9.8 ;
m = input('Enter the mass of the bob\n');
l = input('Enter the length of the pendulum\n') ;

th(1) = input('Enter the starting angle\n') ;
th_plot(1) = th(1) ;
th(1) = th(1) * (pi/180) ;
w(1) = input('Enter the starting angular velocity\n') ;
w(1) = w(1) * (pi/180) ;
pth(1) = m*(l^2)*w(1) ;
T(1) = (1/2)*m*(l^2)*(w(1))^2 ;
V(1) = -m*g*l*cos(th(1)) ;
E(1) = T(1) + V(1) ;

w_der = @(th) -(g/l)*sin(th) ;
th_der = @(w) w ;

h=0.01 ;
it = 1 ;


plot_fig = figure('Name' , 'Plots');
phase_fig = figure('Name' , 'Phase Space') ;
energy_fig = figure ('Name' , 'Energy plot') ;
figure ('Name' , 'Animation') ;
for t=0:h:5
    th_start = th(it) ;
    th_end = th(it) + h*th_der(w(it)) ;
    w_start = w(it) ;
    w_end = w(it) + h*w_der(th(it)) ;
    mw_1 = w_der(th_start) ;
    mw_2 = w_der(th_end) ;
    mth_1 = th_der(w_start) ;
    mth_2 = th_der(w_end) ;
    
    th(it+1) = th(it) + h/2 * (mth_1 + mth_2) ;
    w(it+1) = w(it) + h/2 * (mw_1 + mw_2) ;
    
    it = it + 1 ;
    time(it) = t + h ;
    
    pth(it) = m*(l^2)*w(it) ;
    T(it) = (1/2)*m*(l^2)*(w(it))^2 ;
    V(it) = -m*g*l*cos(th(it)) ;
    E(it) = T(it) + V(it) ;
    if th(it)*(180/pi) > 360
        th_plot(it) = mod(th(it)*(180/pi) , 360) 
    else
        th_plot(it) = th(it)*(180/pi);
    end
    
    plot(0,0,'o') ;
    hold on 
    plot(l*sin(th(it)) , -l*cos(th(it)) , 'o') ;
    plot([0,l*sin(th(it))] , [0 , -l*cos(th(it))]) ;
    grid on ;
    hold off
    
    xlabel (['X Time = ' , num2str(t) , 's']) ;
    ylabel ('Y') ;
    xlim([-(l+2) , (l+2)]) ;
    ylim([-(l+2) , (l+2)]) ;
    
    drawnow ;
end

figure (plot_fig) ;
subplot (2 , 2 , 1) ;
plot(time , th_plot) ;
title('Time plot of Angle') ;
xlabel('Time') ;
ylabel('Angle (degrees)') ;
grid on ;

subplot (2 ,2 , 2) ;
plot(time , w*(180/pi)) ;
title('Time plot of Angular Velocity') ;
xlabel ('Time') ;
ylabel ('Angular Velocity (degrees per second)') ;
grid on ;

subplot (2 ,2 , 3) ;
plot(time , pth) ;
title('Time plot of Angular Momentum') ;
xlabel ('Time') ;
ylabel ('Angular Momentum') ;
grid on ;

figure (phase_fig) ;
subplot (1, 2 , 1) ;
plot(th_plot , w * (180/pi)) ;
title ('Phase Space') ;
xlabel('Angle (degrees)') ;
ylabel('Angular Velocity (degrees per second)') ;
grid on ;

subplot (1, 2 , 2) ;
plot(th_plot , pth) ;
title ('Phase Space') ;
xlabel('Angle (degrees)') ;
ylabel('Angular Momentum') ;
grid on ;

figure (energy_fig) ;
subplot (2,2,1) ;
plot (time , T) ;
title ('Kinetic Energy vs. Time') ;
xlabel ('Time') ;
ylabel ('Kinetic Energy') ;
grid on ;

subplot (2,2,2) ;
plot (time , V) ;
title ('Potential Energy vs. Time') ;
xlabel ('Time') ;
ylabel ('Potential Energy') ;
grid on ;

subplot (2,2,3) ;
plot (time , E) ;
title ('Total Energy vs. Time') ;
xlabel ('Time') ;
ylabel ('Total Energy') ;
grid on ;