% addBias function
function nfim = addBias(fim, bias)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  input -- fim: 1*N feature maps
%           bias: 1*N  bias additional variable
%  output -- newfim: 1*N feature maps
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[~,N] = size(bias);
nfim = cell(1,N);
for i =1:N
    nfim{i} = fim{i} + bias(i);
end