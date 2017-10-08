% use the function y = Atanh(Sa)
function nfim = sigmoid_tanh(fim)
[m,n] = size(fim);
nfim = zeros(m,n);
A = 1.7159;
S = 0.5;
for i=1:m
    for j=1:n
        nfim(i,j) = A*tan(fim(i,j));
    end
end