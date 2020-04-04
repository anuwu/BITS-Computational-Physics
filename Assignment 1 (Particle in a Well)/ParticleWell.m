%{
Read the last two pages of the assignment solution to understand how I
wrote this code.

I've not used the ExhaustiveBisection method as the functions here blow
upto infinity. I've identified manually the intervals where the roots lies
and applied ratio bisection technique.

For some reason, the absolute bisection technique does not work here. I
guess it is because tan(x) and cot(x) blow up really fast to infinity near
it's singularities and the code runs into an infinite loop.

It is safe to use ratio tolerance as none of the roots are 0. Applying
ratio tolerance will make you reach the root much faster and hence the code
does not run into an endless loop.
%}

m = input('Enter the mass of the particle in kg\n') ;
V = input('Enter the depth of potential well in MeV \n') ;
a = input('Enter the length of potential well in metres\n') ;

z0 = sqrt(2 * m * V * 1.6 * 10^-13) * a * 2 * pi / (6.63 * 10^-34) ;
f = @(z) tan(z) - sqrt((z0/z)^2 - 1) ;      %Even States
g = @(z) cot(z) + sqrt((z0/z)^2 - 1) ;      %Odd States

cnt_even = 0 ;
i = 0 ;
while i*pi < z0
   cnt_even = cnt_even+1 ;    
   %{
    IMPORTANT COMMENT - Note the third argument of the function call below.
    I have subtracted 0.01 from (i+1/2)*pi because tan(x) blows up to infinity 
    for exactly that value. If a small value such as 0.01 is subtracted, 
    it does not harm the bisection process. Otherwise, the code gets stuck.
   
    Basically, I have done some 'jugaad' here.
   %}
   
   roots_even(cnt_even) = BisectionRat(f , i*pi , (i+1/2)*pi - 0.01, 10^-4) ;      
   energy_even(cnt_even) = (((roots_even(cnt_even)))^2) * (6.6*10^-34/(2*pi))^2 / (2 * m * a^2) ;   %Converting z to joules
   energy_even(cnt_even) = energy_even(cnt_even)/(1.6*10^-13) ;     %Converting joules to MeV
   i = i+1 ; 
end

cnt_odd = 0 ;
i = 1 ;
while (i-1/2)*pi < z0
    cnt_odd = cnt_odd+1 ;
    
    %{
    IMPORTANT COMMENT - Note the third argument of the function call below.
    I have subtracted 0.01 from (i*pi) because tan(x) blows up to infinity 
    for exactly that value. If a small value such as 0.01 is subtracted, 
    it does not harm the bisection process. Otherwise, the code gets stuck.
   
    Jugaad again.
   %}
    roots_odd(cnt_odd) = BisectionRat(g , (i-1/2)*pi , i*pi - 0.01 , 10^-4) ;      %Same reason as above. cot(x) blows up to infinity for i*pi
    energy_odd(cnt_odd) = (((roots_odd(cnt_odd)))^2) * (6.6*10^-34/(2*pi))^2 / (2 * m * a^2) ; %Converting z to joules     
    energy_odd(cnt_odd) = energy_odd(cnt_odd)/(1.6*10^-13) ;        %Converting Joules to MeV
   i = i+1 ; 
end


disp(['The number of even state solutions = ' , num2str(cnt_even)]) ;
disp(['    Z            Energy(MeV)']) ;
for i=1:1:cnt_even
    disp([num2str(roots_even(i)), '            ' , num2str(energy_even(i))]) ;
end

disp(['']) ;

disp(['The number of even odd solutions = ' , num2str(cnt_odd)]) ;
disp(['    Z            Energy(MeV)']) ;
for i=1:1:cnt_odd
     disp([num2str(roots_odd(i)), '            ' ,num2str(energy_odd(i))]) ;
end
    


