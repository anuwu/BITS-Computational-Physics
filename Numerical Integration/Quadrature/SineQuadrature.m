f = @(x) sin(x) ;
a = 0 ;
b = pi/2 ;

for i = 2 : 1 : 10      %Starting i from 2, because 2^2 = 4 and all subsequent POWERS are also MULTIPLES of 4. This is needed so that Quadratic() function also works from the very first iteration.
   
    It(i-1) = i ;       %Index of array starts from 1, hence (i-1)
    n(i-1) = 2^i ;      %Number of divisions of interval is a power of 2.
    m(i-1) = 3^(i-1) ;  %Number of divisions of interval is a power of 3.
    LinearInt(i-1) = Linear (f , a , b , n(i-1)) ;
    QuadraticInt(i-1) = Quadratic (f , a , b , n(i-1)) ;
    CubicInt(i-1) = Cubic (f , a , b , m(i-1)) ;
    QuarticInt(i-1) = Quartic (f , a , b , n(i-1)) ;
    
    %Displaying integral value for each iteration. Check the relative
    %changes at each step. It converges quickly.
    disp(['i = ' , num2str(i) , ' power of 2 = ' , num2str(n(i-1)) , ' power of 3 = ' , num2str(m(i-1)) , ' Linear = ' , num2str(LinearInt(i-1)) , ' Quadratic = ' , num2str(QuadraticInt(i-1)), ' Cubic = ' , num2str(CubicInt(i-1)), ' Quartic = ' , num2str(QuarticInt(i-1)) ]) ;
end

figure ('Name', 'Linear') ;     %Plot for linear integration value vs. no of division of interval
plot (It , LinearInt) ;
xlabel('Power of 2') ;
ylabel('Integral value') ;

figure ('Name', 'Quadratic') ;   %Plot for quadratic (simpson 1/3) integration value vs. no of division of interval
plot (It , QuadraticInt) ;
xlabel('Power of 2') ;
ylabel('Integral value') ;

figure ('Name', 'Cubic') ;   %Plot for cubic (simpson 3/8) integration value vs. no of division of interval
plot (It , CubicInt) ;
xlabel('Power of 3') ;
ylabel('Integral value') ;

figure ('Name', 'Quartic') ;     %Plot for quartic (boole's rule) vs. no of division of interval
plot (It , QuarticInt) ;
xlabel('Power of 2') ;
ylabel('Integral value') ;


figure ('Name', 'All') ;        %Comparing all of them at once.
hold on
plot (It , LinearInt, 'bo') ;      %blue o
plot (It , QuadraticInt , 'r*') ;   %red *
plot (It , CubicInt , 'kx') ;       %black x
plot (It , QuarticInt , 'c^') ;     %cyan ^
xlabel('Power of 2 or 3') ;
ylabel('Integral value') ;

