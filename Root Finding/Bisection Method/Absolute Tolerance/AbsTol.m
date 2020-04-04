a = input('Enter the left boundary\n') ;
b = input('Enter the right boundary\n') ;
eps = input('Enter the tolerance\n') ; 
f = @(x) cos(x) - x ;

[r, iteration, absfuncval] = AbsTolRoot(f,a,b,eps) ;
disp (['The value of the root = ' , num2str(r)]) ;
disp (['The number of iterations = ' num2str(length(iteration))]) ;

plot (iteration , absfuncval , 'o') ;       %plotting iteration versus value of function
