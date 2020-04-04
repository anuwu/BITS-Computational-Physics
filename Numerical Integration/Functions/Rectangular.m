%Self explanatory. Read the notes to understand the loop

function [val] = NumIntFixed (f , a , b , n)

h = (b - a)/n ;
i = 0 ;
val = 0 ;

while i < n 
    val = val + h*f(a + i*h) ;
    i = i + 1 ;
end 


    
