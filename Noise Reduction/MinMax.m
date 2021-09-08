function Exercise2()
    
    I1 = imread('noisyimg.png');
    I2 = imread('noisyimg2.png');

    K = ones(3, 3);                     %initialize kernel with 3 dimensions
    I_newMin1 = Compute_Min(I1, K);     %call min function for input 1
    I_newMax1 = Compute_Max(I1, K);     %call max function for input 2
    
    I_newMin2 = Compute_Min(I2, K);     %call min function for input 1
    I_newMax2 = Compute_Max(I2, K);     %call max function for input 2
    
    figure;
    subplot(1,3,1), imshow(I1);
    title(['Noisy Image 1']);
    subplot(1,3,2), imshow(I_newMin1);
    title(['Image 1 computeMin() output. K = 3x3.']);
    subplot(1,3,3), imshow(I_newMax1);
    title(['Image 1 computeMax() output. K = 3x3.']);

    figure;
    subplot(1,3,1), imshow(I2);
    title(['Noisy Image 2']);
    subplot(1,3,2), imshow(I_newMin2);
    title(['Image 2 computeMin() output. K = 3x3.']);
    subplot(1,3,3), imshow(I_newMax2);
    title(['Image 2 computeMax() output. K = 3x3.']);
    
    K = ones(5, 5);                     %initialize kernel with 5 dimensions

    I_newMin1 = Compute_Min(I1, K);     %call min function for input 1
    I_newMax1 = Compute_Max(I1, K);     %call max function for input 2
    
    I_newMin2 = Compute_Min(I2, K);     %call min function for input 1
    I_newMax2 = Compute_Max(I2, K);     %call max function for input 2
    
    figure;
    subplot(1,3,1), imshow(I1);
    title(['Noisy Image 1']);
    subplot(1,3,2), imshow(I_newMin1);
    title(['Image 1 computeMin() output. K = 5x5.']);
    subplot(1,3,3), imshow(I_newMax1);
    title(['Image 1 computeMax() output. K = 5x5.']);

    figure;
    subplot(1,3,1), imshow(I2);
    title(['Noisy Image 2']);
    subplot(1,3,2), imshow(I_newMin2);
    title(['Image 2 computeMin() output. K = 5x5.']);
    subplot(1,3,3), imshow(I_newMax2);
    title(['Image 2 computeMax() output. K = 5x5.']);
    
    K = ones(9, 9);                     %initialize kernel with 9 dimensions
    I_newMin1 = Compute_Min(I1, K);     %call min function for input 1
    I_newMax1 = Compute_Max(I1, K);     %call max function for input 2
    
    I_newMin2 = Compute_Min(I2, K);     %call min function for input 1
    I_newMax2 = Compute_Max(I2, K);     %call max function for input 2
    
    figure;
    subplot(1,3,1), imshow(I1);
    title(['Noisy Image 1']);
    subplot(1,3,2), imshow(I_newMin1);
    title(['Image 1 computeMin() output. K = 9x9.']);
    subplot(1,3,3), imshow(I_newMax1);
    title(['Image 1 computeMax() output. K = 9x9.']);

    figure;
    subplot(1,3,1), imshow(I2);
    title(['Noisy Image 2']);
    subplot(1,3,2), imshow(I_newMin2);
    title(['Image 2 computeMin() output. K = 9x9.']);
    subplot(1,3,3), imshow(I_newMax2);
    title(['Image 2 computeMax() output. K = 9x9.']);
    
end

