function test_example_CNN 
%load mnist_uint8;    
load ../data/E/CNN_DATA.mat;


train_x = double(reshape(train_x',36,36,5852));
train_y = double(train_y');


rand('state',0)
cnn.layers = {
    struct('type', 'i') %input layer
    struct('type', 'c', 'outputmaps', 2, 'kernelsize', 9) %convolution layer
    struct('type', 's', 'scale', 2) %sub sampling layer
%      struct('type', 'c', 'outputmaps', 24, 'kernelsize', 7) %convolution layer
%      struct('type', 's', 'scale', 2) %subsampling layer
};

cnn = cnnsetup(cnn, train_x, train_y);

opts.alpha = 0.3;  % Ñ§Ï°ÂÊ  

opts.batchsize = 22;


opts.numepochs = 1;
cnn = cnntrain(cnn, train_x, train_y, opts); 

ALL_Feature=cnn.Feature';
%save('../data/IC/ALL_Feature','ALL_Feature');

DATA=[ones(5852,1) ALL_Feature];
DATA(2927:5852,1)=-1;    
save('../data/E/DATA_ALL','DATA');
