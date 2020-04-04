%{
Here we want to plot diffusion constant vs. step size.
No of walkers = 1000
maximum number of steps = 100
max_stepsize = 3
%}


no_walker = input('Enter the number of random walkers\n') ;
max_step = input('Enter the maximum number of steps\n') ;
max_stepsize = input('Enter the maximum step size\n') ;

it = 1 ;    %Iteration count
for k=0.1:0.1:max_stepsize  %Start from 0.1 stepsize.
    N(it) = k ;     %X-axis for step size
    
    %Basically it's the mean-square code written below. It's just enclosed
    %in an outer loop where the step size varies
    for i=1:1:max_step      
        pos_sqr = 0 ;
       for j=1:1:no_walker
           pos_sqr = pos_sqr + (RandomWalker(k , i))^2 ;
       end
       pos_sqr = pos_sqr/no_walker ;
       D(i) = pos_sqr/(2*i) ;       %Creating array of diffusion constant for all total step numbers.
    end
    
    Diff(it) = mean(D) ;        %Diffusion constant for each iteration is the mean of the array of D.
    it = it + 1 ;       %Increment iteration count
end

plot (N , Diff , 'o') ;     %Plotting step-size vs. diffusion constant. Expect a quadratic curve.
xlabel('Step Size') ;
ylabel ('Diffusion constant') ;