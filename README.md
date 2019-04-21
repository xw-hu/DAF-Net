# Depth-attentional Features for Single-image Rain Removal

by Xiaowei Hu, Chi-Wing Fu, Lei Zhu, and Pheng-Ann Heng

This implementation is written by Xiaowei Hu at the Chinese University of Hong Kong.

***

## Citation

@InProceedings{Hu_2019_CVPR,      
&nbsp;&nbsp;&nbsp;&nbsp;  author = {Hu, Xiaowei and Fu, Chi-Wing and Zhu, Lei and Heng, Pheng-Ann},      
&nbsp;&nbsp;&nbsp;&nbsp;  title = {Depth-attentional Features for Single-image Rain Removal},      
&nbsp;&nbsp;&nbsp;&nbsp;  booktitle = {The IEEE Conference on Computer Vision and Pattern Recognition (CVPR)},      
&nbsp;&nbsp;&nbsp;&nbsp;  year = {2019}      
}

        
## Installation

1. Please download and compile our [CF-Caffe](https://github.com/xw-hu/CF-Caffe).

2. link the CF-Caffe to `DAF/caffe`.

    ```shell
    ln -s '/path/to/CF-Caffe' '/path/to/DAF/caffe'
    ```
  
## Train

Download the pre-trained VGG16 model at [http://www.robots.ox.ac.uk/~vgg/research/very_deep/](http://www.robots.ox.ac.uk/~vgg/research/very_deep/).   
   Put this model in `CF-Caffe/models/`

1. Enter the `examples/DAF-Net/`   
   Modify the image path in `train_val.prototxt`.

2. Run   
   ```shell
   sh train.sh
   ```


## Test   

Enter the `examples/` and run `test_raincityscapes.m` in Matlab. 



## Evaluation
 
Enter the `examples/` and run `evaluate_raincityscapes.m` in Matlab. 

