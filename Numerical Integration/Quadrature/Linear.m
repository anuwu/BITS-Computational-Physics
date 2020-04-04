%This is same as first order trapezoidal. Check formula for N points in my
%notes.

function [val] = Linear (f , a , b , n)     %only f is needed. n can be any integer.

h = (b - a)/n ;
i = 1 ;
val = h/2 * (f(a) + f(b)) ;     %look at the formula

while i < n 
    val = val + h*f(a + i*h) ;      %Summing all points in between
    i = i + 1 ;
end 


    
