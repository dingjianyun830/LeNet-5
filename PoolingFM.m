% Pooling function
function nfim = PoolingFM(fim)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  input -- fim: 1*N feature maps
%  output -- nfim: 1*N new feature maps
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[~,N] = size(fim);
nfim = cell(1,N);
for i = 1 : N
    nfim{i} = Le_Pool(fim{i});
end