function deconvolved_image = penapisWiener(blurred_image, kernel, noise_variance)
    % Menghitung spektrum Fourier dari kernel dan citra terblur
    H = fft2(kernel, size(blurred_image, 1), size(blurred_image, 2));
    Y = fft2(blurred_image);
    
    % Menghitung penapis Wiener
    wiener_filter = conj(H) ./ (abs(H).^2 + noise_variance);
    
    % Melakukan dekonvolusi menggunakan penapis Wiener
    deconvolved_image = ifft2(Y .* wiener_filter);
    
    % Mengonversi hasil dekonvolusi ke dalam rentang nilai yang benar
    deconvolved_image = real(deconvolved_image);
    deconvolved_image = uint8(deconvolved_image);
end