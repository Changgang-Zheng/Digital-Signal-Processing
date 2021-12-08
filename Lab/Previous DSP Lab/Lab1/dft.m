function [ t,X ] = dft( x,N )
    WN = exp(-1j*2*pi/N);
    nk = (0:(length(x)-1))'*(0:(N-1));
    WNnk = WN .^ nk;
    X = x * WNnk;
    t = 0:N-1;
end

