function hasilFilter = arithmeticMeanFilter(citra, ukuranFilter)
    filter = ones(ukuranFilter) / ukuranFilter^2;
    hasilFilter = imfilter(citra, filter, 'replicate');
end