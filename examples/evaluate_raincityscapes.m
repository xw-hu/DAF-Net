clear all;
clc;

% ground truth
GTfolder = '/home/xwhu/dataset/RainCityscapes/RainCityscapes/image/';
%GTfolder = '/home/xwhu/dataset/Rain100H/test/gt/';


RESfolder = './DAF-Net/result/';

test_input = textread('../data/RainCityscapes/test_input.txt', '%s');
test_gt = textread('../data/RainCityscapes/test_gt.txt', '%s');

%test_input = textread('/home/xwhu/dataset/Rain100H/test.txt', '%s');
%test_gt = test_input;

k=0;
for i = 1:length(test_gt)
    
    strGT = [GTfolder, test_gt{i}];
    %strRES = [RESfolder, test_input{i}];
    
    strRES = [RESfolder, test_input{i}(1:end-4) '.png'];
    
%     GT = im2double(imread(strGT));
%     RES = im2double(imread(strRES));

    if exist(strRES)
        k = k+1;
    else
        continue;
    end
    
    image_gt = imread(strGT);
    image_res = imread(strRES);
    
    if sum(size(image_res)==[1024, 2048, 3])~=3
       image_res = imresize(image_res,[1024 ,2048]);
    end
    
    if sum(size(image_gt)==[1024, 2048, 3])~=3
       image_gt = imresize(image_gt,[1024, 2048]);
    end
    
    GT = im2double(image_gt);
    RES = im2double(image_res);
    
    value_psnr_s6(k) = psnr(RES, GT);
    value_mssim_s6(k)  = ssim(RES*255, GT*255);
    fprintf('idx=%u, PSNR=%g, ssim=%g.\n', k, value_psnr_s6(k), value_mssim_s6(k));
    
end% 
% 
fprintf('Mean: PSNR=%g, ssim=%g.\n', mean(value_psnr_s6(:)), mean(value_mssim_s6(:)));

%Mean: PSNR=27.986, ssim=0.898293.



