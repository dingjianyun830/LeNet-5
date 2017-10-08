% sigmoid function: y = 1/(1+exp(-x))
% its derivation function: gy = y*(1-y);
function gy = sigmoid_gradient(y)
gy = y .* (1 - y);