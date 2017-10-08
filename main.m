% LeNet-5 test
% prepare the CNN
currentFolder = pwd;
[trainImages,tkImages,trainLabels,tkLabels] = prepareData(currentFolder);

fprintf('Begin training  ....\n');
% initial network parameter
para = initial_para();
[~,~,Num] = size(trainImages);
for i = 1:Num 
    fprintf('Processing %d -th image : %f ....\n',i);
    % select 1 train image
    trainImage = trainImages(:,:,i);
    label = trainLabels(i);
    % enlarge the train image from 28*28 to 32*32
    im = zeros(32,32);
    im(3:30,3:30) = trainImage;
    
    % set the learning parameter
    Train.sigma = 1;
    Train.time = 100;
    trainCNN(im,label,para,Train);     
end







