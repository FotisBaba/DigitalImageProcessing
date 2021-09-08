clear all;
close all;
clc;

X = imread('cameraman.tif');    %%original image

%%downsampling with 1/2 as scale
I1 = imresize(X,0.5,'Antialiasing',false);
I2 = imresize(X,0.5,'Antialiasing',true);

%%when antialising filter is not used
I3 = imresize(I1,2,'nearest');
I4 = imresize(I1,2,'bilinear');
I5 = imresize(I1,2); %%default method is cubic interpolation

figure(1);
subplot(1,2,1), imshow(I1), title('Downsampled image/Antialiasing = false')
subplot(1,2,2), imshow(I2), title('Downsampled image/Antialiasing = true')


figure(2);
subplot(1,3,1), imshow(I3), title('Upsample image/nearest')
subplot(1,3,2), imshow(I4), title('Upsample image/bilinear')
subplot(1,3,3), imshow(I5), title('Upsample image/bicubic')



%%calculating mse
mse1 = immse(I3,X) %% MSE with original image and upsample-nearest
mse2 = immse(I4,X) %% MSE with original image and upsample-bilinear
mse3 = immse(I5,X) %% MSE with original image and upsample-bicubic


%%when antialiasing filter is on
I3 = imresize(I2,2,'nearest');
I4 = imresize(I2,2,'bilinear');
I5 = imresize(I2,2); %%default method is cubic interpolation
figure(3);
subplot(1,3,1), imshow(I3), title('Upsample image/nearest')
subplot(1,3,2), imshow(I4), title('Upsample image/bilinear')
subplot(1,3,3), imshow(I5), title('Upsample image/bicubic');



%%calculating mse
mse1 = immse(I3,X) %% MSE with original image and upsample-nearest
mse2 = immse(I4,X) %% MSE with original image and upsample-bilinear
mse3 = immse(I5,X) %% MSE with original image and upsample-bicubic

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%downsampling with 1/4 as scale
I1 = imresize(X,0.25,'Antialiasing',false);

I2 = imresize(X,0.25,'Antialiasing',true);

figure(3);
subplot(1,2,1), imshow(I1), title('Downsampled image/Antialiasing = false')
subplot(1,2,2), imshow(I2), title('Downsampled image/Antialiasing = true')


%%when antialising filter is not used
I3 = imresize(I1,4,'nearest');
I4 = imresize(I1,4,'bilinear');
I5 = imresize(I1,4); %%default method is cubic interpolation
figure(4);
subplot(1,3,1), imshow(I3), title('Upsample image/nearest')
subplot(1,3,2), imshow(I4), title('Upsample image/bilinear')
subplot(1,3,3), imshow(I5), title('Upsample image/bicubic')


%calculating mse
mse1 = immse(I3,X) %% MSE with original image and upsample-nearest
mse2 = immse(I4,X) %% MSE with original image and upsample-bilinear
mse3 = immse(I5,X) %% MSE with original image and upsample-bicubic


%%when antialiasing filter is on
I3 = imresize(I2,4,'nearest');
I4 = imresize(I2,4,'bilinear');
I5 = imresize(I2,4); %%default method is cubic interpolation
figure(5);
subplot(1,3,1), imshow(I3), title('Upsample image/nearest')
subplot(1,3,2), imshow(I4), title('Upsample image/bilinear')
subplot(1,3,3), imshow(I5), title('Upsample image/bicubic')



%calculating mse
mse1 = immse(I3,X) %% MSE with original image and upsample-nearest
mse2 = immse(I4,X) %% MSE with original image and upsample-bilinear
mse3 = immse(I5,X) %% MSE with original image and upsample-bicubic


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%downsampling with 1/8 as scale
I1 = imresize(X,0.125,'Antialiasing',false);

I2 = imresize(X,0.125,'Antialiasing',true);

figure(6);
subplot(1,2,1), imshow(I1), title('Downsampled image/Antialiasing = false')
subplot(1,2,2), imshow(I2), title('Downsampled image/Antialiasing = true')


%%when antialising filter is not used
I3 = imresize(I1,8,'nearest');
I4 = imresize(I1,8,'bilinear');
I5 = imresize(I1,8); %%default method is cubic interpolation
figure(7);
subplot(1,3,1), imshow(I3), title('Upsample image/nearest')
subplot(1,3,2), imshow(I4), title('Upsample image/bilinear')
subplot(1,3,3), imshow(I5), title('Upsample image/bicubic')


%%calculating mse
mse1 = immse(I3,X) %% MSE with original image and upsample-nearest
mse2 = immse(I4,X) %% MSE with original image and upsample-bilinear
mse3 = immse(I5,X) %% MSE with original image and upsample-bicubic


%%when antialiasing filter is on
I3 = imresize(I2,8,'nearest');
I4 = imresize(I2,8,'bilinear');
I5 = imresize(I2,8); %%default method is cubic interpolation
figure(8);
subplot(1,3,1), imshow(I3), title('Upsample image/nearest')
subplot(1,3,2), imshow(I4), title('Upsample image/bilinear')
subplot(1,3,3), imshow(I5), title('Upsample image/bicubic')



%%calculating mse
mse1 = immse(I3,X) %% MSE with original image and upsample-nearest
mse2 = immse(I4,X) %% MSE with original image and upsample-bilinear
mse3 = immse(I5,X) %% MSE with original image and upsample-bicubic
