function hasilFilter = midpointFilter(citra, ukuranFilter)
    % hitung min filter
    minFiltered = minFilter(citra, ukuranFilter);

    % hitung max filter
    maxFiltered = maxFilter(citra, ukuranFilter);

    % hitung midpoint
    hasilFilter = (minFiltered + maxFiltered) / 2;
end