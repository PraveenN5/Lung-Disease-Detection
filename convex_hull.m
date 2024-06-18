imagePaths = {    
	'C:\Users\Praveen nallasivam\Desktop\codes\New\Lung Disease Detection\Dataset\bacterial\bact1.jpeg', 
    'C:\Users\Praveen nallasivam\Desktop\codes\New\Lung Disease Detection\Dataset\bacterial\bact2.jpeg', 
    'C:\Users\Praveen nallasivam\Desktop\codes\New\Lung Disease Detection\Dataset\bacterial\bact3.jpeg'
};

figure;

for i = 1:length(imagePaths)
    originalImage = imread(imagePaths{i});

    binaryImage = imbinarize(originalImage);

    %convex hull
    convexHullImage = bwconvhull(binaryImage);

    subplot(length(imagePaths), 2, (i-1)*2 + 1);
    imshow(originalImage);
    title(['Original Image - Bacterial ', num2str(i)]);
    subplot(length(imagePaths), 2, (i-1)*2 + 2);
    imshow(convexHullImage);
    title('Convex Hull');
end

colormap gray; 