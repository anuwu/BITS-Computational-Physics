%Same procedure as in the ExhaustiveBisection method.

function [cnt , roots] = ExhaustiveHybrid (f , df , a , b , step , eps)     %Returns number of roots and an array of roots.
    cnt = 0 ;   %Assume that no roots have been found initially

    if f(a) == 0        %If the left end of the mega interval is a root
            cnt = cnt + 1 ;
            roots(cnt) = a ;     
    end
    
    if f(b) == 0        %If the right end of the very large interval is a root
        cnt = cnt + 1 ;
        roots(cnt) = b ;
    end

    for i = a+step : step : (b-step)    %Since 'a' and 'b' have been dealt with, the loop starts from (a+step) and ends at (b-step)

        if f(i) == 0    
            cnt = cnt + 1 ;
            roots(cnt) = i ;

        else if (f(i) * f(i+step)) < 0      %Checking for sign difference at endpoints. Meaning that a root exists between them and bisection technique is GUARANTEED to give a result
            cnt = cnt + 1 ; 
            roots(cnt) = Hybrid(f , df , i , i+step , eps) ;      %Check out the function file. I've used absolute tolerance bisection method.

            end

        end
    end

end