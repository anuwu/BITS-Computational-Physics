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
    m = f(v(it)) ;
    v(it + 1) = v(it) + h*m ;
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
