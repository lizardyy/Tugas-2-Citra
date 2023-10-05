function result = IHPFilter(f, D0)
    F = fft2(double(f));

    % Create IHP Mask
    [M,N,z] = size(f);
    
    u = 0:M-1;
    v = 0:N-1;

    idx = find(u > M/2);
    u(idx) = u(idx) - M;
    idy = find(v > N/2);
    v(idy) = v(idy) - N;
    
    [V, U] = meshgrid(v, u);
    D = sqrt(U.^2 + V.^2);
    
    % IHP formula
    H = 1 - double(D <= D0);

    if z == 3
        H = cat(3, H, H, H);
    end

    % Do convolution
    F2 = H .* F;

    % Convert back to spatial domain (inverse fourier transform)
    f2 = ifft2(F2);

    result = uint8(f2);
end
