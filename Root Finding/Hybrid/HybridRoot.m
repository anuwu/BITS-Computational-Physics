%Easy and trivial. (r u triggered?)
%OH MY GOD (raise hand)!!! WHAT ARE YOU DOING? DON'T YOU KNOW LAPLACE
%TRANSFORM? SCHRODINGER's CAT???????

str = input('Enter the function\n' , 's') ;
f = inline (str , 'x') ;

str = input('Enter the derivative of the function\n' , 's') ;
df = inline (str , 'x') ;

a = input ('Enter the start point of search\n') ;      
b = input ('Enter the end point of search\n') ;

eps = input ('Enter the tolerance\n') ;

val = Hybrid(f , df , a , b , eps) ;
disp(['The value of the root = ' , num2str(val)]) ;