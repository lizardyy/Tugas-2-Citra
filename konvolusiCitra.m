function hasilKonvolusi = konvolusiCitra(f, mask, padding, stride)
    [m, n, numChannels] = size(f);
    [maskM, maskN] = size(mask);
    
    % Padding citra jika diperlukan
    if padding > 0
        f = padarray(f, [padding, padding], 0, 'both');
        [m, n, ~] = size(f);
    end
    
    % Inisialisasi citra hasil konvolusi
    hasilM = floor((m - maskM) / stride) + 1;
    hasilN = floor((n - maskN) / stride) + 1;
    hasilKonvolusi = zeros(hasilM, hasilN, numChannels);
    
    % Loop melalui citra f untuk melakukan konvolusi
    for i = 1:hasilM
        for j = 1:hasilN
            for k = 1:numChannels
                % Tentukan batas atas dan bawah indeks untuk konvolusi
                atas = (i - 1) * stride + 1;
                bawah = atas + maskM - 1;
                kiri = (j - 1) * stride + 1;
                kanan = kiri + maskN - 1;

                % Hitung nilai konvolusi untuk piksel saat ini
                subCitra = f(atas:bawah, kiri:kanan, k);
                hasilKonvolusi(i, j, k) = sum(sum(subCitra .* mask));
            end
        end
    end
end