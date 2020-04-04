x0 = 0 ;
y0 = 1 ;
h = 0.01 ;

x(1) = x0 ;
y(1) = y0 ;
ymod(1) = y0 ;
yimp(1) = y0 ;

it = 1 ;
for i = 0 : 0.05 : 1 - 0.05
    m = f(x(it) , y(it)) ;
    y(it + 1) = y(it) + h*m ;
    
    xmid = x(it) + h/2 ;
    ymid = y(it) + h/2*m ;
    mmod = f(xmid , ymid) ;
    ymod(it+1) = ymod(it) + h*mmod ;
    
    m1 = m ;
    m2 = f(x(it) + h , y(it+1)) ;
    mimp = (m1 + m2)/2 ;
    yimp(it + 1) = yimp(it) + h*mimp ;
    
    
    it = it + 1 ;
    x(it) = i + h ;
end

plot (x , y) ;