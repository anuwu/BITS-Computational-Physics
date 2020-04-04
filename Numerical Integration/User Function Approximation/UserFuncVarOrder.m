str = input('Enter the user defined function\n' , 's') ;
disp([' ']) ;
f = inline (str , 'x') ;

a = input('Enter the lower limit of integration\n') ;
b = input('Enter the upper limit of integration\n') ;
n = input('Enter the number of divisions of interval\n') ;
order = input('Enter the order of approximation\n') ;

val = TrapNOrder (f , a , b , n ,order) ;
disp (['The value of the integral = ' , num2str(val)]) ;