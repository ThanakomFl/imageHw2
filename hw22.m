  % 2.2 %
  img_noise = imread('Lenna_noise.pgm');
  img_ori = imread('Lenna.pgm');
  %img_noise = imread('Chess_noise.pgm');
  %img_ori = imread('Chess.pgm');
  [X,Y] = size(img_noise);
  img_fft = fft2(double(img_noise));
  
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
   
    % RMS ideal low pass %
    ideal_er10 = (single(img_ori) - single(ideal10)).^2;
    ideal_mean10 = sum(ideal_er10(:)) / numel(img_ori);
    ideal_rmsError10 = sqrt(ideal_mean10);
    
    ideal_er20 = (single(img_ori) - single(ideal20)).^2;
    ideal_mean20 = sum(ideal_er20(:)) / numel(img_ori);
    ideal_rmsError20 = sqrt(ideal_mean20);
   
    ideal_er30 = (single(img_ori) - single(ideal30)).^2;
    ideal_mean30 = sum(ideal_er30(:)) / numel(img_ori);
    ideal_rmsError30 = sqrt(ideal_mean30);
  
    ideal_er40 = (single(img_ori) - single(ideal40)).^2;
    ideal_mean40 = sum(ideal_er40(:)) / numel(img_ori);
    ideal_rmsError40 = sqrt(ideal_mean40);
    
    ideal_er50 = (single(img_ori) - single(ideal50)).^2;
    ideal_mean50 = sum(ideal_er50(:)) / numel(img_ori);
    ideal_rmsError50 = sqrt(ideal_mean50);
  
    % RMS gaussian lowpass filter %
    
    GLF_er10 = (single(img_ori) - single(GLF10)).^2;
    GLF_mean10 = sum(GLF_er10(:)) / numel(img_ori);
    GLF_rmsError10 = sqrt(GLF_mean10);
    
    GLF_er20 = (single(img_ori) - single(GLF20)).^2;
    GLF_mean20 = sum(GLF_er20(:)) / numel(img_ori);
    GLF_rmsError20 = sqrt(GLF_mean20);
   
    GLF_er30 = (single(img_ori) - single(GLF30)).^2;
    GLF_mean30 = sum(GLF_er30(:)) / numel(img_ori);
    GLF_rmsError30 = sqrt(GLF_mean30);
  
    GLF_er40 = (single(img_ori) - single(GLF40)).^2;
    GLF_mean40 = sum(GLF_er40(:)) / numel(img_ori);
    GLF_rmsError40 = sqrt(GLF_mean40);
    
    GLF_er50 = (single(img_ori) - single(GLF50)).^2;
    GLF_mean50 = sum(GLF_er50(:)) / numel(img_ori);
    GLF_rmsError50 = sqrt(GLF_mean50);
    
    % RMS butterworth lowpass filter %
    
    BLF_er10 = (single(img_ori) - single(BLF10)).^2;
    BLF_mean10 = sum(BLF_er10(:)) / numel(img_ori);
    BLF_rmsError10 = sqrt(BLF_mean10);
    
    BLF_er20 = (single(img_ori) - single(BLF20)).^2;
    BLF_mean20 = sum(BLF_er20(:)) / numel(img_ori);
    BLF_rmsError20 = sqrt(BLF_mean20);
   
    BLF_er30 = (single(img_ori) - single(BLF30)).^2;
    BLF_mean30 = sum(BLF_er30(:)) / numel(img_ori);
    BLF_rmsError30 = sqrt(BLF_mean30);
  
    BLF_er40 = (single(img_ori) - single(BLF40)).^2;
    BLF_mean40 = sum(BLF_er40(:)) / numel(img_ori);
    BLF_rmsError40 = sqrt(BLF_mean40);
    
    BLF_er50 = (single(img_ori) - single(BLF50)).^2;
    BLF_mean50 = sum(BLF_er50(:)) / numel(img_ori);
    BLF_rmsError50 = sqrt(BLF_mean50);
 

   % Median filter %  
   
  img_noise_pad = padarray(img_noise , [1 1] , 'both');
  [X,Y] = size(img_noise);
  img_noise_new = img_noise_pad(2:end-1,2:end-1);
  arr = ones(9,1);
 
  for i = 1:X
      for j = 1:Y
          current = 1;
          for m = 1:3
              for n = 1:3
                  arr(current) = img_noise_pad(i+m-1,j+n-1);
                  current = current + 1;
              end
          end
          MF(i,j) = median(arr);
      end
  end
  
  figure;
  imshow(MF,[]);
  title('median filter');
 % RMS Median filter %   
 
    MF_er = (single(img_ori) - single(MF)).^2;
    MF_mean = sum(MF_er(:)) / numel(img_ori);
    MF_rmsError = sqrt(MF_mean);