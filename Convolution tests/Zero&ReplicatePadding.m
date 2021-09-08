clear all;
close all;
clc;



K = 1/16*[1 2 1;2 4 2;1 2 1];

I = imread('lena_gray_512.tif');    %original image
z_pad = padarray(im2double(I),[1 1]); % zero padded image,also typacasted
                                        %to double

r_pad = padarray(im2double(I),[1 1],'replicate'); %padded image with
                                        %replicas of boarders of the image
                                        
                                        

convImage1 = convolution(z_pad,K); %convoluting zero padded image with the K filter
dImage = im2double(I); % typecast to double for mse function
%mse and peak2peak SNR
mse1 = immse(convImage1,z_pad);
peaksnr1 = psnr(convImage1,z_pad);


%process1 zero padding the boarders of image with replicas of boarders of
%image
convImage2 = convolution(r_pad,K);
dImage=im2double(I);
%mse and peak2peak SNR
mse2 = immse(convImage2,r_pad);
peaksnr2 = psnr(convImage2,r_pad);



%process 1-->conv2 with zero padding on image
convImage3 = conv2(z_pad,K,'same');
mse3 = immse(convImage3,z_pad);
peaksnr3 = psnr(convImage3,z_pad);

%process 2-->conv2 with boarder image padding
convImage4 = conv2(r_pad,K,'same');
mse4 = immse(convImage4,r_pad);
peaksnr4 = psnr(convImage4,r_pad);



%process 1-->imfilter with zero padding on image
convImage5 = imfilter(z_pad,K,'conv');
mse5 = immse(convImage5,z_pad)
peaksnr5 = psnr(convImage5,z_pad)

%process 2-->imfilter with boarder image padding
convImage6 = imfilter(r_pad,K,'conv');
mse6 = immse(convImage6,r_pad)
peaksnr6 = psnr(convImage6,r_pad)





%Here we see all the images to compare results
figure(1);
imshow(I) , title('original image');

figure(2);
subplot(1,2,1), imshow(convImage1), title('zeroPadding/Our function')
subplot(1,2,2), imshow(convImage2), title('boarderPadding/Our function');

figure(3);
subplot(1,2,1), imshow(convImage3), title('zeroPadding/conv2 function')
subplot(1,2,2), imshow(convImage4), title('boarderPadding/conv2 function');

figure(4);
subplot(1,2,1), imshow(convImage5), title('zeroPadding/imfilter function')
subplot(1,2,2), imshow(convImage6), title('boarderPadding/imfilter function');
