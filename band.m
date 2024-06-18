originalImage = imread('covid.jpg');
originalImage = im2double(originalImage);

filterSize = 31; 
sigma = 5; % Standard deviation for Gaussian filter
n = 2; % Order of Butterworth filter

% Create a low-pass Gaussian filter
H_lowpass_gaussian = fspecial('gaussian', filterSize, sigma);

% Create a high-pass Gaussian filter by subtracting the low-pass from the original
H_highpass_gaussian = 1 - H_lowpass_gaussian;

% Create a low-pass Butterworth filter
H_lowpass_butterworth = 1./(1 + (sqrt(2) - 1) * (filterSize./2).^(2*n));

% Create a high-pass Butterworth filter by subtracting the low-pass from the original
H_highpass_butterworth = 1 - H_lowpass_butterworth;

% Apply the band-pass filters
bandpass_ideal = imfilter(imfilter(originalImage, H_highpass_gaussian), H_lowpass_gaussian);
bandpass_butterworth = imfilter(imfilter(originalImage, H_highpass_butterworth), H_lowpass_butterworth);
bandpass_gaussian = imfilter(imfilter(originalImage, H_highpass_gaussian), H_lowpass_gaussian);

% Display the original and band-pass filtered images
subplot(2, 2, 1);
imshow(originalImage);
title('Original Image');

subplot(2, 2, 2);
imshow(bandpass_ideal);
title('Band-Pass (Ideal)');

subplot(2, 2, 3);
imshow(bandpass_butterworth);
title('Band-Pass (Butterworth)');

subplot(2, 2, 4);
imshow(bandpass_gaussian);
title('Band-Pass (Gaussian)');
