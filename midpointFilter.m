function hasilFilter = midpointFilter(citra, ukuranFilter)
    minFiltered = minFilter(citra, ukuranFilter);
    maxFiltered = maxFilter(citra, ukuranFilter);
    hasilFilter = (minFiltered + maxFiltered) / 2;
end