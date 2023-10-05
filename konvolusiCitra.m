% % Melakukan konvolusi citra berukuran sembarang (M x N) dengan mask
% berukuran N x N yang telah ditentukan. Contoh mask 3x3, dan 7x7 gaussian mask
function hasilKonvolusi = konvolusiCitra(citra , mask, padding, stride)
    % mendapatkan ukuran citra dan jumlah saluran warna
    [m, n, numChannels] = size(citra );
    % mendapatkan ukuran mask
    [maskM, maskN] = size(mask);
    
    % menambahkan Padding citra 
    if padding > 0
        citra  = padarray(citra , [padding, padding], 0, 'both');
        [m, n, ~] = size(citra);
    end
    
    % Inisialisasi citra hasil konvolusi
    hasilM = floor((m - maskM) / stride) + 1;
    hasilN = floor((n - maskN) / stride) + 1;
    hasilKonvolusi = zeros(hasilM, hasilN, numChannels);
    
    % Loop melalui citra citra  untuk melakukan konvolusi
    for i = 1:hasilM
        for j = 1:hasilN
            for k = 1:numChannels
                % Tentukan batas atas dan bawah indeks untuk konvolusi
                atas = (i - 1) * stride + 1;
                bawah = atas + maskM - 1;
                kiri = (j - 1) * stride + 1;
                kanan = kiri + maskN - 1;

                % Hitung nilai konvolusi untuk piksel saat ini
                subCitra = citra(atas:bawah, kiri:kanan, k);
                hasilKonvolusi(i, j, k) = sum(sum(subCitra .* mask));
            end
        end
    end
end