f = @(y) y^2 + 1 ;

h = 1/100 ;
x0 = 0 ;
y0 = 0 ;

x(1) = x0 ;
y(1) = y0 ;


it = 1 ;
for i = 0 : h : 1-h
    m = f(y(it)) ;
    y(it+1) = y(it) + h*m ;
    x(it+1)= x(it)+h ;
    it = it+1 ;    
end

plot (x , y , 'o' , x , tan(x)) ;


%{
x = linspace (0 , 1.5 , 200) ;
n = length (x) ;
h = (x(n) - x(1))/n ;

for i = 1 : n-1
    m = f(y(i)) ;
    y(i+1) = y(i) + h*m ;
    x(i+1) = x(i) + h ;
    
end 

plot (x , y , 'o' , x , tan(x)) ;
%}
    
    