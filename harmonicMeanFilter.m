% Fungsi untuk menghilangkan derau dengan harmonic mean filter
function hasilFilter = harmonicMeanFilter(citra, ukuranFilter)
    [m, n] = size(citra);
    hasilFilter = citra;
    radius = floor(ukuranFilter / 2);
    for i = 1:m
        for j = 1:n
            subimage = citra(max(1, i-radius):min(m, i+radius), max(1, j-radius):min(n, j+radius));
            subimage = double(subimage);
            subimage(subimage == 0) = eps; % Menghindari pembagian dengan 0
            hasilFilter(i, j) = (ukuranFilter^2) / sum(1 ./ subimage(:));
        end
    end
end