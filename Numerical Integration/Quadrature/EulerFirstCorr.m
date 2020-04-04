%Note that the correction terms in Euler-McLaurin rule only depends on the
%end-terms.

function [val] = EulerFirstCorr (f , df , a , b , n)    %f and df is needed.

h = (b-a)/n ;
val = Linear (f , a , b , n) ;      %Zeroth order integration value is basically the first order trapezoidal.
val = val + (h^2)/12 * (df(a) - df(b)) ;        %Adding first correction term.

end