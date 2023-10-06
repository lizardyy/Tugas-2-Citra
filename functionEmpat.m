function result = functionEmpat(f, X)
    F =(fft2(f));
    
    F2 = X.*F;

    % Convert back to spatial domain (inverse fourier transform)
    F2 = ifft2(F2);

    % result = uint8(f2);
    result = uint8(F2);
end