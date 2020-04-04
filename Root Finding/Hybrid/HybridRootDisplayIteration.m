%This code is used for running the 'HybridDisplayIteration' function. I
%suggest you input random function for yourself and see how the process
%actually takes place. Preferrably use polynomial functions with lots of
%extremas to see the advantage of the process.

%Type the function in google to see its shape. It's always recommended to
%do so to get a rough idea where the root lies

%{
Test case 1 -
f = x^4 + x^3 - 2*x^2 + 4*x + 5
df = 4*x^3 + 3*x^2 - 4*x + 4
start point = -2
end point = -1
tolerance = 10^-4
root (as outputted by code) = -0.85884
%}

%{
Test case 2 -
f = x^7 - x^4 + 10*x^2 -4
df = 7*x^6 - 4*x^3 + 20*x 
start point = -1.4
end point = -0.4
tolerance = 10^-4
root (as outputted by code) = -0.65022

Another root for same function -
start point = -0.4
end point = 1
root (as outputted by code) = 0.64227
%}

str = input('Enter the function\n' , 's') ;
f = inline (str , 'x') ;

str = input('Enter the derivative of the function\n' , 's') ;
df = inline (str , 'x') ;

a = input ('Enter the start point of search\n') ;      
b = input ('Enter the end point of search\n') ;

eps = input ('Enter the tolerance\n') ;

val = HybridDisplayIteration (f , df , a , b , eps) ;
disp(['The value of the root = ' , num2str(val)]) ;