%{
What the exhaustive method does is that it takes a mega interval,
divides it into multiple mini intervals and performs bisection in those
intervals. 

Note that the only two cases where the bisection method fails is when the
end points of the mega intervals are the roots itself. These two cases are
handled specially in two 'if' conditions

Exhaustive Bisection method ALSO fails when one of the endpoints of any of
the mini intervals is a root itself. This case has also been dealt with in
the loop.
%}

function [cnt , roots] = Exhaustive (f , a , b , step , eps) 

%{
'a' and 'b' are the ends of the very large interval I mentioned
above. 'step' is the length of each mini interval where bisection will be
performed
%}

    cnt = 0 ;   %Assume that no roots have been found initially

    if f(a) == 0        %If the left end of the very large interval is a root
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
        roots(cnt) = BisectionAbs(f , i , i+step , eps) ;      %Check out the function file. I've used absolute tolerance bisection method.

        end

        end
    end

end