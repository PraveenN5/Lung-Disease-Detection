% Gaussian High Pass
image = imread('covid.jpg');

image = im2double(image);

sigma = 200.0; 
D = 2.5 * sigma;

[M, N] = size(image);

u = 0:(M - 1);
v = 0:(N - 1);
u(u > M/2) = u(u > M/2) - M;
v(v > N/2) = v(v > N/2) - N;
[V, U] = meshgrid(v, u);

H = 1-exp(-(U.^2 + V.^2) / (2 * sigma^2));

H = ifftshift(H);

filtered_image = ifft2(fft2(image) .* H);
subplot(1, 2, 1);
imshow(image);
title('Input Image');

subplot(1, 2, 2);
imshow(abs(filtered_image), []);
title('Gaussian High Pass');
