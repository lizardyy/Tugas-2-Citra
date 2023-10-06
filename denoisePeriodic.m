% Cara diambil dari https://doi.org/10.1049/iet-ipr.2018.5707
% "Adaptive Gaussian notch filter for removing periodic noise from digital images"
function result = denoisePeriodic(f)
    % Parameters
    center_radius = 6;
    th = 0.35;
    wmax = 5;
    
    F = fftshift(fft2(f));  % do dft and shift to the input image

    Fout = F;
    [M, N, numChannels] = size(F);
    for i = 1:floor(M/2)
        for j = 1:N
            % skip the edge
            if i-wmax < 1 || i+wmax > M || j-wmax < 1 || j+wmax > N
                continue;
            end
            
            % begin the process
            f1 = false;
            if numChannels == 3
                f1 = [false, false, false];
            end
            d = sqrt((i - M/2)^2 + (j - N/2)^2);
            if d > center_radius    % avoid masking the center bright spot
                w1 = 3;
                w2 = w1 + 2;
                stop = false;
                while stop == false
                    w2 = w1+2;
                    
                    % calculate average value of F in a window
                    s1 = F(i-w1:i+w1, j-w1:j+w1, 1:numChannels);
                    s2 = F(i-w2:i+w2, j-w2:j+w2, 1:numChannels) - padarray(s1, [w2-w1, w2-w1], 0);
                    
                    s1 = mean(mean(abs(s1)));  % calculate average of F covered in w1xw1 window
                    s2 = mean(mean(abs(s2))); % calculate average of F covered in w2xw2 window outside w1xw1
                    
                    f1 = (s2 ./ s1) <= th;
                    if numChannels == 1
                        if f1  % if inner window significantly brighter than outside window,
                            if w2 >= wmax   % limit w2 so it is not too big
                                stop = true;
                            else
                                w1 = w1 + 2;    % increase window size, in case bright spot is larger
                            end
                        else
                            stop = true;
                        end
                    elseif numChannels == 3
                        if f1(1) == true || f1(2) == true || f1(3) == true  % if inner window significantly brighter than outside window,
                            if w2 >= wmax       % limit w2 (maks is wmax) so it is not too big
                                stop = true;
                            else
                                w1 = w1 + 2;    % increase window size, in case bright spot is larger
                            end
                        else
                            stop = true;
                        end
                    end
                end

                % apply notch filter to (i,j) and its mirror (M-i,N-j)
                for k = 1:numChannels
                    if f1(k) == true
                        % calculate gaussian notch filter
                        u = i-w2:i+w2;
                        v = j-w2:j+w2;
                        [V, U] = meshgrid(v, u);
                        D = sqrt((U-i).^2 + (V-j).^2);
                        H = 1 - exp(-0.5 * D.^2 / w2.^2);

                        % apply notch filter to (i,j) and its mirror (M-i,N-j)
                        Fout(i-w2:i+w2, j-w2:j+w2, k) = H .* Fout(i-w2:i+w2, j-w2:j+w2, k);
                        Fout(M-(i+w2):M-(i-w2), N-(j+w2):N-(j-w2), k) = H .* Fout(M-(i+w2):M-(i-w2), N-(j+w2):N-(j-w2), k);
                    end
                end
            end
        end
    end

    result =  uint8(real(ifft2(ifftshift(Fout))));  % convert back to proper image
end