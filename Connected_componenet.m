X0 = imread('C:\Users\Praveen nallasivam\Desktop\codes\New\Lung Disease Detection\Dataset\covid.jpg');

% Convert to grayscale by taking the mean of RGB channels
X0_gray = mean(X0, 3);

% Adjust the threshold value according to your image characteristics
threshold = graythresh(X0_gray);
X0_binary = imbinarize(X0_gray, threshold);

A = X0_binary;
B = strel('disk', 1);  
Xk = A;  % Initialize with the binary image

while true
    Xk_dilated = imdilate(Xk, B);
    Xk_new = Xk_dilated & A;

    if isequal(Xk_new, Xk)
        break; 
    end
    Xk = Xk_new;
end

figure;
subplot(1, 2, 1);
imshow(X0);
title('Original Image');

subplot(1, 2, 2);
imshow(Xk);
title('Extracted Connected Components');
