# Depth-Attentional Features for Single-Image Rain Removal

by Xiaowei Hu, Chi-Wing Fu, Lei Zhu, and Pheng-Ann Heng

This implementation is written by Xiaowei Hu at the Chinese University of Hong Kong.

***

Please find the code of the journal version at [https://github.com/xw-hu/DGNL-Net/](https://github.com/xw-hu/DGNL-Net/).      

***

# RainCityscapes Dataset

Our RainCityscapes dataset is available for download at the [Cityscapes website](https://www.cityscapes-dataset.com/downloads/).

## Citations

@InProceedings{Hu_2019_CVPR,      
&nbsp;&nbsp;&nbsp;&nbsp;  author = {Hu, Xiaowei and Fu, Chi-Wing and Zhu, Lei and Heng, Pheng-Ann},      
&nbsp;&nbsp;&nbsp;&nbsp;  title = {Depth-Attentional Features for Single-Image Rain Removal},      
&nbsp;&nbsp;&nbsp;&nbsp;  booktitle = {The IEEE Conference on Computer Vision and Pattern Recognition (CVPR)},      
&nbsp;&nbsp;&nbsp;&nbsp;  pages={8022--8031},      
&nbsp;&nbsp;&nbsp;&nbsp;  year = {2019}      
}       

@article{hu2020single,      
&nbsp;&nbsp;&nbsp;&nbsp;  author = {Hu, Xiaowei and Zhu, Lei and Wang, Tianyu and Fu, Chi-Wing and Heng, Pheng-Ann},            
&nbsp;&nbsp;&nbsp;&nbsp;  title = {Single-Image Real-Time Rain Removal Based on Depth-Guided Non-Local Features},          
&nbsp;&nbsp;&nbsp;&nbsp;  journal = {IEEE Transactions on Image Processing},      
&nbsp;&nbsp;&nbsp;&nbsp;  year = {2020},           
&nbsp;&nbsp;&nbsp;&nbsp;  note = {to appear}                       
}          
        
## Installation

1. Please download and compile our [CF-Caffe](https://github.com/xw-hu/CF-Caffe).

2. link the CF-Caffe to `DAF-Net/caffe`.

    ```shell
    ln -s '/path/to/CF-Caffe' '/path/to/DAF-Net/caffe'
    ```
  
## Train

Download the pre-trained VGG16 model at [http://www.robots.ox.ac.uk/~vgg/research/very_deep/](http://www.robots.ox.ac.uk/~vgg/research/very_deep/).   
   Put this model in `CF-Caffe/models/`

1. Enter the `./examples/DAF-Net/`   
   Modify the image path in `train_val.prototxt`.

2. Run   
   ```shell
   sh train.sh
   ```


## Test   
1. Please download our pretrained model at [Google Drive](https://drive.google.com/open?id=1Tmo2GU6KXwKoGlY_Epy5cae9dApk5AdL).   
   Put this model in `./examples/DAF-Net/snapshot/`.

2. Enter the `./examples/` and run `test_raincityscapes.m` in Matlab. 



## Evaluation
 
Enter the `DAF-Net/examples/` and run `evaluate_raincityscapes.m` in Matlab. 

