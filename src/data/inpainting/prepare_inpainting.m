n = 192;
load("Indian_pines_corrected.mat");
I1 = indian_pines_corrected - min(indian_pines_corrected(:));
I1 = I1 ./ max(I1(:));
image = imresize(I1,[n n]);

% for ADMM 
mask = ones(192, 192, 200);
mask(:, [22:26 52:68 100:102 106:110 118:128 180:182], :)=0;
mask = imresize(mask,[n n],'nearest');

save('reference.mat','image');
save("mask.mat", "mask");

% for inpainting2D.ipynb
mask = ones(192, 192);
mask(:,[22:26 52:68 100:102 106:110 118:128 180:182])=0;
mask = imresize(mask,[n n],'nearest');
save('inpainting1925.mat', 'image', 'mask');