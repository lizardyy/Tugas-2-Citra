function deconvolved_image = penapisWiener(blurred_image, kernel, noise_variance)
    % Menghitung spektrum Fourier dari kernel dan citra terblur
    H = double(fft2(double(kernel), size(blurred_image, 1), size(blurred_image, 2)));
    Y = double(fft2(double(blurred_image)));
    ConjH = conj(H);
    % Menghitung penapis Wiener
    wiener_filter = ConjH ./ ((ConjH .* H) + noise_variance);

    % Melakukan dekonvolusi menggunakan penapis Wiener
    F = wiener_filter .* Y;
    deconvolved_image = ifft2(F);

    % Mengonversi hasil dekonvolusi ke dalam rentang nilai yang benar
    deconvolved_image = uint8(deconvolved_image);
end