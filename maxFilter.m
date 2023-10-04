%% Function max filter
% finding the brightest point in an image
% reducing papper noise
function hasilFilter = maxFilter(citra, ukuranFilter)
    % mendapatkan ukuran citra
    [m, n] = size(citra);

    % inisialisasi output image hasil min filter
    hasilFilter = citra;

    % menghitung radius
    radius = floor(ukuranFilter / 2);
    for i = (1+radius):(m-radius)
        for j = (1+radius):(n-radius)
            % Hitung nilai maxFilter untuk sub image
            subimage = citra(i-radius:i+radius, j-radius:j+radius);
            hasilFilter(i, j) = max(subimage(:));
        end
    end
end