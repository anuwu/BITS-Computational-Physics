function [val] = Monte (f , a , b , n)

val = 0 ;
for i = 1 : 1 : n
    val = val + f(a + (b-a)*rand) ;     %Rand generates from 0 to 1. Hence multiplying by length of interval so as to get a random point within the interval.
end
    
val = val*(b-a)/n ;
end 