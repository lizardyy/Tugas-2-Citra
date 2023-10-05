%% Fungsi untuk Contraharmonic Mean Filter
function hasilFilter = contraharmonicMeanFilter(citra, ukuranFilter, Q)
     % mendapatkan ukuran citra
    [m, n] = size(citra);

    % inisialisasi output image hasil min filter
    hasilFilter = citra;

    % menghitung radius
    radius = floor(ukuranFilter / 2);
    for i = (1+radius):(m-radius)
        for j = (1+radius):(n-radius)
            % Hitung nilai Contraharmonic mean Filter untuk sub citra
            subCitra = double(citra(i-radius:i+radius, j-radius:j+radius));
            rataRataContraharmonik = sum(subCitra(:) .^ (Q+1.0)) / sum(subCitra(:) .^ Q);
            hasilFilter(i, j) = uint8(rataRataContraharmonik);
        end
    end
    
end