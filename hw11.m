% 1.1 %
ima = imread('Cross.pgm');
padimage = padarray(ima,[28 28],'both');
imagefft = fft2(double(padimage));
shiftedfft = fftshift(imagefft);
amp = log(abs(shiftedfft));
figure;
imshow(amp,[]);
colormap gray
title('Amplitude');
phase = angle(shiftedfft);
figure;
imshow(phase,[]);
colormap gray
title('Phase spectra');

% 1.2 %
x = -128:127;
y = -128:127;
[X,Y] = meshgrid(x,y);
complex_number = exp(-2j*pi*(((20*X)/256)+((30*Y)/256)));
new_phase = complex_number.*phase;
ifftshifted = ifftshift(new_phase);
img_ifft = ifft2(ifftshifted);
img_ifft = abs(img_ifft);
figure;
imshow(img_ifft);
colormap gray
title('inverse fourier transform');

% 1.3 %
rotate_img = imrotate(ima,30,'bilinear','crop');
rotate_padimage = padarray(rotate_img,[28 28],255,'both');
rotate_imagefft = fft2(double(rotate_padimage));
rotate_shiftedfft = fftshift(rotate_imagefft);
rotate_amp = log(abs(rotate_shiftedfft));
figure;
imshow(rotate_padimage);
colormap gray
title('Image Rotate');
figure;
imshow(rotate_amp,[]);
colormap gray
title('Amplitude Rotate');
rotate_phase = angle(rotate_shiftedfft);
figure;
imshow(rotate_phase,[]);
colormap gray
title('Phase spectra Rotate');

% 1.4 %
ima_down = ima(1:2:end,1:2:end);
padimage_down = padarray(ima_down,[14 14],'both');
imagefft_down = fft2(double(padimage_down));
shiftedfft_down = fftshift(imagefft_down);
amp_down = log(abs(shiftedfft_down));
figure;
imshow(amp_down,[]);
colormap gray
title('Amplitude Down');
phase_down = angle(shiftedfft_down);
figure;
imshow(phase_down,[]);
colormap gray
title('Phase spectra Down');

% 1.5.1 %
inverse_amp = ifftshift(amp);
ifft_amp = ifft2(inverse_amp); 
figure;
imshow(inverse_amp,[]);
colormap gray
title('Amplitude Inverse FFT');

% 1.5.2 %
inverse_phase = ifftshift(phase);
inverse_phase = ifft2(inverse_phase);
inverse_phase = abs(inverse_phase);
figure;
imshow(inverse_phase,[]);
colormap gray
title('Phase Inverse FFT');

% 1.6 %
ima_lenna = imread('Lenna.pgm');
imagefft_lenna = fft2(double(ima_lenna));
shiftedfft_lenna = fftshift(imagefft_lenna);
amp_lenna = log(abs(shiftedfft_lenna));
phase_lenna = angle(shiftedfft_lenna);

inverse_amp_lenna = ifftshift(amp_lenna);
ifft_amp_lenna = ifft2(inverse_amp_lenna); 
figure;
imshow(inverse_amp_lenna,[]);
colormap gray
title('Lenna Amplitude Inverse FFT');

inverse_phase_lenna = ifftshift(phase_lenna);
inverse_phase_lenna = ifft2(inverse_phase_lenna);
inverse_phase_lenna = abs(inverse_phase_lenna);
figure;
imshow(inverse_phase_lenna,[]);
colormap gray
title('Lenna Phase Inverse FFT');

% 1.7 %
ima_chess = imread('Chess.pgm');
ima_chess = padarray(ima_chess,[1 1],'both');
ima_chess_new = ima_chess(2:end-1,2:end-1);
[X,Y] = size(ima_chess_new);
kernel = ones(3,3);
kernel = kernel./9;

for i = 1:X
    for j = 1:Y
        avg = 0;
        for k = 1:3
            for l = 1:3
                avg = avg + ima_chess(i+k-1,j+l-1).*kernel(k,l);
            end 
        end
        ima_chess_new(i,j) = double(avg);
    end
end    

ima_chess_fft = fft2(double(ima_chess_new));
shifted_ima_chess_fft = fftshift(ima_chess_fft);


pad_kernel = padarray(kernel,[253 253],'post');
kernel_fft = fft2(double(pad_kernel));
shifted_kernel_fft = fftshift(kernel_fft);

ima_chess_fillter = shifted_kernel_fft.*shifted_ima_chess_fft;
ima_blur_ifft = ifftshift(ima_chess_fillter);
ima_blur_ifft = ifft2(ima_blur_ifft);
ima_blur_ifft = abs(ima_blur_ifft);

figure;
imshow(ima_chess_new,[]);
colormap gray
title('Convolution');

figure;
imshow(ima_blur_ifft,[]);
colormap gray
title('Frequency Domain');


