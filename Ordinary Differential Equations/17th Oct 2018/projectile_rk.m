m = 10^-2 ;
k = 10^-4 ;
g = 9.8 ;

f = @(v) g - (k/m)*v^2 ;
h = 0.1 ;

v(1) = 0 ;
time(1) = 0 ;
s = 0 ;

it = 1 ;
for t = 0 : h : 20-h 
    f0 = f(v(it)) ;
    f1 = f(v(it) + h/2*f0) ;
    f2 = f(v(it) + h/2*f1) ;
    f3 = f(v(it) + h*f2) ;
    
    v(it + 1) = v(it) + h/6*(f0 + 2*f1 + 2*f2 + f3) ;
    if t < 10
        s = s + v(it + 1)*h ;
    end
    
    it = it + 1 ;
    time(it) = t + h ;
end

plot (time , v , 'o') ;
xlabel ('time') ;
ylabel ('velocity') ;
disp (['The distance travelled is ' , num2str(s)]) ;

