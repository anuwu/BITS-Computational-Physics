f = @(x) 1/(1+cos(x)) ;

val = Simpson (f , 0 , pi/2 , 500) ;
disp(['The value of the integral = ' , num2str(val)]) ;