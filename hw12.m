% 1.1 %
ima = imread('Cross.pgm');
padimage = padarray(ima,[28 28],'both');
imagefft = fft2(double(padimage));
shiftedfft = fftshift(imagefft);
amp = log(abs(shiftedfft));

phase = angle(shiftedfft);



% 1.3 %
rotate_img = imrotate(ima,30,'bilinear','crop');
Mrot = ~imrotate(true(size(ima)),30); 
rotate_img(Mrot&~imclearborder(Mrot)) = 255;


rotate_padimage = padarray(rotate_img,[28 28],255,'both');
rotate_imagefft = fft2(double(rotate_padimage));
rotate_shiftedfft = fftshift(rotate_imagefft);
rotate_amp = log(abs(rotate_shiftedfft));
figure;
imshow(rotate_padimage);
colormap gray
title('Image Rotate');
