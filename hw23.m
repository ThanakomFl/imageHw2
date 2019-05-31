%Hw 2.2
Chess_noice = 'Chess_noise.pgm';
Lenna_noise = 'Lenna_noise.pgm';
Chess = 'Chess.pgm';
Lenna = 'Lenna.pgm';
xxx = imread(Chess_noice);
xx = imread(Lenna);


ILP10 = idealLowPassFilter(Lenna_noise,20);



RMIPF10 = RMSs(xx,ILP10);







function res = idealLowPassFilter(img,C)
    image_input = imread(img);
    [M,N]=size(image_input);
    Image_FFT=fft2(double(image_input));
    
    u=0:(M-1);
    v=0:(N-1);

    xx=find(u>M/2);
    u(xx)=u(xx)-M;
    yy=find(v>N/2);
    v(yy)=v(yy)-N;
    [V,U]=meshgrid(v,u);
    D=sqrt(U.^2+V.^2);
    
    H=double(D<=C);
    
    outputFtt=H.*Image_FFT;
    res=uint8(real(ifft2(double(outputFtt))));
    %figure; imshow(res,[]);

end



function x = RMSs(oImg,nImh)
    temp_err = (single(oImg) - single(nImh)).^2;
    mean = sum(temp_err(:)) / numel(oImg);
    x = sqrt(mean);
end