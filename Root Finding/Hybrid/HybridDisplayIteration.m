%The code here is the same as in the Hybrid.m folder. Except, I have chosen
%to explicitly print out each iteration step. 

function [c_new] = HybridDisplayIteration (f , df , a , b , eps)

   c_old = a ;
   i = 1 ;
   disp(['Iteration ' , num2str(i) , ' root = ' , num2str(c_old)]) ;        %First iteration value, obviously.
   i = i + 1 ;      %After every print statement, I'm incrementing the iteration count.
    
    test_raph = c_old - f(c_old)/df(c_old) ;
    if test_raph > a && test_raph < b 
        c_new = test_raph ;
      disp(['Iteration ' , num2str(i) , ' in NR root = ' , num2str(c_new)]) ;       %Display if second iteration is a valid NR iteration
      i = i + 1 ;
    else
        c_new = (a + b)/2 ;
        if sign(f(c_new)) ~= sign(f(a))
            b = c_new ;
        else
            a = c_new ; 
        end 
      disp(['Iteration ' , num2str(i) , ' in bisection root = ' , num2str(c_new) , ' with a = ' , num2str(a) , ' and b = ' , num2str(b)]) ;     %Second iteration is bisection. Displaying the middle point, the new left end and new right end.
      i = i + 1 ;      
    end
    
    rat = abs((c_new - c_old)/c_old) ;
    
    while rat > eps     %Code below is a repeat of the code above
        c_old = c_new ;     %important step to propagate changes
        test_raph = c_old - f(c_old)/df(c_old) ;

        if test_raph > a && test_raph < b 
            c_new = test_raph ;
         disp(['Iteration ' , num2str(i) , ' in NR root = ' , num2str(c_new)]) ;        %Display for successful NR
         i = i + 1 ;

        else
            c_new = (a + b)/2 ;
            if sign(f(c_new)) ~= sign(f(a))
                b = c_new ;
            else
                a = c_new ; 
            end
            
         disp(['Iteration ' , num2str(i) , ' in bisection root = ' , num2str(c_new) , ' with a = ' , num2str(a) , ' and b = ' , num2str(b)]) ;      %Display for bisection
         i = i + 1 ;
        end
        rat = abs((c_new - c_old)/c_old) ;
    end
end