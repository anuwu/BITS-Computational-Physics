f = @(x) cos(x^2) - x ;
d1 = @(x) -sin(x^2)*(2*x) - 1       %derivative

a = input ('Enter the guess root\n') ;
eps = input ('Enter the tolerance\n') ;

i = 1 ;
it(i) = i ;     %Storing the number of iterations in an array
x(i) = a ;      %Storing the roots of the iteration

x(i+1) = x(i) - f(x(i))/d1(x(i)) ;      %Iterative equation

while abs(x(i+1) - x(i)) >= eps
    i = i + 1 ;
    it(i) = i ;
    x(i+1) = x(i) - f(x(i))/d1(x(i)) ;
   
end 

i = i + 1 ;
it(i) = i ;

disp (['The root of the equation = ' , num2str(x(i)) ]) ;
disp (['The number of iterations = ' , num2str(i)]) ;
plot (it , x) ;
    