function pos = RandomWalker (step , n)      %step is the size of one step. n is total number of steps.

pos = 0 ;   %Walker starts at 0.
for j=1:1:n
     rand_num = rand ;      %Random number from 0 to 1
     if rand_num < 0.5
         pos = pos - step ;     %Go left
     else
         pos = pos + step ;     %Go right
     end
end
    
    
end
