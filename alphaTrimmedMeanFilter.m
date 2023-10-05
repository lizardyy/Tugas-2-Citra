% Fungsi untuk menghilangkan derau dengan alpha-trimmed mean filter
function hasilFilter = alphaTrimmedMeanFilter(citra, ukuranFilter, alpha)
    % Mendapatkan ukuran citra input
    [m, n] = size(citra);

    % Menginisialisasi citra hasil filter dengan citra input
    hasilFilter = citra;

    % Menghitung radius filter
    radius = floor(ukuranFilter / 2);
    for i = (1+radius):(m-radius)
        for j = (1+radius):(n-radius)
            % Mengambil sub-citra dengan ukuran filter di sekitar piksel (i, j)
            subCitra = citra(i-radius:i+radius, j-radius:j+radius);
            
            % Mengubah sub-citra menjadi array satu dimensi dan tipe data double
            subCitra = double(subCitra(:));

            % sorting pixel
            subCitraSorted = sort(subCitra);

            % Menghapus alpha piksel terendah dan tertinggi
            subCitraTrimmed = subCitraSorted(alpha+1:end-alpha);

            % Menghitung nilai rata-rata dari sub-citra yang sudah di-trimmed
            hasilFilter(i, j) = uint8(mean(subCitraTrimmed(:)));
        end
    end
end
