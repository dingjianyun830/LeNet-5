% use the function y =1/(1+exp(-x))
function nfim = sigmoid_exp(fim)
nfim = 1./(1 + exp(-fim));
