% Fungsi untuk menghilangkan derau dengan median filter
function hasilFilter = medianFilter(citra, ukuranFilter)
    [m, n] = size(citra);
    hasilFilter = citra;
    radius = floor(ukuranFilter / 2);
    for i = 1:m
        for j = 1:n
            subimage = citra(max(1, i-radius):min(m, i+radius), max(1, j-radius):min(n, j+radius));
            hasilFilter(i, j) = median(subimage(:));
        end
    end
end