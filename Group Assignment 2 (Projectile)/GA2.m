%I don't remember what the exact problem was. It's in my notes only. I'll
%send a picture

R = input('Enter the value of range\n') ;
h = input('Enter the value of height\n') ;
v = input('Enter the value of velocity\n') ;
g = 10 ;

a = input('Enter the left boundary\n') ;
b = input('Enter the right boundary\n') ;
eps = input('Enter the tolerance\n') ; 
f = @(x)  g*(R^2)/(2*(v^2))*(x^2) - R*x + (h + g*(R^2)/(2*(v^2))) ;     

[r, iteration, absfuncval] = AbsTolRoot(f,a,b,eps) ;
disp (['The angle = ' , num2str(atan(r) * 180/pi)]) ;
