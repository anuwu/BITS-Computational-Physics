%AKA Simpson's 3/8 Rule. Check formula for N points in my notes. Pretty
%self explanatory.

function [val] = Cubic(f , a , b , n)   %n should be a MULTIPLE of 3.

h = (b - a)/n ;
i = 1 ;
val = 3*h/8 * (f(a) + f(b)) ;

while i < n 
    if mod(i,3) == 1 || mod(i,3) == 2       
        val = val + (9*h/8)*f(a+i*h) ;      
    else
        val = val + (6*h/8)*f(a+i*h) ;   
    end
    
     i = i + 1 ;   
end
