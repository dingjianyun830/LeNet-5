% convolution function
function nfim = Conf(fim,idx,w)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  input -- fim: 1*N1 feature maps
%           idx: convolution feature map (Label)
%           w:  kernel
%  output -- nfim: 1*N2 feature maps
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n] = size(fim{1});
[~,N] = size(idx);
nfim = zeros(m-4,n-4);
for i = 1 : N
   nfim = nfim + Conv(fim{idx(i)},w(:,i));
end