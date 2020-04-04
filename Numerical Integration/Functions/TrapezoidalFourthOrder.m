function [val] = TraepezoidalFourthOrder (f , df1 , df2 , df3 , a , b , n)

h = (b - a)/n ;
i = 1 ;
val = TrapezoidalThirdOrder (f , df1 , df2 , a , b , n) ;
val = val + (h^4)/48 * (df3(a) - df3(b)) ;

end 



    
