f = @(x) sqrt(1 - x^2) ;    %Equation of circle of radius one. We compute the area in its first quadrant.
actual_area = pi ;

area_rect = 4 * Rectangular (f , 0 , 1 , 100) ;     %Area of circle is 4 times its quadrant.
area_trap_first = 4 * TrapezoidalFirstOrder (f , 0 , 1 , 100) ;

err_rect = (area_rect - actual_area)/actual_area * 100 ;
disp (['The area in rectangular integration = ' , num2str(area_rect)]) ;
disp (['The percentage error = ' , num2str(err_rect) , '%']) ;

err_trap_first = (area_trap_first - actual_area)/actual_area * 100 ;
disp (['The area in first order trapezoidal integration = ' , num2str(area_trap_first)]) ;
disp (['The percentage error = ' , num2str(err_trap_first) , '%']) ;


