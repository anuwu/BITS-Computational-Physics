str = input('Enter the function\n' , 's') ;
f = inline (str , 'x') ;

a = input ('Enter the start point of search\n') ;       %Start of mega interval
b = input ('Enter the end point of search\n') ;     %End of mega interval
step = input ('Enter the step size\n') ;    %Length of mini interval
eps = input ('Enter the tolerance\n') ;     %Bisection tolerance

[cnt , roots] = ExhaustiveBisection (f , a , b , step , eps) ;    %Function returns a count of roots and an array of roots

if cnt == 0
    disp(['No roots were found']) ;
else
    disp(['The roots found are - ']) ;
    for i = 1 : 1 : cnt
        disp([num2str(roots(i))]) ;
        
    end
end
       