%{
The aim is to see how the diffusion constant (check notes) varies as a
function of number of steps (controlled by variable i). Since it's a statistical problem, 
we need to average over many random walkers, which is controlled by
variable j.

No. of random walkers = 1000
maximum number of steps = 100

%}

no_walker = input('Enter the number of random walkers\n') ;
max_step = input('Enter the maximum number of steps\n') ;


for i=1:1:max_step
    pos_sqr(i) = 0 ;    %Square of final position
    n(i) = i ;  %X-axis for number of steps
   for j=1:1:no_walker
       %Calling function with step = 1 and number of steps = i.
       pos_sqr(i) = pos_sqr(i) + (RandomWalker(1 , i))^2 ;  %I'm adding it here, i'll divide in the next step. I ultimately need to find average of square of position.
   end
   pos_sqr(i) = pos_sqr(i)/no_walker ;      %finding average of square of position of ALL random walkers. Expect a linear curve.
   D(i) = pos_sqr(i)/(2*i) ;                %Diffusion constant is defined as (Square of final position)/(2 * number of steps)
    
end

plot (n , pos_sqr , 'o') ;      %number of steps vs. average square of final position
disp (['The diffusion constant = ' , num2str(mean(D))]) ;      %Taking the mean of D for each total number of steps.