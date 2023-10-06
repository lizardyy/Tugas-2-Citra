function result = spatialGaussFilter(f, n)
    half_n = floor(n/2);
    sigma = (n - 1) / 4;    % nilai sigma yang bagus untuk n tersebut
    
    % membuat grid dan mask
    [x,y] = meshgrid(-half_n:half_n,-half_n:half_n);
    pangkat = -(x.^2 + y.^2)/(2*sigma*sigma);
    mask = exp(pangkat) / (2*pi*sigma*sigma);
    mask = mask / sum(sum(mask));
    
    % melakukan konvolusi dan mengembalikan hasil
    result = uint8(konvolusiCitra(double(f), mask, floor(n/2), 1));
end
