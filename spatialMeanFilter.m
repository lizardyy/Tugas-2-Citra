function result = spatialMeanFilter(f, n)
    mask = ones(n, n) / (n * n);
    result = konvolusiCitra(f, mask, floor(n/2), 1);
end
