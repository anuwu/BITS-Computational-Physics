f = @(y) y^2 + 1 ;
func = @(x) tan(x) ;

h = 1.56/1000 ;
x0 = 0 ;
y0 = 0 ;

x(1) = x0 ;
y_euler(1) = y0 ;
y_mod_euler(1) = y0 ;
y_imp_euler(1) = y0 ;

euler_err(1) = 0 ;
mod_euler_err(1) = 0 ;
imp_euler_err(1) = 0 ;


it = 1 ;
for i = 0 : h : 1.56-h
    
    m = f(y_euler(it)) ;
    y_euler(it+1) = y_euler(it) + h*m ;
    euler_err(it + 1) = (y_euler(it+1) - tan(i+h))/tan(i+h) ;
    
    y_mid = y_euler(it) + h/2 * f(y_euler(it)) ;
    m = f(y_mid) ;
    y_mod_euler(it+1) = y_mod_euler(it) + h*m ;
    mod_euler_err(it + 1) = (y_mod_euler(it+1) - tan(i+h))/tan(i+h) ;
    
    y_start = f(y_euler(it)) ;
    y_end = f(y_euler(it) + h*f(y_euler(it))) ;
    m = (y_start + y_end)/2 ;
    y_imp_euler(it+1) = y_imp_euler(it) + h*m ;
    imp_euler_err(it + 1) = (y_imp_euler(it+1) - tan(i+h))/tan(i+h) ;
    
    it = it + 1 ;
    x(it) = i ;
    
end



subplot (2,1,1) ;
hold on
plot (x , y_euler , 'bo') ;
plot (x , y_mod_euler , 'r^') ;
plot (x , y_imp_euler , 'c*') ;
plot (x , tan(x)) ;
xlabel ('x') ;
ylabel ('y') ;

hold off ;

subplot (2 , 1 ,2 ) ;
hold on
plot (x , euler_err , 'bo') ;
plot (x , mod_euler_err , 'r^') ;
plot (x , imp_euler_err , 'c*') ;
xlabel ('x') ;
ylabel ('error') ;