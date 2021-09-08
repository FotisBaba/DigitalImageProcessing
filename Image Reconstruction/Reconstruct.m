clear all;
close all;
clc;



I = im2double(imread('cameraman.tif'));    %image typecasted to double
G = fspecial('gaussian',[5 5],1);   %gaussian filter
convImage = imfilter(I,G);  %convolved image with filter

%layer zero is the original image
layer0 = I;

%layer 1 is using the original image scaled
I1 = imresize(convImage,0.5,'Antialiasing',false);   %downsampling our image
layer1 = I1;

convImage2 = imfilter(I1,G);    %convolution
I2 = imresize(convImage2,0.5,'Antialiasing',false);
layer2 = I2;

convImage3 = imfilter(I2,G);    %convolution
I3 = imresize(convImage3,0.5,'Antialiasing',false);
layer3 = I3;

%layer 4 has used all the previous layers
convImage4 = imfilter(I3,G);    %convolution
I4 = imresize(convImage4,0.5,'Antialiasing',false);
layer4 = I4;      

   

%plots
figure(1);
imshow(I), title('layer0')
figure(2);
imshow(layer4), title('layer4')
figure(3);
imshow(layer3), title('layer3')
figure(4);
imshow(layer2), title('layer2')
figure(5);
imshow(layer1), title('layer1')


%Laplacian filters
%laplacian layer0
temp0 = imresize(layer1,2,'Antialiasing',false);
Llayer0 = layer0 - temp0;
%laplacian layer1
temp1 = imresize(layer2,2,'Antialiasing',false); 
Llayer1 = layer1 - temp1;
%laplacian layer2
temp2 = imresize(layer3,2,'Antialiasing',false); 
Llayer2 = layer2 - temp2;
%laplacian layer3
temp3 = imresize(layer4,2,'Antialiasing',false); 
Llayer3 = layer3 - temp3;
%laplacian layer4
Llayer4 = layer4;

%check our results
figure(6);
colormap(gray)
imagesc(Llayer4), title('Llayer4')
figure(7);
colormap(gray)
imagesc(Llayer3), title('Llayer3')
figure(8);
colormap(gray)
imagesc(Llayer2), title('Llayer2')
figure(9);
colormap(gray)
imagesc(Llayer1), title('Llayer1')
figure(10);
colormap(gray)
imagesc(Llayer0), title('Llayer0')

%reconstruct the original image
%upsample the top of the Laplacian pyramid, which is the same for the
%Gaussian pyramid, and add the next Laplacian layer
outImage4=imresize(Llayer4,2,'bicubic')+Llayer3;
%In level 3 of the Laplacian pyramid the image with the details
%is the Gaussian's pyramid level 3 image, so we expand that signal
%and then add the current Laplacian layer
outImage3=imresize(outImage4,2,'bicubic')+Llayer2;
outImage2=imresize(outImage3,2,'bicubic')+Llayer1;
outImage1=imresize(outImage2,2,'bicubic')+Llayer0;
msee = immse(outImage1,I)

figure(11);
subplot(1,2,1), imshow(outImage1), title('reconstructed image')
subplot(1,2,2), imshow(I), title('original image')


