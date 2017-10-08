function Tsum = sumWeight(W,N)
[~,n] = size(W{1});
Tsum = zeros(1,n);
for j =1:n
    C = 0;
    for i =1:N
        A = W{i};        
        C = C + sum(sum(A{j}));
    end
    Tsum(j) = C;
end