fArr = {[1,5,6,7,10,11,12,13,15,16],[1,2,6,7,8,11,12,13,14,16],[1,2,3,7,8,9,12,14,15,16],[2,3,4,7,8,9,10,13,15,16],[3,4,5,8,9,10,11,13,14,16],[4,5,6,9,10,11,12,14,15,16]};
for i = 1: para.S2.N
    idx = fArr{i};
    [~,Num] = size(idx);
    test3 = zeros(10,10);
    for j = 1:Num
        test3 = test3 + theta3{idx(j)};
    end
    AA = CNN.S2.featureMap{i}*sum(sum(test3));
    BB = ones(2);    
    theta2{i} = kron(AA,BB);
end