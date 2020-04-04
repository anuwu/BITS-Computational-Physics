%Check the comments in the other Hybrid.m file. Also be careful as to which
%folders you are activating in MATLAB. Many of my codes have the same file
%name, so MATLAB may get confused if you include folders that have
%repeating file names. Only activate that folder which is required.

%Same code as in the 'single root finding' Hybrid.m file.

function [c_new] = Hybrid (f , df , a , b , eps)

    c_old = a ;
    
    test_raph = c_old - f(c_old)/df(c_old) ;
    if test_raph > a && test_raph < b 
        c_new = test_raph ;

    else
        c_new = (a + b)/2 ;
        if sign(f(c_new)) ~= sign(f(a))
            b = c_new ;
        else
            a = c_new ; 
        end
    end
    
    rat = abs((c_new - c_old)/c_old) ;
    
    while rat > eps
        c_old = c_new ;
        test_raph = c_old - f(c_old)/df(c_old) ;

        if test_raph > a && test_raph < b 
            c_new = test_raph ;

        else
            c_new = (a + b)/2 ;
            if sign(f(c_new)) ~= sign(f(a))
                b = c_new ;
            else
                a = c_new ; 
            end
            
        end
        rat = abs((c_new - c_old)/c_old) ;
    end
end