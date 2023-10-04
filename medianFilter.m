%% Function median filter
% handling both bipolar or unipolar impulse noise
function hasilFilter = medianFilter(citra, ukuranFilter)
    % mendapatkan ukuran citra
    [m, n] = size(citra);

    % inisialisasi output image hasil min filter
    hasilFilter = citra;

    % menghitung radius
    radius = floor(ukuranFilter / 2);
    for i = (1+radius):(m-radius)
        for j = (1+radius):(n-radius)
            % Hitung nilai medianFilter untuk sub image
            subimage = citra(i-radius:i+radius, j-radius:j+radius);
            hasilFilter(i, j) = median(subimage(:));
        end
    end
end