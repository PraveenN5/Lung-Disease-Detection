% Read the image
originalImage = imread('C:\Users\Praveen nallasivam\Desktop\codes\New\Lung Disease Detection\Dataset\covid.jpg');


% Convert the image to grayscale if it's a color image
if size(originalImage, 3) == 3
    grayImage = rgb2gray(originalImage);
else
    grayImage = originalImage;
end

% Compute the histogram
histogram = imhist(grayImage);

% Method 1: Threshold at histogram peak
[~, peakIndex] = max(histogram);
threshold_peak = (peakIndex - 1) / 255;

% Method 2: Threshold at a specific percentile (e.g., 80th percentile)
percentile_value = 80;
threshold_percentile = prctile(double(grayImage(:)), percentile_value);

% Apply the thresholds to segment the image
binaryImage_peak = imbinarize(grayImage, threshold_peak);
binaryImage_percentile = grayImage > threshold_percentile;

% Display the results
figure;

subplot(2, 2, 1);
imshow(originalImage);
title('Original Image');

subplot(2, 2, 2);
imshow(grayImage);
title('Grayscale Image');

subplot(2, 2, 3);
plot(histogram);
title('Image Histogram');

subplot(2, 2, 4);
imshow(binaryImage_peak);
title('Binary Image (Threshold at Peak)');

% Optional: Display the threshold values
disp(['Threshold at histogram peak: ' num2str(threshold_peak)]);
disp(['Threshold at ' num2str(percentile_value) 'th percentile: ' num2str(threshold_percentile)]);
