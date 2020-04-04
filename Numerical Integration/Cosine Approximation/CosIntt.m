f = @(x) cos(x) ;   
df1 = @(x) -sin(x) ;    %derivative

a = 0 ;
b = pi/2 ;

actual_area = 1 ;

area_rect = Rectangular (f , a , b , 100) ;
area_trap_first = TrapezoidalFirstOrder (f , a , b , 100) ;
area_trap_second = TrapezoidalSecondOrder (f , df1 ,  a , b , 100) ;

err_rect = (area_rect - actual_area)/actual_area * 100 ;    %error in rectangular integration
disp (['The area in rectangular integration = ' , num2str(area_rect)]) ;
disp (['The percentage error from actual value = ' , num2str(err_rect) , '%']) ;
disp ([' ']) ;

err_trap_first = (area_trap_first - actual_area)/actual_area * 100 ;    %error in first order trapezoidal integration
corr_trap_first = area_trap_first - area_rect ; 
rel_corr_first = abs (corr_trap_first/area_rect) ;
disp (['The area in first order trapezoidal integration = ' , num2str(area_trap_first)]) ;
disp (['The percentage error from actual value = ' , num2str(err_trap_first) , '%']) ;
disp (['The first order correction = ' , num2str(corr_trap_first)]) ;   %(trapezoidal - rectangular)
disp (['The relative change in the integral = ' , num2str(rel_corr_first)]) ;   %(trapezoidal - rectangular)/rectangular
disp ([' ']) ;

err_trap_second = (area_trap_second - actual_area)/actual_area * 100 ;
corr_trap_second = area_trap_second - area_trap_first ;
rel_corr_second = abs (corr_trap_second/area_trap_first) ;
disp (['The area in second order trapezoidal integration = ' , num2str(area_trap_second)]) ;
disp (['The percentage error from actual value = ' , num2str(err_trap_second) , '%']) ;
disp (['The second order correction = ' , num2str(corr_trap_second)]) ;     %(second order - first order)
disp (['The relative change in the integral = ' , num2str(rel_corr_second)]) ;      %(second order - first order)/first order
disp ([' ']) ;
