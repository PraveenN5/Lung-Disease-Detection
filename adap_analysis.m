% Load your image (replace 'your_image_path' with the actual file path)
image = imread('C:\Users\Praveen nallasivam\Desktop\codes\New\Lung Disease Detection\Dataset\covid.jpg');

% Convert the image to grayscale if it's not already
if size(image, 3) == 3
    gray_image = rgb2gray(image);
else
    gray_image = image;
end

% Display the original image
figure;
subplot(2, 2, 1);
imshow(gray_image);
title('Original Image');

% Plot the histogram
subplot(2, 2, 2);
imhist(gray_image);
title('Histogram');

% Apply adaptive thresholding using histogram analysis
binary_image_adaptive = imbinarize(gray_image, 'adaptive', 'ForegroundPolarity', 'bright', 'Sensitivity', 0.5);

% Display the segmented image using adaptive thresholding
subplot(2, 2, 3);
imshow(binary_image_adaptive);
title('Segmented Image (Adaptive Thresholding)');

% You can perform additional processing on the binary image if needed
