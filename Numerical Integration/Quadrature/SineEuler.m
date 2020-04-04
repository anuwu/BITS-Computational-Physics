f = @(x) sin(x) ;
df1 = @(x) cos(x) ;
df3 = @(x) -cos(x) ;
a = 0 ;
b = pi/2 ;

for i = 2 : 1 : 10      %Again. Check SineQuadrature for comments in this part.
   
    It(i-1) = i ;
    n(i-1) = 2^i ;
    FirstCorrInt(i-1) = EulerFirstCorr (f , df1 , a , b , n(i-1)) ;
    SecondCorrInt(i-1) = EulerSecondCorr (f , df1 , df3 , a , b , n(i-1)) ;
    
    disp(['i = ' , num2str(i)  ' First Corrected Integral = ' , num2str(FirstCorrInt(i-1)) , ' Second Corrected Integral = ' , num2str(SecondCorrInt(i-1))]) ;
end

figure ('Name', 'First Corrected Integral') ;
plot (It , FirstCorrInt) ;
xlabel('Power of 2') ;
ylabel('Integral value') ;

figure ('Name', 'Second Corrected Integral') ;
plot (It , SecondCorrInt) ;
xlabel('Power of 2') ;
ylabel('Integral value') ;

figure ('Name', 'All') ;
hold on
plot (It , FirstCorrInt, 'bo') ;
plot (It , SecondCorrInt , 'r*') ;
xlabel('Power of 2') ;
ylabel('Integral value') ;

