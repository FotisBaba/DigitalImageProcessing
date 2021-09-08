clear all;
close all;
clc;

I = imread('cameraman.tif');    %original image

%Steps 1-4

I_new = imresize(I,[30 30]);    %image resized 30x30

fft_Inew = fft2(I_new);         %fft calculation
centered_fft = fftshift(fft_Inew);  %shift

figure(1);

subplot(1,3,1), imshow(abs(centered_fft))
title('Magnitude of centered FFT')

subplot(1,3,2), imshow(I_new)
title('Rescaled Image')

subplot(1,3,3), imshow(imag(centered_fft))
title('Phase of centered FFT')

%Step 5

%size 9x9 with 0.1 step
N=9;dN=0.1;         %set parameters
[X,Y]=meshgrid([-N:dN:N],[-N:dN:N]);    %set limits

% G function
s=0.8;          %set step 0.8
G=(1/2*pi*s^2)*exp((-1/2*s^2)*(Y.^2+X.^2));     %create gaussian function

%Step 6

%fft of G filter
G_new = fft2(G);            %fft of filter

%Step 7

figure(2);

subplot(1,2,1), mesh(X,Y,abs(G_new))
title('Filter G in partial domain')

subplot(1,2,2), mesh(X,Y,imag(G_new))
title('Filter G in frequency domain')

%Step 8

conv_Im = conv2(I_new,G);   %compute convolution

%Step 9

desired_Im = zeros(181,181);    %declare matrix for multiplication result
desired_Im(1:30,1:30) = fft_Inew;       %place values of fourier tranform into matrix
combo_fft = desired_Im*G_new;       %calculate multiplication

%Step10
inverse_fft = ifft2(combo_fft);     %ifft

%Step11
c = G_new(:,1);         %columns
r = G_new(1,:);         %rows

h = toeplitz(c,r);      %toeplitz matrix
conv_new = h*desired_Im;    %convolution

%Step12
figure(3);
imshow(conv_Im)
title('Step8');

figure(4);
imshow(abs(inverse_fft))
title('Step10-partial domain');

figure(5);
imshow(abs(conv_new))
title('Step11-partial domain');

figure(6);
imshow(imag(conv_new))
title('Step11-frequency domain');

%Step13

%calculate mse

%mse between step8 and step10
bound_matrix = zeros(210,210);
bound_matrix(1:181,1:181) = inverse_fft;
err1 = immse(conv_Im,bound_matrix)

%mse between step8 and step11
bound_matrix2 = zeros(210,210);
bound_matrix2(1:181,1:181) = conv_new;
err2 = immse(conv_Im,bound_matrix2)

%mse between step 10 and step11

err3 = immse(inverse_fft,conv_new)