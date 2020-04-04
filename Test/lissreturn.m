function [time,x,y,it,stoptime] = lissreturn(A , B , a , b , phi , max_t, division)
    it = 1 ;
    
    x_start = A*sin(phi) ;
    y_start = 0 ;
    x_tol = abs(A*cos(phi)*(2*pi/division)) ;
    x_tol = x_tol/10 ;
    y_tol = abs(B*(2*pi/division)) ;
    y_tol = y_tol/10 ;
    for t=0:(2*pi/division):max_t 
        time(it) = t ;
        x(it) = A * sin(a*t + phi) ;
        y(it) = B * sin(b*t) ;
        
        
        %{
        if t >= 2*pi && abs((x(it) - x_start)) < x_tol && abs((y(it) - y_start)) < y_tol
            break ;
        end
        %}
        
        
        it = it + 1 ;
    end   
    stoptime = t ;
    
    it = it-1 ;
end 