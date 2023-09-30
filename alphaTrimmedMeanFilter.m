% Fungsi untuk menghilangkan derau dengan alpha-trimmed mean filter
function hasilFilter = alphaTrimmedMeanFilter(citra, ukuranFilter, d)
    [m, n] = size(citra);
    hasilFilter = citra;
    radius = floor(ukuranFilter / 2);
    for i = 1:m
        for j = 1:n
            subimage = citra(max(1, i-radius):min(m, i+radius), max(1, j-radius):min(n, j+radius));
            subimage = double(subimage(:));
            subimage_sorted = sort(subimage);
            subimage_trimmed = subimage_sorted(d+1:end-d);
            hasilFilter(i, j) = mean(subimage_trimmed);
        end
    end
end
