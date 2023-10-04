%% Fungsi untuk Harmonic Mean Filter
function hasilFilter = harmonicMeanFilter(citra, ukuranFilter)
     % mendapatkan ukuran citra
    [m, n] = size(citra);

    % inisialisasi output image hasil min filter
    hasilFilter = citra;

    % menghitung radius
    radius = floor(ukuranFilter / 2);
    for i = (1+radius):(m-radius)
        for j = (1+radius):(n-radius)
            % Hitung nilai harmonic mean Filter untuk sub citra
            subCitra = citra(i-radius:i+radius, j-radius:j+radius);
            rataRataHarmonik = numel(subCitra) / sum(1 ./ double(subCitra(:)));
            hasilFilter(i, j) = uint8(rataRataHarmonik);
        end
    end
end