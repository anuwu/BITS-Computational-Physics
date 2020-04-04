f = @(w) cos(pi/2 * (w^2)) ;
g = @(w) sin(pi/2 * (w^2)) ;

i = 1 ;
for v=0:0.01:10     %For each value of 'v' the functions f and g have to be integrated from 0 to v.
   c(i) = Simpson(f,0,v,500) ;
   s(i) = Simpson(g,0,v,500) ;
   I(i) = 1/2 * ((c(i) + 0.5)^2 + (s(i) + 0.5)^2) ;     %Check notes.
   v_plot(i) = v ;      %X-axis
   i = i + 1 ;  
end

plot (v_plot , I) ;     %plot v vs. relative intensity.

