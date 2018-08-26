function CNN = LeNet5(im,para)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  input -- im: input image
%           para: the parameter of all layers
%  output -- CNN : the result of all layers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CNN.input = im;

% input to C1 layer
% 1. take convolution
CNN.C1.featureMap = ConvIm(CNN.input,para.C1.W);
% 2. add bias
CNN.C1.featureMap = addBias(CNN.C1.featureMap, para.C1.b);
% 3. sigmoid
CNN.C1.featureMap = sigmoid(CNN.C1.featureMap);

% C1 to S2 layer
% 1. pooling
CNN.S2.featureMap = PoolingFM(CNN.C1.featureMap);
% 2. product coeff and add bias
CNN.S2.featureMap = addCoefBias(CNN.S2.featureMap,para.S2.W,para.S2.b);
% 3. sigmoid
%CNN.S2.featureMap = sigmoid(CNN.S2.featureMap);


% S2 to C3 layer
% 1. take convolution
CNN.C3.featureMap = ConvFM(CNN.S2.featureMap,para.C3.W,para.C3.Arr,para.C3.ArrN);
% 2. add bias
CNN.C3.featureMap = addBias(CNN.C3.featureMap, para.C3.b);
% 3. sigmoid
CNN.C3.featureMap = sigmoid(CNN.C3.featureMap);

% C3 to S4 layer
% 1. pooling
CNN.S4.featureMap = PoolingFM(CNN.C3.featureMap);
% 2. product coeff and add bias
CNN.S4.featureMap = addCoefBias(CNN.S4.featureMap,para.S4.W,para.S4.b);
% 3. sigmoid
%CNN.S4.featureMap = sigmoid(CNN.S4.featureMap);

% S4 to C5 layer
% 1. take convolution
CNN.C5.featureMap = ConvFM2(CNN.S4.featureMap,para.C5.W,para.C5.N);
% 2. add bias
CNN.C5.featureMap = CNN.C5.featureMap + para.C5.b;
% 3. sigmoid
CNN.C5.featureMap = sigmoid_exp(CNN.C5.featureMap); 

% C5 to F6 layer
% 1. take dot product
CNN.F6.featureMap = ConvFM3(CNN.C5.featureMap,para.F6.W);
% 2. add bias
CNN.F6.featureMap = CNN.F6.featureMap + para.F6.b;
% 3. sigmoid
CNN.F6.featureMap = squashing(CNN.F6.featureMap);
