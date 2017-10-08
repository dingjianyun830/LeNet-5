% sigmoid function
function nfim = sigmoid(fim)
[~,N] = size(fim);
nfim = cell(1,N);
for i=1:N
    nfim{i} = sigmoid_exp(fim{i});
end
