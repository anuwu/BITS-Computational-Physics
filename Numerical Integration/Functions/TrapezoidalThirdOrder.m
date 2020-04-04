function [val] = TraepezoidalThirdOrder (f , df1 , df2 , a , b , n)

h = (b - a)/n ;
i = 1 ;
val = TrapezoidalSecondOrder (f , df1 , a , b , n) ;
val = val + (h^3)/6 * (df2(a)/2 + df2(b)/2) ;

while i < n
    val = val + ((h^3)/6) * df2(a + i*h) ;
    i = i + 1 ;
end 


    
