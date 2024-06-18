%Ideal Low Pass Filter 
input_image = imread('COVID_19.jpeg'); 

[M, N] = size(input_image); 

FT_img = fft2(double(input_image)); 

D0 = 50; 
u = 0:(M-1); 
idx = find(u>M/2); 
u(idx) = u(idx)-M; 
v = 0:(N-1); 
idy = find(v>N/2); 
v(idy) = v(idy)-N; 

[V, U] = meshgrid(v, u); 

D = sqrt(U.^2+V.^2); 

H = double(D <= D0); 

G = H.*FT_img; 
output_image = real(ifft2(double(G))); 

subplot(1, 2, 1), imshow(input_image), 
title('Input Image')

subplot(1, 2, 2), imshow(output_image, [ ]); 
title('Output Image')

