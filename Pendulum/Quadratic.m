%AKA Simpson's 1/3 Rule. Check formula for N points in my notes. Pretty
%self explanatory.


function [val] = Quadratic (f , a , b , n)      %n should be a multiple of 2.

h = (b - a)/n ;
i = 1 ;
val = h/3 * (f(a) + f(b)) ;     %look at formula

while i < n 
    if mod(i,2) == 0
        val = val + (2*h/3)*f(a+i*h) ;      %Even indices
    else
        val = val + (4*h/3)*f(a+i*h) ;      %Odd indices
    end
    
     i = i + 1 ;   
end
