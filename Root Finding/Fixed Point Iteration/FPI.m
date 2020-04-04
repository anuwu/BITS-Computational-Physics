%This was the question of the first group assignment

g = @(x) (1/11)*(-x^3 + 6*x^2 + 6) ;
guess = input('Enter the guess root\n') ;
eps = input('Enter the tolerance\n') ;

[r , it , x] = FixedPointIteration (g , guess , eps) ;
disp (['The value of the root is = ' , num2str(r)]) ;
disp (['The number of iterations = ' , num2str(length(it))]) ;

plot(it , x) ;