% back-propagation function
function deltaPara = backPropagation(CNN,para,loss)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% this is a back propagation algorithm to updated the para
% input -- loss: loss energy
%          CNN: all layers of CNN
%          para: all layers of parameters
% Output-- para: updated parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Output layer to F6 layer
theta7 = 2*sqrt(loss) - CNN.F6.featureMap;

% F6 to C5 layer
theta6 = theta7 .* sigmoid_derivation(CNN.F6.featureMap);
deltaPara.F6.W = CNN.C5.featureMap'*theta6;
deltaPara.F6.b = theta6;

% C5 to S4 convolution layer
theta5 = zeros(1,120);
for i = 1:para.C5.N
    theta5(i) = sum(conv2(theta6,flip(deltaPara.F6.W(i,:)),'valid') .* sigmoid_derivation(CNN.C5.featureMap));
end
for i = 1:para.C5.N
    for j = 1:16
        temp5 = conv2(flip(CNN.S4.featureMap{j}),theta5(i),'valid');
        deltaPara.C5.W(:,i*j) = temp5(:);
    end
end
deltaPara.C5.b = theta5;

% S4 to C3 upsample layer
theta4 = cell(1,para.S4.N);
for i = 1: para.S4.N
    A1 = deltaPara.C5.W(:,120*(i-1)+1:120*i)*theta5';
    A1 = reshape(A1,5,5);
    theta4{i} = kron(A1,ones(2));
end
for i = 1:para.S4.N
    deltaPara.S4.W(i) = sum(sum(theta4{i}.*CNN.C3.featureMap{i}));
    deltaPara.S4.b(i) = sum(sum(theta4{i}));
end

% C3 to S2 convolution layer
theta3 = cell(1,para.C3.N);
for i = 1:para.C3.N
    theta3{i} =  conv2(theta4{i},deltaPara.S4.W(i),'valid') .* sigmoid_derivation(CNN.C3.featureMap{i});
end
count = 1;
for i = 1:para.C3.N
    idx = para.C3.Arr{i};
    NN = para.C3.ArrN(i);
    for j = 1:NN
        temp3 = conv2(flip(CNN.S2.featureMap{idx(j)}),theta3{i},'valid');
        deltaPara.C3.W(:,count) = temp3(:);
        count = count + 1;
    end
    deltaPara.C3.b = sum(sum(theta3{i}));
end

% S2 to C1 upsample layer
theta2 = cell(1,para.S2.N);
fArr = {[1,5,6,7,10,11,12,13,15,16],[1,2,6,7,8,11,12,13,14,16],[1,2,3,7,8,9,12,14,15,16],[2,3,4,7,8,9,10,13,15,16],[3,4,5,8,9,10,11,13,14,16],[4,5,6,9,10,11,12,14,15,16]};
for i = 1: para.S2.N
    idx = fArr{i};
    [~,Num] = size(idx);
    test3 = zeros(10,10);
    for j = 1:Num
        test3 = test3 + theta3{idx(j)};
    end
    A2 = CNN.S2.featureMap{i}*sum(sum(test3));   
    theta2{i} = kron(A2,ones(2));
end
for i = 1:para.S2.N
    deltaPara.S2.W(i) = sum(sum(theta2{i}.*CNN.C1.featureMap{i}));
    deltaPara.S2.b(i) = sum(sum(theta2{i}));
end

%C1 to input layer convolution
theta1 = cell(1,para.C1.N);
for i = 1:para.C1.N
    theta1{i} = conv2(theta2{i},deltaPara.S2.W(i), 'valid') .* sigmoid_derivation(CNN.C1.featureMap{i});
end
for i = 1:para.C1.N
    temp1 = conv2(flip(CNN.input),theta1{i},'valid');
    deltaPara.C1.W(:,i) = temp1(:);
    deltaPara.C1.b = sum(sum(theta1{i}));
end



