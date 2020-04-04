function [it , area , rat] = TrapezoidalFourthOrderVarIteration (f , df1 , df2 , df3 , a , b , eps)
    
i = 1 ;
it(i) = i ;
area(i) = TrapezoidalFourthOrder (f , df1 , df2 , df3 , a , b , i) ;
rat(i) = 0 ;    %first ratio is defined to be zero

i = i + 1 ;
it(i) = i ;
area(i) = TrapezoidalFourthOrder (f , df1 , df2 , df3 , a , b , i) ;
rat(i) = abs((area(i) - area(i-1))/area(i-1)) ;

while rat(i) > eps
    i = i + 1 ;
    it(i) = i ;
    area(i) = TrapezoidalFourthOrder (f , df1 , df2 , df3 , a , b , i) ;
    rat(i) = abs((area(i) - area(i-1))/area(i-1)) ;
end 
    


