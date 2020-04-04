%A , B, a, b, phase, time

f = figure ('Name' , 'Lissajous Pattern' , 'NumberTitle' , 'off') ;
[time , x , y , length, stoptime] = lissreturn (1 , 1, 17 , 8*pi , pi/2 , 100, 100) ;

axis([-1,1,-1,1]);
h = animatedline ;


for it=1:1:length
   addpoints (h , x(it) , y(it)) ;
   xlabel(['Time = ' , num2str(time(it)) , ' Cycles = ' , num2str(time(it)/(2*pi))]) ;
   drawnow
end


%disp(['Stop time = ' , num2str(stoptime)]) ;
%disp(['In multiples of 2*pi = ' , num2str(stoptime/(2*pi))]) ;
