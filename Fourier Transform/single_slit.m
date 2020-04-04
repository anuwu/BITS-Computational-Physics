for a=0.1:0.01:20
   % a = input('Enter the width\n') ;

    it = 1 ;
    for y = -10:0.1:-(a/2+0.1)
        f(it) = 0 ;
        it = it + 1 ;
    end

    for y = -a/2:0.1:a/2
        f(it) = 1 ;
        it = it +1 ;
    end

    for y = (a/2+0.1):0.1:10
        f(it) = 0 ;
        it = it + 1 ;
    end

    y_f = fft(f) ;
    absy_f = abs(fftshift(y_f)) ;
    norm_f = absy_f/max(absy_f) ;
    u = -10:0.1:10 ;

    plot (u , norm_f) ;
    xlabel(['Slit width = ' , num2str(a)]) ;
    drawnow ;
end
