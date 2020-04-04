f = @(x) cos(x) ;
g = @(x) 4*sqrt(1-x^2) ;

Int_true_f = 1 ;
Int_true_g = pi ;

start = 500 ;   %Starting with 500 random points
endnum = 100000 ;   %Ending
step = 100 ;    %Taking steps of 100 points

for n = start:step:endnum
    i = (n-start)/step + 1 ;        %Finding array index so that it proceeds as 1, 2, 3...
    N(i) = n ;                      %X-axis for number of random points.
    
    Int_f(i) = Monte (f , 0 , pi/2 , n) ;       %integrate cos(x) from 0 to pi/2
    error_f(i) = (Int_f(i) - Int_true_f)/Int_true_f ;       %Calculating relative error
    
    Int_g(i) = Monte (g , 0 , 1 , n) ;          %integrate g(x) from 0 to 1.
    error_g(i) = (Int_g(i) - Int_true_g)/Int_true_g ;       %Relative error.
    
    %disp([num2str(N(n-start+1))]) ;
    
end

%N
%size(N)
%size(error_f) 

figure ('Name' , 'Function f' , 'NumberTitle' , 'off') ;
plot (N , error_f) ;        %Plotting error vs. number of random points.
title ('cos(x)') ;
xlabel ('No. of random iterations') ;
ylabel ('Error') ;


figure ('Name' , 'Function g' , 'NumberTitle' , 'off') ;
plot (N , error_g) ;        %Plotting error vs. number of random points.
title('4*sqrt(1-x^2)') ;
xlabel ('No. of random iterations') ;
ylabel ('Error') ;

    