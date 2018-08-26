
function E = trainCNN(im,label,para,Train)
count = 0;
GT = zeros(1,10);
GT(label) = 1;
while count < Train.time
    % forward CNN
    CNN = LeNet5(im,para);
    
    % compute the loss function
    E = loss(GT,CNN.F6.featureMap);
    fprintf('loss: %f ....\n',E(label));
    if E(label) < 0.00001
        break;
    end
    
    % back-propagation
    deltaPara = backPropagation(CNN, para, E(label));
    
    % Update the parameter
    para = UpdatePara(para,deltaPara,Train.sigma);
    count = count + 1;
end