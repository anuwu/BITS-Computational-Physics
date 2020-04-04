function [c_new,x,y] = RatTolRoot(func,a,b,eps) 
    c_old = (a+b)/2 ;   %Initial guess
  
    if sign(func(a)) ~= sign(func(c_old))   
           b = c_old ;  %root lies in the left half
       else
           if sign(func(c_old)) ~= sign(func(b))    
               a = c_old ;  %root lies in the right half
           end
    end
       
    c_new = (a+b)/2 ;   %First guess
    rat = abs(c_new - c_old)/abs(c_old) ;   %finding the ratio
    
    i = 1 ;
    x(i) = i ;  %Inputting the number of interation in an array called x
    y(i) = rat ;    %Inputting the ratios in an array called y
    
    while rat >= eps
        
      c_old = c_new ;  %Swapping of variables required for next iteration
        
      if sign(func(a)) ~= sign(func(c_old))   
           b = c_old ;  %root lies in the left half
       else
           if sign(func(c_old)) ~= sign(func(b))    
               a = c_old ;  %root lies in the right half
           end
        end
       
       c_new = (a+b)/2 ;
       rat = abs(c_new - c_old)/abs(c_old) ;    
       
       i = i+1 ;
       x(i) = i ;
       y(i) = rat ;
    
    end
    
    %When the loop ends, the final root will be stored in c_new
end