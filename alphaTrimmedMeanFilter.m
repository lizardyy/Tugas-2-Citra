% Fungsi untuk menghilangkan derau dengan alpha-trimmed mean filter
function hasilFilter = alphaTrimmedMeanFilter(citra, ukuranFilter, alpha)
    [m, n] = size(citra);
    hasilFilter = citra;
    radius = floor(ukuranFilter / 2);
    for i = (1+radius):(m-radius)
        for j = (1+radius):(n-radius)
            subCitra = citra(i-radius:i+radius, j-radius:j+radius);
            subCitra = double(subCitra(:));
            subCitraSorted = sort(subCitra);
            subCitraTrimmed = subCitraSorted(alpha+1:end-alpha);
            hasilFilter(i, j) = uint8(mean(subCitraTrimmed(:)));
        end
    end
end
