%Self explanatory. Read notes to understand the code.

function [val] = TraepezoidalFirstOrder (f , a , b , n)

h = (b - a)/n ;
i = 1 ;
val = h/2 * (f(a) + f(b)) ;

while i < n 
    val = val + h*f(a + i*h) ;
    i = i + 1 ;
end 


    
