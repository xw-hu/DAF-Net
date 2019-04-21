GLOG_logtostderr=1 ../../caffe/build/tools/caffe train \
  --solver=solver.prototxt \
  --weights=../../caffe/models/VGG_ILSVRC_16_layers.caffemodel \
  --gpu=0  2>&1 | tee log.log

