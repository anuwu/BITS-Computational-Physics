f = @(x) cos(x) ;
df1 = @(x) -sin(x) ;
df2 = @(x) -cos(x) ;
df3 = @(x) sin(x) ;

a = 0 ;
b = pi/2 ;

actual_area = 1 ;

area_rect = Rectangular (f , a , b , 5) ;
area_trap_first = TrapezoidalFirstOrder (f , a , b , 5) ;
area_trap_second = TrapezoidalSecondOrder (f , df1 ,  a , b , 5) ;
area_trap_third = TrapezoidalThirdOrder (f , df1 , df2 , a , b , 5) ;
area_trap_fourth = TrapezoidalFourthOrder (f , df1 , df2 , df3 , a , b , 5) ;

err_rect = (area_rect - actual_area)/actual_area * 100 ;
disp (['The area in rectangular integration = ' , num2str(area_rect)]) ;
disp (['The percentage error from actual value = ' , num2str(err_rect) , '%']) ;
disp ([' ']) ;

err_trap_first = (area_trap_first - actual_area)/actual_area * 100 ;
corr_trap_first = area_trap_first - area_rect ; 
rel_corr_first = abs (corr_trap_first/area_rect) ;
disp (['The area in first order trapezoidal integration = ' , num2str(area_trap_first)]) ;
disp (['The percentage error from actual value = ' , num2str(err_trap_first) , '%']) ;
disp (['The first order correction = ' , num2str(corr_trap_first)]) ;
disp (['The relative change in the integral = ' , num2str(rel_corr_first)]) ;
disp ([' ']) ;

err_trap_second = (area_trap_second - actual_area)/actual_area * 100 ;
corr_trap_second = area_trap_second - area_trap_first ;
rel_corr_second = abs (corr_trap_second/area_trap_first) ;
disp (['The area in second order trapezoidal integration = ' , num2str(area_trap_second)]) ;
disp (['The percentage error from actual value = ' , num2str(err_trap_second) , '%']) ;
disp (['The second order correction = ' , num2str(corr_trap_second)]) ;
disp (['The relative change in the integral = ' , num2str(rel_corr_second)]) ;
disp ([' ']) ;

err_trap_third = (area_trap_third - actual_area)/actual_area * 100 ;
corr_trap_third = area_trap_third - area_trap_second ;
rel_corr_third = abs(corr_trap_third/area_trap_second) ;
disp (['The area in third order trapezoidal integration = ' , num2str(area_trap_third)]) ;
disp (['The percentage error from actual value = ' , num2str(err_trap_third) , '%']) ;
disp (['The third order correction = ' , num2str(corr_trap_third)]) ;
disp (['The relative change in the integral = ' , num2str(rel_corr_third)]) ;
disp ([' ']) ;

err_trap_fourth = (area_trap_fourth - actual_area)/actual_area * 100 ;
corr_trap_fourth = area_trap_fourth - area_trap_third ;
rel_corr_fourth = abs(corr_trap_fourth/area_trap_third) ;
disp (['The area in fourth order trapezoidal integration = ' , num2str(area_trap_fourth)]) ;
disp (['The percentage error from actual value = ' , num2str(err_trap_fourth) , '%']) ;
disp (['The fourth order correction = ' , num2str(corr_trap_fourth)]) ;
disp (['The relative change in the integral = ' , num2str(rel_corr_fourth)]) ;


