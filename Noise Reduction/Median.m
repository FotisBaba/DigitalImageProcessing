function Exercise1
        I1 = imread('noisyimg.png');        %input 1
        I2 = imread('noisyimg2.png');       %input 2


        K = ones(3, 3);                     %initialize kernel with 3 dimensions
        new_image1 = Compute_Median(I1, K); %call meadian function for input 1
        new_image2 = Compute_Median(I2, K); %call meadian function for input 2

        figure;
        subplot(1,2,1), imshow(I1);
        title(['Noisy Image 1']);
        subplot(1,2,2), imshow(new_image1);
        title(['Noisy Image 1 compute_median output. K = 3x3.']);

        figure;   
        subplot(1,2,1), imshow(I2);
        title(['Noisy Image 2'])
        subplot(1,2,2), imshow(new_image2);
        title(['Image 2 compute_median output. K = 3x3.']);

        K = ones(5, 5);                         %initialize kernel with 5 dimensions
        new_image1 = Compute_Median(I1, K);     %call meadian function for input 1
        new_image2 = Compute_Median(I2, K);     %call meadian function for input 2

        figure;
        subplot(1,2,1), imshow(I1);
        title(['Noisy Image 1'])
        subplot(1,2,2), imshow(new_image1);
        title(['Image 1 compute_median output. K = 5x5.']);

        figure;   
        subplot(1,2,1), imshow(I2);
        title(['Noisy Image 2'])
        subplot(1,2,2), imshow(new_image2);
        title(['Image 2 compute_median output. K = 5x5.']);

        K = ones(9, 9);                         %initialize kernel with 9 dimensions
        new_image1 = Compute_Median(I1, K);     %call meadian function for input 1
        new_image2 = Compute_Median(I2, K);     %call meadian function for input 2

        figure;
        subplot(1,2,1), imshow(I1);
        title(['Noisy Image 1'])
        subplot(1,2,2), imshow(new_image1);
        title(['Image 1 compute_median output. K = 9x9.']);

        figure;   
        subplot(1,2,1), imshow(I2);
        title(['Noisy Image 2'])
        subplot(1,2,2), imshow(new_image2);
        title(['Image 2 compute_median output. K = 9x9.']);
end

