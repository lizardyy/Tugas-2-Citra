function result = spatialMeanFilter(f, n)
    mask = ones(n, n) / (n * n);
    result = uint8(konvolusiCitra(double(f), mask, floor(n/2), 1));
end
