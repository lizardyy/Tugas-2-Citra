% Fungsi untuk menghilangkan derau dengan max filter
function hasilFilter = maxFilter(citra, ukuranFilter)
    [m, n] = size(citra);
    hasilFilter = citra;
    radius = floor(ukuranFilter / 2);
    for i = 1:m
        for j = 1:n
            subimage = citra(max(1, i-radius):min(m, i+radius), max(1, j-radius):min(n, j+radius));
            hasilFilter(i, j) = max(subimage(:));
        end
    end
end