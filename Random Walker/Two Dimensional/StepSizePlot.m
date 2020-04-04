%{
Again, check the code for one dimensional case.

Here we want to plot diffusion constant vs. step size.
No of walkers = 1000
maximum number of steps = 100
max_stepsize = 3
%}

no_walker = input('Enter the number of random walkers\n') ;
max_step = input('Enter the maximum number of steps\n') ;
max_stepsize = input('Enter the maximum step size\n') ;

it = 1 ;
for k=0.1:0.1:max_stepsize
    N(it) = k ;
    for i=1:1:max_step
        pos_sqr = 0 ;
       for j=1:1:no_walker
           pos_sqr = pos_sqr + (TwoDRandomWalker(k , i))^2 ;
       end
       pos_sqr = pos_sqr/no_walker ;
       D(i) = pos_sqr/(2*i) ;
    end
    
    Diff(it) = mean(D) ;
    it = it + 1 ;
end

plot (N , Diff , 'o') ;
xlabel('Step Size') ;
ylabel ('Diffusion constant') ;