function [val] =  TrapNOrder (f , a , b , n , order)


if order == 0
    val = 0 ;
else
    val = TrapNOrder (f , a , b , n , order - 1) ;
    
    h = (b-a)/n ;
    corr = 0 ;
   
    if order == 1
        corr = (h/2) * (f(a) + f(b)) ;
        i = 1 ;
        while i < n
            corr = corr + h*f(a + i*h) ;
            i = i + 1 ;
        end
        
    else
        disp(['Enter the derivative of order ' , num2str(order-1)]) ;
        str = input('' , 's') ;
        der = inline (str , 'x') ;
        i = 0 ;
        while i < n
            corr = corr + der(a + i*h) - ((-1)^order)*der(a + (i+1)*h) ;
            i = i + 1 ;  
        end
        
        corr = corr * (h^order)/(2*factorial(order)) ;
           
    end
    
    val = val + corr ;
    
end
   
end 