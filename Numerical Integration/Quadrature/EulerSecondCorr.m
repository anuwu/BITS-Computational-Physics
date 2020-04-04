function [val] = EulerSecondCorr (f , df1 , df3 , a , b , n)    %f, first and third derivative needed.

h = (b-a)/n ;
val = EulerFirstCorr(f , df1 , a , b , n) ;     %Reusing code for first correction
val = val - (h^4)/720 * (df3(a) - df3(b)) ;     %adding second correction

end