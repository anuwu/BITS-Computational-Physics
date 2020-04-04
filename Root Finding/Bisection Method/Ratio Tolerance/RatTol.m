%{
I would not prefer doing this way as the iteration condition requires
taking a ratio. If c_old = 0(check the function code for what c_old means),
and one of the roots of the function actually lies close to zero then this
ratio would blow up and would never satisfy the tolerance condition. 

The Absolute tolerance method is preferred as there is no ratio
%}

a = input('Enter the left boundary\n') ;
b = input('Enter the right boundary\n') ;
eps = input('Enter the tolerance\n') ;  %While inputting the tolerance, just directly type it as 10^-6 or 10^-7
f = @(x) cos(x) - x ;

[r, iteration, rat] = RatTolRoot(f,a,b,eps) ;
disp (['The value of the root = ' , num2str(r)]) ;
disp (['The number of iterations = ' num2str(length(iteration))]) ;

plot (iteration , rat , 'o') ;   %I have plotted the iteration veruse the ratio. It decays really fast
