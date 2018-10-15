function test_example_CNN 
%load mnist_uint8;  
load ../data/IC/CNN_DATA.mat;


train_x = double(reshape(train_x',36,36,2952));
train_y = double(train_y');

rand('state',0)
cnn.layers = {
    struct('type', 'i') %input layer
    struct('type', 'c', 'outputmaps', 2, 'kernelsize', 9) %convolution layer
    struct('type', 's', 'scale', 4) %sub sampling layer

};

cnn = cnnsetup(cnn, train_x, train_y);

opts.alpha = 0.3;  % Ñ§Ï°ÂÊ  

opts.batchsize = 18;
 

opts.numepochs = 1;
cnn = cnntrain(cnn, train_x, train_y, opts); 
ALL_Feature=cnn.Feature';

DATA=[ones(2952,1) ALL_Feature];
DATA(1497:2952,1)=-1;    
save('../data/IC/DATA_ALL','DATA');
