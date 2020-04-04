%The crux of the regular newton-raphson method is that we identify an
%interval where it is guaranteed that every iteration value of NR method
%will lie. However, that may not be the case everytime. 

%At the beginning, we start off with an arbitrary interval and use the left
%end as the first iteration value of NR. We continue doing NR until we find
%the root. However, if one NR iterates to a value outside the arbitrary
%interval, we apply bisection method once. We identify the middle point and then
%redefine the interval (left or right half) based on the sign of the
%function (as usual). Once the middle point is identified and new interval
%defined, we restart NR with the middle point being the first input to the
%NR algorithm.

%If you remember, NR does not work if the interval where the root lies ALSO
%contains a point of extrema. The flatness of the curve near the extrema might cause a NR iteration value to explode away (since the tangent
%will be flat around an extrema). This is the advantage of the hybrid
%method. It will guarantee that the root is found regardless of extrema
%points

%The final iteration of the process is the root and it will always
%correspond to a NR step and not a bisection step. Note that it is actually
%NR which gets you close to the root, bisection only helps to prevent NR
%from exploding away.

%It's like yin and yang...

function [c_new] = Hybrid (f , df , a , b , eps)        %The final root will be contained in c_new and hence that is returned.

    c_old = a ;     %First iterate is left end of interval
    
    test_raph = c_old - f(c_old)/df(c_old) ;    %Assuming NR iterate falls in range. This is the second 'potential' iterate.
    if test_raph > a && test_raph < b       %Checking if falls in range
        c_new = test_raph ;     %Accepting NR iterate as the new legitimate iterate.
    else                        %Doesn't fall in range
        c_new = (a + b)/2 ;     %Middle point
        if sign(f(c_new)) ~= sign(f(a))
            b = c_new ;     %Left half
        else
            a = c_new ;     %Right half
        end
    end
    
    rat = abs((c_new - c_old)/c_old) ;      %Using ratio tolerance
    
    while rat > eps         
        c_old = c_new ;     %Important step. To propagate the changing iterate values and ratios. If you notice, the code below this is basically a copy of the code written above.
        test_raph = c_old - f(c_old)/df(c_old) ;        %Testing for NR.

        if test_raph > a && test_raph < b       %Checking if falls in range
            c_new = test_raph ;     %Accepting
        else                        %Not in range
            c_new = (a + b)/2 ;     %Middle point       
            if sign(f(c_new)) ~= sign(f(a))
                b = c_new ;         %Left half
            else
                a = c_new ;         %Right half
            end
            
        end
        rat = abs((c_new - c_old)/c_old) ;      %Ratio tolerance
    end
end