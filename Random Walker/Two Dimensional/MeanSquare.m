%{
Check one dimensional random walker code. It's the same thing, except for
the function call and expression from diffusion constant.

No. of random walkers = 1000
maximum number of steps = 100
%}



no_walker = input('Enter the number of random walkers\n') ;
max_step = input('Enter the maximum number of steps\n') ;


for i=1:1:max_step
    pos_sqr(i) = 0 ;
    n(i) = i ;
   for j=1:1:no_walker
       pos_sqr(i) = pos_sqr(i) + (TwoDRandomWalker(1 , i))^2 ;      %step size = 1 and number of steps = i.
   end
   pos_sqr(i) = pos_sqr(i)/no_walker ;
   D(i) = pos_sqr(i)/(4*i) ;        %For two-D case, this is how diffusion constant is defined.
    
end

plot (n , pos_sqr , 'o') ;
disp (['The diffusion constant = ' , num2str(mean(D))]) ;