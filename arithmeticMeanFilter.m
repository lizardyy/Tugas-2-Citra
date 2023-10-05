%% Function untuk Arithmetic Mean Filter
% Melakukan filter rata-rata aritmatika pada citra
function hasilFilter = arithmeticMeanFilter(citra, ukuranFilter)
    % mendapatkan ukuran citra
    [m, n] = size(citra);

    % inisialisasi output image hasil min filter
    hasilFilter = citra;

    % menghitung radius
    radius = floor(ukuranFilter / 2);
    for i = (1+radius):(m-radius)
        for j = (1+radius):(n-radius)
            % Hitung nilai arithmetic mean Filter untuk sub citra
            subCitra = citra(i-radius:i+radius, j-radius:j+radius);
            hasilFilter(i, j) = uint8(mean(subCitra(:)));
        end
    end
end