function [c] = BisectionAbs(func,a,b,eps) 
    c = (a+b)/2 ;       %Initial guess
    i = 1 ;
    
    while abs(func(c)) >= eps
       if sign(func(a)) ~= sign(func(c))        
           b = c ;  %Root lies in left half
       else
           if sign(func(c)) ~= sign(func(b))
               a = c ;  %Root lies in right half
           end
       end
       i = i+1 ;
        
      c = (a+b)/2 ;
    end
    
end