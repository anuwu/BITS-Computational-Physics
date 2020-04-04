function [c,x,y] = AbsTolRoot(func,a,b,eps) 
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
        
       x(i) = i ;       %Storing iterations in array x
       y(i) = abs(func(c)) ;        %Storing the value of the function at the present iteration
       i = i+1 ;
        
      c = (a+b)/2 ;
    end
    
end