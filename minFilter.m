%% Function min filter
% finding the darkest point in an image
% reducing salt noise
function hasilFilter = minFilter(citra, ukuranFilter)
    % mendapatkan ukuran citra
    [m, n] = size(citra);
    
    % inisialisasi output image hasil min filter
    hasilFilter = citra;

    % menghitung radius
    radius = floor(ukuranFilter / 2);
    for i = (1+radius):(m-radius)
        for j = (1+radius):(n-radius)
            % Hitung nilai minFilter untuk sub image
            subimage = citra(i-radius:i+radius, j-radius:j+radius);
            hasilFilter(i, j) = min(subimage(:));
        end
    end
end