imagePaths = {
	'C:\Users\Praveen nallasivam\Desktop\codes\New\Lung Disease Detection\Dataset\covid\covid_1.jpeg', 
    'C:\Users\Praveen nallasivam\Desktop\codes\New\Lung Disease Detection\Dataset\covid\covid_2.jpeg', 
    'C:\Users\Praveen nallasivam\Desktop\codes\New\Lung Disease Detection\Dataset\covid\covid_3.jpeg'
};

threshold_line = 130;

figure;

for i = 1:length(imagePaths)
    if exist(imagePaths{i}, 'file') ~= 2
        fprintf('Error: File does not exist - %s\n', imagePaths{i});
        continue;  
    end

    originalImage = imread(imagePaths{i});

    if size(originalImage, 3) == 3
        grayImage = rgb2gray(originalImage);
    else
        grayImage = originalImage;
    end

    binaryImage_line = grayImage > threshold_line;

    subplot(3, 2, i*2 - 1);
    imshow(originalImage);
    title(['Original Image ', num2str(i)]);

    subplot(3, 2, i*2);
    imshow(binaryImage_line);
    title(['Line Thresholding -', num2str(i)]);
end
