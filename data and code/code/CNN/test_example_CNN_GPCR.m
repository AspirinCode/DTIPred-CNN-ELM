function test_example_CNN 
%load mnist_uint8;  
load ../data/GPCR/CNN_DATA.mat;


train_x = double(reshape(train_x',36,36,1270));
train_y = double(train_y');

rand('state',0)
cnn.layers = {
    struct('type', 'i') %input layer
    struct('type', 'c', 'outputmaps', 2, 'kernelsize', 9) %convolution layer
    struct('type', 's', 'scale', 2) %sub sampling layer
};

cnn = cnnsetup(cnn, train_x, train_y);

opts.alpha = 0.3;  % Ñ§Ï°ÂÊ  

opts.batchsize = 10;
opts.numepochs = 1;
cnn = cnntrain(cnn, train_x, train_y, opts); 
ALL_Feature=cnn.Feature';

DATA=[ones(1270,1) ALL_Feature];
DATA(636:1270,1)=-1;    
save('../data/GPCR/DATA_ALL','DATA');
