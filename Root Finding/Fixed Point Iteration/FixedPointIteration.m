%You already read this code that day. Go through the process in your notes.

function [c,it,x] = FixedPointIteration(func, guess ,eps) 
   
    i = 1 ;
    it(i) = i ;
    x(i) = guess ;
    y = func(x(i)) ;
    
    while abs(y - x(i)) >= eps
        i = i + 1 ;
        x(i) = y ;
        it(i) = i ;
        y = func(x(i)) ;
        
    end
    
    c = x(i) ;
   
end