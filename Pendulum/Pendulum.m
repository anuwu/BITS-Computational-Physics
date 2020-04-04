%Check my notes for the theory behind it. Only then will you understand the
%code.

l = input('Enter the length of the pendulum\n') ;
g = 10 ;

i = 1 ;
for t=1:1:120       %Max pendulum angles ranges from 1 degree to 120 degree
    theta_deg(i) = t ;
    theta_rad(i) = t*pi/180 ;       %Converting to radian
    k(i) = sin(theta_rad(i)/2)^2 ;  %this is the parameter k is defined
    f = @(x) 1/sqrt(1 - ((k(i))^2)*(sin(x))^2) ;    %the function to be integrated depends on the value of k at each iteration
    time(i) = 4 * sqrt (l/g) * Quadratic (f , 0 , pi/2 , 1024) ;        %Integrating with 1024 points
    i = i + 1 ; 
end

figure ('Name' , 'Pendulum' , 'NumberTitle' , 'off') ;

subplot (2 , 1 , 1)  ;
plot (theta_deg , time , 'o') ;
xlabel ('Degrees') ;
ylabel ('Time') ;

subplot (2 , 1 , 2) ;
hold on
P = polyfit (k , time , 2) ;    %this command fits the time vs. k curve into a polynomial of degree 2
curve = polyval (P , k) ;       %this line associates the fitted curve P to the k-parameter
plot (k , time , 'o') ;         %plot k vs. time period
plot (k , curve) ;              %plotting the approx curve.
xlabel ('k') ;
ylabel ('Time') ;

