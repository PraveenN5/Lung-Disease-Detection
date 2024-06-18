imagePaths = {  
	'C:\Users\Praveen nallasivam\Desktop\codes\New\Lung Disease Detection\Dataset\covid\covid_1.jpeg', 
    'C:\Users\Praveen nallasivam\Desktop\codes\New\Lung Disease Detection\Dataset\covid\covid_2.jpeg', 
    'C:\Users\Praveen nallasivam\Desktop\codes\New\Lung Disease Detection\Dataset\covid\covid_3.jpeg'
    };

threshold_point = 150;

figure;

for i = 1:length(imagePaths)
    originalImage = imread(imagePaths{i});

    if size(originalImage, 3) == 3
        grayImage = rgb2gray(originalImage);
    else
        grayImage = originalImage;
    end

    binaryImage_point = grayImage > threshold_point;

    subplot(length(imagePaths), 2, 2*i - 1);
    imshow(grayImage);
    title(['Original Image - ', num2str(i)]);

    subplot(length(imagePaths), 2, 2*i);
    imshow(binaryImage_point);
    title(['Point Thresholding - ', num2str(i)]);
end
