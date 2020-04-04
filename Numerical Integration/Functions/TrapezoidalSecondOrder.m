%Again, self explanatory. Read notes to understand the loop.

function [val] = TraepezoidalSecondOrder (f , df1 , a , b , n)

h = (b - a)/n ;
val = TrapezoidalFirstOrder (f , a , b , n) ;       %I'm trying to save lines of code by calling an already readymade function.
val = val + (h^2)/4 * (df1(a) - df1(b)) ;

end 

    
