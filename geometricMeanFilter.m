% Fungsi untuk menghilangkan derau dengan geometric mean filter
function hasilFilter = geometricMeanFilter(citra, ukuranFilter)
    [m, n] = size(citra);
    hasilFilter = citra;
    radius = floor(ukuranFilter / 2);
    for i = 1:m
        for j = 1:n
            subimage = double(citra(max(1, i-radius):min(m, i+radius), max(1, j-radius):min(n, j+radius)));
            hasilFilter(i, j) = prod(subimage(:))^(1/(ukuranFilter^2));
        end
    end
end