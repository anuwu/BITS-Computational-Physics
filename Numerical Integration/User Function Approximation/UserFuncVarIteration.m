str = input('Enter the user defined function\n' , 's') ;
disp([' ']) ;
f = inline (str , 'x') ;

str = input('Enter the first derivative\n' , 's') ;
disp([' ']) ;
df1 = inline (str , 'x') ;

str = input('Enter the second derivative function\n' , 's') ;
disp([' ']) ;
df2 = inline (str , 'x') ;

str = input('Enter the third derivative function\n' , 's') ;
disp([' ']) ;
df3 = inline (str , 'x') ;


a = input('Enter the lower limit of integration\n') ;
b = input('Enter the upper limit of integration\n') ;
eps = input('Enter the tolerance\n') ;

[it_rec , area_rec , rat_rec] = RectangularVarIteration (f , a , b , eps) ;
no_it_rec = length(it_rec) ;
disp(['The area under the curve = ' , num2str(area_rec(no_it_rec))]) ;
disp(['The number of rectangular divisions = ' , num2str(no_it_rec)]) ;
disp([' ']) ;


[it_trap_first , area_trap_first , rat_trap_first] = TrapezoidalFirstOrderVarIteration (f , a , b , eps) ;
no_it_trap_first = length(it_trap_first) ;
disp(['The area under the curve = ' , num2str(area_trap_first(no_it_trap_first))]) ;
disp(['The number of polynomial divisions = ' , num2str(no_it_trap_first)]) ;
disp([' ']) ;

[it_trap_second , area_trap_second , rat_trap_second] = TrapezoidalSecondOrderVarIteration (f , df1 , a , b , eps) ;
no_it_trap_second = length(it_trap_second) ;
disp(['The area under the curve = ' , num2str(area_trap_second(no_it_trap_second))]) ;
disp(['The number of parabolic divisions = ' , num2str(no_it_trap_second)]) ;
disp([' ']) ;

[it_trap_third , area_trap_third , rat_trap_third] = TrapezoidalThirdOrderVarIteration (f , df1 , df2 , a , b , eps) ;
no_it_trap_third = length(it_trap_third) ;
disp(['The area under the curve = ' , num2str(area_trap_third(no_it_trap_third))]) ;
disp(['The number of cubic divisions = ' , num2str(no_it_trap_third)]) ;
disp([' ']) ;

[it_trap_fourth , area_trap_fourth , rat_trap_fourth] = TrapezoidalFourthOrderVarIteration (f , df1 , df2 , df3 , a , b , eps) ;
no_it_trap_fourth = length(it_trap_fourth) ;
disp(['The area under the curve = ' , num2str(area_trap_fourth(no_it_trap_fourth))]) ;
disp(['The number of biquadratic divisions = ' , num2str(no_it_trap_fourth)]) ;
disp([' ']) ;


f_rec = figure('Name','Rectangular Integration','NumberTitle','off') ;
subplot (2 , 1 , 1) ;
plot (it_rec , area_rec , 'o') ;
xlabel ('No of iterations') ;
ylabel ('Area') ;
subplot (2 , 1 , 2) ;
plot (it_rec , rat_rec , 'o') ;
xlabel ('No of iterations') ;
ylabel ('Ratio') ;

f1 = figure('Name','Trapezoidal First Order Integration','NumberTitle','off') ;
subplot (2 , 1 , 1) ;
plot (it_trap_first , area_trap_first , 'o') ;
xlabel ('No of iterations') ;
ylabel ('Area') ;
subplot (2 , 1 , 2) ;
plot (it_trap_first , rat_trap_first , 'o') ;
xlabel ('No of iterations') ;
ylabel ('Ratio') ;

f2 = figure('Name','Trapezoidal Second Order Integration','NumberTitle','off') ;
subplot (2 , 1 , 1) ;
plot (it_trap_second , area_trap_second , 'o') ;
xlabel ('No of iterations') ;
ylabel ('Area') ;
subplot (2 , 1 , 2) ;
plot (it_trap_second , rat_trap_second , 'o') ;
xlabel ('No of iterations') ;
ylabel ('Ratio') ;

f3 = figure('Name','Trapezoidal Third Order Integration','NumberTitle','off') ;
subplot (2 , 1 , 1) ;
plot (it_trap_third , area_trap_third , 'o') ;
xlabel ('No of iterations') ;
ylabel ('Area') ;
subplot (2 , 1 , 2) ;
plot (it_trap_third , rat_trap_third , 'o') ;
xlabel ('No of iterations') ;
ylabel ('Ratio') ;

f4 = figure('Name','Trapezoidal Fourth Order Integration','NumberTitle','off') ;
subplot (2 , 1 , 1) ;
plot (it_trap_fourth , area_trap_fourth , 'o') ;
xlabel ('No of iterations') ;
ylabel ('Area') ;
subplot (2 , 1 , 2) ;
plot (it_trap_fourth , rat_trap_fourth , 'o') ;
xlabel ('No of iterations') ;
ylabel ('Ratio') ;

f_all = figure('Name','Integration Comparison','NumberTitle','off') ;
subplot (2 , 1 , 1) ;
hold on 
%plot (it_rec , area_rec , 'ro') ;
plot (it_trap_first , area_trap_first , 'bx') ;
plot (it_trap_second , area_trap_second , 'c*') ;
plot (it_trap_third , area_trap_third , 'k^') ;
plot (it_trap_fourth , area_trap_fourth , 'm*') ;
xlabel ('No of iterations') ;
ylabel ('Area') ;
hold off

subplot (2 , 1 , 2) ;
hold on 
%plot (it_rec , rat_rec , 'ro') ;
plot (it_trap_first , rat_trap_first , 'bx') ;
plot (it_trap_second , rat_trap_second , 'c*') ;
plot (it_trap_third , rat_trap_third , 'k^') ;
plot (it_trap_fourth , rat_trap_fourth , 'm*') ;
xlabel ('No of iterations') ;
ylabel ('Ratio') ;
hold off




