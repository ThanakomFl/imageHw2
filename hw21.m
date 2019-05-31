  % 2.1 %
  img = imread('Cross.pgm');
  [X,Y] = size(img);
  img_fft = fft2(double(img));
  figure
  imshow(img,[]);
  title('origin');
  u = 1 : X;
  v = 1 : Y;

  currentx = find(u>X/2);
  u(currentx) = u(currentx)-X;
  
  currenty = find(v>Y/2);
  v(currenty) = v(currenty)-Y;
  
  [U,V] = meshgrid(u,v);
  D = sqrt((U.^2) + (V.^2));

  % ideal low pass %
  H10 = double(D <= 10);
  G10 = H10.*img_fft;
  ideal10 = ifft2(G10);
  figure;
  imshow(ideal10,[]);
  title('ideal low pass (10)');
  
  H20 = double(D <= 20);
  G20 = H20.*img_fft;
  ideal20 = ifft2(G20);
  figure;
  imshow(ideal20,[]);
  title('ideal low pass (20)');
  
  H30 = double(D <= 30);
  G30 = H30.*img_fft;
  ideal30 = ifft2(G30);
  figure;
  imshow(ideal30,[]);
  title('ideal low pass (30)');
  
  H40 = double(D <= 40);
  G40 = H40.*img_fft;
  ideal40 = ifft2(G40);
  figure;
  imshow(ideal40,[]);
  title('ideal low pass (40)');
  
  H50 = double(D <= 50);
  G50 = H50.*img_fft;
  ideal50 = ifft2(G50);
  figure;
  imshow(ideal50,[]);
  title('ideal low pass (50)');

% gaussian lowpass filter %
  
  H_glf10 = exp(-(D.^2)./(2.*10).^2);
  G_glf10 = H_glf10.*img_fft;
  GLF10 = ifft2(G_glf10);
  figure;
  imshow(GLF10,[]);
  title('Gaussian lowpass filter (10)' );
  
  H_glf20 = exp(-(D.^2)./(2.*20).^2);
  G_glf20 = H_glf20.*img_fft;
  GLF20 = ifft2(G_glf20);
  figure;
  imshow(GLF20,[]);
  title('Gaussian lowpass filter (20)' );
  
  H_glf30 = exp(-(D.^2)./(2.*30).^2);
  G_glf30 = H_glf30.*img_fft;
  GLF30 = ifft2(G_glf30);
  figure;
  imshow(GLF30,[]);
  title('Gaussian lowpass filter (30)' );
  
  H_glf40 = exp(-(D.^2)./(2.*40).^2);
  G_glf40 = H_glf40.*img_fft;
  GLF40 = ifft2(G_glf40);
  figure;
  imshow(GLF40,[]);
  title('Gaussian lowpass filter (40)' );
  
  H_glf50 = exp(-(D.^2)./(2.*50).^2);
  G_glf50 = H_glf50.*img_fft;
  GLF50 = ifft2(G_glf50);
  figure;
  imshow(GLF50,[]);
  title('Gaussian lowpass filter (50)' );

  % butterworth lowpass filter %
  n = 1;
  
  H_blf10 = (1 + ((D./10).^(2*n))).^(-1);
  G_blf10 = H_blf10.*img_fft;
  BLF10 = ifft2(G_blf10);
  figure;
  imshow(BLF10,[]);
  title('Butterworth lowpass filter (10)');
  
  H_blf20 = (1 + ((D./20).^(2*n))).^(-1);
  G_blf20 = H_blf20.*img_fft;
  BLF20 = ifft2(G_blf20);
  figure;
  imshow(BLF20,[]);
  title('Butterworth lowpass filter (20)');
  
  H_blf30 = (1 + ((D./30).^(2*n))).^(-1);
  G_blf30 = H_blf30.*img_fft;
  BLF30 = ifft2(G_blf30);
  figure;
  imshow(BLF30,[]);
  title('Butterworth lowpass filter (30)');
  
  H_blf40 = (1 + ((D./40).^(2*n))).^(-1);
  G_blf40 = H_blf40.*img_fft;
  BLF40 = ifft2(G_blf40);
  figure;
  imshow(BLF40,[]);
  title('Butterworth lowpass filter (40)');
  
  H_blf50 = (1 + ((D./50).^(2*n))).^(-1);
  G_blf50 = H_blf50.*img_fft;
  BLF50 = ifft2(G_blf50);
  figure;
  imshow(BLF50,[]);
  title('Butterworth lowpass filter (50)');

  
  