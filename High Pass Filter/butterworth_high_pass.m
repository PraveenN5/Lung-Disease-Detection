image = imread('covid.jpg');
if size(image, 3) == 3
    image = rgb2gray(image);
end
n = 2;          
fc = 0.05;       
[M, N] = size(image);

u = 0:(M - 1);
v = 0:(N - 1);
u(u > M/2) = u(u > M/2) - M;
v(v > N/2) = v(v > N/2) - N;
[V, U] = meshgrid(v, u);

D = sqrt(U.^2 + V.^2);
H = 1 - 1 ./ (1 + (D / fc).^(2 * n));

filtered_spectrum = fft2(image) .* H;
filtered_image = ifft2(filtered_spectrum);
figure;
subplot(1, 2, 1);
imshow(image);
title('Input Image');

subplot(1, 2, 2);
imshow(abs(filtered_image), []);
title('ideal High-Pass Filter)');
