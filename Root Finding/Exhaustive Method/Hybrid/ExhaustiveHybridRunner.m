%For the online code submission assignment, Raj Kumar Gupta (my jaan)
%wanted us to find the roots of the 8th legendre polynomial. Also, he
%wanted us to submit one single file. As you can see, I like making things
%modular and define multiple files and functions (yeah, it's a bit tedious
%but makes general code use so much earier). So when I submitted the
%assignment, I un-generalised the code so it would only work for the
%legendre polynomial. I'm not sending you the un-generalised code, it's
%pretty useless.

%{
However, if you want to test the 8th legendre polynomial, here you go -
f = 1/128 * (6345*x^8 - 12012*x^6 + 6930*x^4 - 1260*x^2 + 35)
df = 1/128 * (6345*8*x^7 - 12012*6*x^5 + 6930*4*x^3 - 1260*2*x)
left end = -1
right end = 1
step size = 0.1    

(Justification for step size - use a step size which is less than 
                               (total length/total roots).
In this case it is 2/8 = 0.25
So for safety, I've used 0.1 as step size.
It's important to choose step size carefully. If your step size is too
large you may miss a root completely)

tolerance = 10^-4
%}


str = input('Enter the function\n' , 's') ;
f = inline (str , 'x') ;

str = input('Enter the derivative of the function\n' , 's') ;
df = inline (str , 'x') ;

a = input ('Enter the start point of search\n') ;       %Start of mega interval
b = input ('Enter the end point of search\n') ;     %End of mega interval
step = input ('Enter the step size\n') ;    %Length of mini interval
eps = input ('Enter the tolerance\n') ;     %Bisection tolerance

[cnt , roots] = ExhaustiveHybrid (f , df , a , b , step , eps) ;    %Function returns a count of roots and an array of roots

if cnt == 0
    disp(['No roots were found']) ;
else
    disp(['The roots found are - ']) ;
    for i = 1 : 1 : cnt
        disp([num2str(roots(i))]) ;
        
    end
end
       