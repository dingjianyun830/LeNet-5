% addCoefBias function
function nfim = addCoefBias(fim, coeff,bias)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  input -- fim: 1*N feature maps
%           coef: 1*N  coef variable
%           bias: 1*N  bias additional variable
%  output -- newfim: 1*N feature maps
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[~,N] = size(bias);
nfim = cell(1,N);
for i =1:N
    nfim{i} = fim{i}*coeff(i) + bias(i);
end