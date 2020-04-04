a = 0 ;
b = pi/2 ;
N = 30 ;    %Sir had given a formula to calculate this N. I used this and ran a for loop.



f = @(x) cos(x) - x ;

for i = 1:N
  
    c = (a+b)/2 ;
    
    x(i) = i ;
    y(i) = abs(f(c)) ;
    
    if sign(f(a)) ~= sign(f(c))
        b = c ;
    else
        if sign(f(c)) ~= sign(f(b))
            a = c ;
        end
    end
    
    
end

disp (['The value of the root is ' , num2str(c)]) ;
plot (x,y) ;        %Plotting iteration versus value of function