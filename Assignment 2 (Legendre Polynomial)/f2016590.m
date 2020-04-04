%I have exhaustively found all the roots using the hybrid method in the range [0,1].

f = @(x) 1/128 * (6345*x^8 - 12012*x^6 + 6930*x^4 - 1260*x^2 + 35) ;        %8th Legendre Polynomial
df = @(x) 1/128 * (6345*8*x^7 - 12012*6*x^5 + 6930*4*x^3 - 1260*2*x) ;      %Its derivative

eps = input ('Enter the tolerance\n') ;     
cnt = 0 ;   
step = 0.1 ;

for i = 0 : step : 1     %0.1 is the step size for exhaustive search

    if f(i) * f(i+step) < 0    %root exists in the range 
        cnt = cnt + 1 ;
     
        a = i ;     %Left end of bracket
        b = i + step ;      %Right end of bracket
        c_old = a ;

        test_raph = c_old - f(c_old)/df(c_old) ;    %Next iteration value of newton raphson
        if test_raph > a && test_raph < b           %Iteration value falls in bracket
            c_new = test_raph ;

        else        %Iteration value does not fall in bracket. Define new bracket
            c_new = (a + b)/2 ;
            if sign(f(c_new)) ~= sign(f(a))
              b = c_new ;       %Left interval
            else
                a = c_new ;     %Right interval
            end
        end

        rat = abs((c_new - c_old)/c_old) ;      %Defining ratio of convergence

        while rat > eps     %Tolerance condition
            c_old = c_new ;
            test_raph = c_old - f(c_old)/df(c_old) ;    %Next iteration value of newton raphson

            if test_raph > a && test_raph < b           %Iteration value falls in bracket
                c_new = test_raph ;

            else
                c_new = (a + b)/2 ;
                if sign(f(c_new)) ~= sign(f(a))
                    b = c_new ;     %Left interval
                else
                    a = c_new ;     %Right interval
                end
            end
            rat = abs((c_new - c_old)/c_old) ;      %Defining ratio of convergence
        end
        
        roots(cnt) = c_new ;        %Storing root in an array    
    end
end

disp(['The roots found are - ']) ;
for i = 1 : 1 : cnt
   disp([num2str(roots(i))]) ;
        
end      