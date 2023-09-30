function hasilFilter = contraharmonicMeanFilter(citra, ukuranFilter, Q)
    [m, n] = size(citra);
    hasilFilter = citra;
    radius = floor(ukuranFilter / 2);
    for i = 1:m
        for j = 1:n
            atas = 0;
            bawah = 0;
            for x = max(1, i-radius):min(m, i+radius)
                for y = max(1, j-radius):min(n, j+radius)
                    atas = atas + (double(citra(x, y))^(Q + 1));
                    bawah = bawah + (double(citra(x, y))^Q);
                end
            end
            if bawah ~= 0
                hasilFilter(i, j) = atas / bawah;
            else
                hasilFilter(i, j) = 0;
            end
        end
    end
end