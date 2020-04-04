%Searching for a root between 'a' and 'b' as defined below

eps = 10^-5 ;
a = 0 ;
b = 0.25 ;
legendre = @(x) 1/128 * (6345*x^8 - 12012*x^6 + 6930*x^4 - 1260*x^2 + 35) ;        
dlegendre = @(x) 1/128 * (6345*8*x^7 - 12012*6*x^5 + 6930*4*x^3 - 1260*2*x) ; 
x_prev = a ;
x_next = x_prev - legendre(x_prev)/dlegendre(x_prev) ;

if x_next <= a | x_next >= b    %Newton raphson iteration falls out of range
    %Bisection code
    x_next = (a + b)/2 ;
    if legendre(x_next)*legendre(a) < 0
        b = x_next ;
    else if legendre(x_next)*legendre(b) < 0
        a = x_next ; 
    end
    end
end
    
rat = abs((x_next - x_prev)/x_prev) ;   %Using ratio tolerance
    
while rat > eps     
    x_prev = x_next ;
    x_next = x_prev - legendre(x_prev)/dlegendre(x_prev) ;

    if x_next <= a | x_next >= b     %Newton raphson iteration falls out of range
        %Bisection code
        x_next = (a + b)/2 ;
        if legendre(x_next)*legendre(a) < 0
            b = x_next ;
        else if legendre(x_next)*legendre(b) < 0
            a = x_next ; 
        end
        end
    end
    
    rat = abs((x_next - x_prev)/x_prev) ;
end 

disp(['The root = ' , num2str(x_next)]) ;