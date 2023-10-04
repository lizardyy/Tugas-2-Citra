%% Fungsi untuk Contraharmonic Mean Filter
function hasilFilter = contraharmonicMeanFilter(citra, ukuranFilter, Q)
     % mendapatkan ukuran citra
    [m, n] = size(citra);

    % inisialisasi output image hasil min filter
    hasilFilter = citra;

    if (Q == -1)
        hasilFilter = harmonicMeanFilter(citra, ukuranFilter);
    else
        % menghitung radius
        radius = floor(ukuranFilter / 2);
        for i = (1+radius):(m-radius)
            for j = (1+radius):(n-radius)
                % Hitung nilai Contraharmonic mean Filter untuk sub citra
                subCitra = citra(i-radius:i+radius, j-radius:j+radius);
                rataRataContraharmonik = sum(subCitra(:).^(Q+1)) / sum(subCitra(:).^Q);
                hasilFilter(i, j) = uint8(rataRataContraharmonik);
            end
        end
    end
end