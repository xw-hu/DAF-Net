clear all; close all;

addpath('../caffe/matlab/');

model_root_dir = './DAF-Net/';
definition_file = [model_root_dir 'deploy.prototxt'];
binary_file = [model_root_dir 'snapshot/' 'DAF_iter_100000.caffemodel'];

assert(exist(binary_file, 'file') ~= 0);
assert(exist(definition_file, 'file') ~= 0);

caffe.reset_all();

caffe.set_mode_gpu();
caffe.set_device(0);

% Initialize a network
net = caffe.Net(definition_file, binary_file, 'test');

root_dir = '/home/xwhu/dataset/RainCityscapes/RainCityscapes/test/';
imgFiles=dir([root_dir '*.png']);


save_root = [model_root_dir 'result/'];

if exist(save_root, 'dir') == 0
    mkdir(save_root);
end

nImg=length(imgFiles);

imgW = 512; imgH = 256;
scale = 0.0039212686;

usedtime = 0;
show = 0;

colorTransform = makecform('srgb2lab');
colorTransform2 = makecform('lab2srgb');

for k = 1 : nImg
    
    test_image = imread([root_dir imgFiles(k).name]);

    
    if (show)
        imshow(test_image);
    end
    
    ori_size = [size(test_image,1), size(test_image,2)];
    test_image = imresize(test_image,[imgH imgW]);
    test_image = single(test_image(:,:,[3 2 1]));
    test_image = test_image.*scale;
    test_image = permute(test_image, [2 1 3]);
    
    % network forward
    tic; outputs = net.forward({test_image}); pertime=toc;
    usedtime=usedtime+pertime; avgtime=usedtime/k;

    final = net.blobs('output1').get_data();
    
    final = permute(final, [2 1 3]);
    final = final./scale;
    final = uint8(final(:,:,[3 2 1]));
    final = imresize(final, ori_size);

    imwrite(final,[save_root imgFiles(k).name(1:end-3) 'png']);
    
    
    if (mod(k,100)==0), fprintf('idx %i/%i, avgtime=%.4fs\n',k,nImg,avgtime); end
    
end

fprintf('idx %i/%i, avgtime=%.4fs\n',k,nImg,avgtime);
