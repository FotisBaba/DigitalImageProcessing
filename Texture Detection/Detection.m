clear all;
close all;
clc;

I = imread('village.gif');            %original image

%Step1

for threshold = 0.1:0.01:0.2       %for threshold values of 0.1 to 0.2 with 0.01 step 
    binaryImage = im2bw(I,threshold);  %convert to binary with various threshold values
    figure();
    imshow(binaryImage);
    title(['Binary image with threshold :',num2str(threshold)])
end
threshold=0.18;                     %keep desired threshold value
final=im2bw(I,threshold);           %final conversion
figure();
imshow(final);
title(['Binary image with threshold :',num2str(threshold)])

%Step2

threshold = 0.05;       %treshold value
size = 3;               %window size
res = UrbanDetec('village.gif','village2.gif',size,threshold);      %call urbandetec to compute urban area with respect to the background
threshold = 0.1;       %treshold value
res = UrbanDetec('village.gif','village2.gif',size,threshold);      %call urbandetec to compute urban area with respect to the background
threshold = 0.15;       %treshold value
res = UrbanDetec('village.gif','village2.gif',size,threshold);      %call urbandetec to compute urban area with respect to the background
threshold = 0.18;       %treshold value
res = UrbanDetec('village.gif','village2.gif',size,threshold);      %call urbandetec to compute urban area with respect to the background
threshold = 0.2;       %treshold value
res = UrbanDetec('village.gif','village2.gif',size,threshold);      %call urbandetec to compute urban area with respect to the background


threshold = 0.05;       %treshold value
size = 5;               %window size
res = UrbanDetec('village.gif','village2.gif',size,threshold);      %call urbandetec to compute urban area with respect to the background
threshold = 0.1;       %treshold value
res = UrbanDetec('village.gif','village2.gif',size,threshold);      %call urbandetec to compute urban area with respect to the background
threshold = 0.15;       %treshold value
res = UrbanDetec('village.gif','village2.gif',size,threshold);      %call urbandetec to compute urban area with respect to the background
threshold = 0.18;       %treshold value
res = UrbanDetec('village.gif','village2.gif',size,threshold);      %call urbandetec to compute urban area with respect to the background
threshold = 0.2;       %treshold value
res = UrbanDetec('village.gif','village2.gif',size,threshold);      %call urbandetec to compute urban area with respect to the background


threshold = 0.05;       %treshold value
size = 7;               %window size
res = UrbanDetec('village.gif','village2.gif',size,threshold);      %call urbandetec to compute urban area with respect to the background
threshold = 0.1;       %treshold value
res = UrbanDetec('village.gif','village2.gif',size,threshold);      %call urbandetec to compute urban area with respect to the background
threshold = 0.15;       %treshold value
res = UrbanDetec('village.gif','village2.gif',size,threshold);      %call urbandetec to compute urban area with respect to the background
threshold = 0.18;       %treshold value
res = UrbanDetec('village.gif','village2.gif',size,threshold);      %call urbandetec to compute urban area with respect to the background
threshold = 0.2;       %treshold value
res = UrbanDetec('village.gif','village2.gif',size,threshold);      %call urbandetec to compute urban area with respect to the background

%Step3

%Step3.1
dims = 2;                                  %for 2x2 dimension usage         
se = strel('rectangle', [dims dims]);       %declare structural element
    

% Perform top-hat filtering without using imtophat()
th = imerode(I, se);    %tophat filtering using imerode()
tophat = I - th;        %subtracting from original
figure();
imshow(tophat);
title('TH filtering');

    
%bot-hat filtering without using imbothat function
bh=imdilate(I, se);     %bothat filtering using imdilate()
bothat = bh - I;        %subtracting from original
figure();
imshow(bothat);
title('BH filtering');

%Step3.2
normalizedTH = im2double(tophat);       %normalize filtered 
normalizedBH = im2double(bothat);       %images
figure();
imshow(normalizedTH);
title('normalized TH');
figure();
imshow(normalizedBH);
title('normalized BH');


%Step3.3 (& Step3.4)
%otsu method    
 threshold = graythresh(normalizedTH);  %obtain otsu's threshold
 BWTH = im2bw(normalizedTH,threshold);  %and convert to binary
 figure();
 imshow(BWTH);
 title('OTSU tophat');

 threshold = graythresh(normalizedBH);  %obtain otsu's threshold
 BWBH = im2bw(normalizedBH,threshold);   %and convert to binary
 figure();
 imshow(BWBH);
 title('OTSU bothat');
 
%Step3.5
 OBWTH = imopen(BWTH,se);       %open binary tophat using imopen()
 figure();
 imshow(OBWTH);
 title('Opened tophat');
 
%Step3.6
 CBWBH = imclose(BWBH,se);      %close binary bothat using imclose()
 OCBWBH = imopen(CBWBH,se);     %and then open using imopen() for the sketch 
 figure();
 imshow(OCBWBH);
 title('Closed bothat');
%Step3.7
 final= imfuse(OCBWBH,OBWTH);   %fuse the binary images to obtain final result
 figure();
 imshow(final);
 title('final');





























