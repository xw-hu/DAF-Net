clear;
clc;

data_folder = 'train';
%data_folder = 'test';

root_rain_dir = '/home/xwhu/dataset/RainCityscapes/RainCityscapes/';

fid = fopen([root_rain_dir, data_folder,'_image.txt']);
C = textscan(fid, '%s');
base_name = C{1,1};
fclose(fid);


alpha_set = [0.01, 0.02, 0.03]; %rain 0.01, 0.02, 0.03 rain
beta_set = [0.005, 0.01, 0.015]; %haze 0.005 0.01 0.015
raindrop_size_set = [0.01, 0.005, 0.002];  %0.1mm-5mm  0.01 0.005 0.002


in_txt = fopen(['./RainCityscapes/' data_folder '_input.txt'],'w');
gt_txt = fopen(['./RainCityscapes/' data_folder '_gt.txt'],'w');
depth_txt = fopen(['./RainCityscapes/' data_folder '_depth.txt'],'w');


num_image = length(base_name);
 
for i=1:num_image
    for j=1:3
 
        alpha = alpha_set(j);
        beta = beta_set(j);
        raindrop_size = raindrop_size_set(j);
        suffix_rain = strcat('_rain_alpha_', num2str(alpha), '_beta_', num2str(beta), '_dropsize_', num2str(raindrop_size));
       
        for k=1:12
            
            suffix_rain_final = strcat(suffix_rain, '_pattern_', num2str(k));
            
            name_file((i-1)*3*12+(j-1)*12+k,1).gt = [base_name{i} '_leftImg8bit.png'];
            name_file((i-1)*3*12+(j-1)*12+k,1).input = [base_name{i} suffix_rain_final '.png'];
            name_file((i-1)*3*12+(j-1)*12+k,1).depth = [base_name{i} '_depth_.png'];
        end
    end
end

% random order
 choose = randperm(num_image*3*12)';
 name_file = name_file(choose);
 
for i=1:length(choose)
    
   
    fprintf(gt_txt,'%s', name_file(i).gt);
    fprintf(gt_txt,'\n');
    
    fprintf(in_txt,'%s', name_file(i).input);
    fprintf(in_txt,'\n');
    
    fprintf(depth_txt,'%s', name_file(i).depth);
    fprintf(depth_txt,'\n');
    
    
end

fclose(in_txt);

fclose(gt_txt);
