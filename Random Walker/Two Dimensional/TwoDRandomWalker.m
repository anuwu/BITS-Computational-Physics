%Check notes. The conditions of walking are defined this way.

function pos = TwoDRandomWalker (step , n)  %Step size and number of steps.

posx = 0 ;
posy = 0 ;

for j=1:1:n
     rand_num = rand ;
     if rand_num <= 0.25
         posx = posx + step ;       %go right
     else if rand_num > 0.25 & rand_num <= 0.5
         posy = posy + step ;   %go up
     else if rand_num > 0.5 & rand_num <= 0.75
         posx = posx - step ;   %go left
     else
         posy = posy - step ;   %go down
     end
     end
     end
end
    
pos = sqrt(posx^2 + posy^2) ;
    
end
