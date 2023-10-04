%% Function untuk Geometric Mean Filter
% Melakukan filter rata-rata geometrik pada citra
function hasilFilter = geometricMeanFilter(citra, ukuranFilter)
    % mendapatkan ukuran citra
    [m, n] = size(citra);

    % inisialisasi output image hasil min filter
    hasilFilter = citra;

    % menghitung radius
    radius = floor(ukuranFilter / 2);
    for i = (1+radius):(m-radius)
        for j = (1+radius):(n-radius)
            % Hitung nilai geometric mean Filter untuk sub citra
            subCitra = citra(i-radius:i+radius, j-radius:j+radius);
            hasilFilter(i, j) = uint8(prod(subCitra(:)) ^ (1/numel(subCitra)));
        end
    end
end