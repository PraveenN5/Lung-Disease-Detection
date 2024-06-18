originalImage = imread('Viral.jpeg');
originalImage = im2double(originalImage);

filterSize = 31; 
sigma = 5; 
n = 2; 

% Ideal High-Pass Filter
H_ideal = fspecial('unsharp', 0.8);
sharpened_ideal = imfilter(originalImage, H_ideal, 'replicate');

% Butterworth High-Pass Filter
H_butterworth = 1 - 1./(1 + (sqrt(2) - 1) * (filterSize./2).^(2*n));
sharpened_butterworth = imfilter(originalImage, H_butterworth, 'replicate');

% Unsharp Mask Filter (a Gaussian filter for blurring)
H_unsharp = fspecial('gaussian', filterSize, sigma);
sharpened_unsharp = originalImage + (originalImage - imfilter(originalImage, H_unsharp, 'replicate'));

% Display the original and sharpened images
subplot(2, 2, 1);
imshow(originalImage);
title('Original Image');

subplot(2, 2, 2);
imshow(sharpened_ideal);
title('Ideal High Pass');

subplot(2, 2, 3);
imshow(sharpened_butterworth);
title('Butterworth High Pass');

subplot(2, 2, 4);
imshow(sharpened_unsharp);
title('Unsharp Mask High Pass');
