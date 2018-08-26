% LeNet-5 test
% prepare the CNN
currentFolder = pwd;
[trainImages,tkImages,trainLabels,tkLabels] = prepareData(currentFolder);

fprintf('Begin training  ....\n');
% initial network parameter
para = initial_para();
% set the learning parameter
Train.sigma = 0.01;
Train.time = 200;
[~,~,Num] = size(trainImages);
batchSize = 1000;
batchNum = Num/batchSize;
count = 0;
w = random1(10);
while count < Train.time
    lossE = zeros(1,batchSize);  
    for i = 1:batchSize  
        % fprintf('Training %d -th image.... \n',i);
        % select train image
        trainImage = trainImages(:,:,i);
        trainlabel = trainLabels(i);
        % enlarge the train image from 28*28 to 32*32
        im = zeros(32,32);
        im(3:30,3:30) = trainImage;
        
        % forward CNN
        CNN = LeNet5(im,para);
        
        % F6 to Output layer
        CNN.Output = RBF(CNN.F6.featureMap,w);
        
        % compute the loss function
        lossE(i) = loss(trainlabel,CNN.Output);
    end
    
    lossE = mean(lossE);
    
    fprintf('NO: %d, loss: %f ....\n',count,lossE);
    % back-propagation
    deltaPara = backPropagation(CNN, para, lossE);
    
    % Update the parameter
    para = UpdatePara(para,deltaPara,Train.sigma);
    count = count + 1;
end

nRight = 0;
nWrong = 0;
for i = 1:batchSize 
    fprintf('Test %d -th image : %f ....\n',i);
    % select Test image
    testImage = tkImages(:,:,i);
    testlabel = tkLabels(i);
    % enlarge the train image from 28*28 to 32*32
    im = zeros(32,32);
    im(3:30,3:30) = testImage;
    % input the traing CNN model
    % forward CNN
    CNN = LeNet5(im,para);
    % F6 to Output layer
    CNN.Output = RBF(CNN.F6.featureMap,w);
    
    result = find(CNN.Output == min(CNN.Output));

    if(ismember(testlabel,result))
        fprintf('result: %d . GroundTruth: %d ....\n',testlabel,testlabel );
        nRight = nRight + 1;
    else
        fprintf('result: %d . GroundTruth: %d ....\n',result(1),testlabel );
        nWrong = nWrong + 1;
    end

    fprintf('Accurate Rate: %f .\n',nRight/ batchSize);
end








