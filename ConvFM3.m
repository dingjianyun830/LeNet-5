% Convolution function
function nfim = ConvFM3(fim, w)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  input -- fim: 1*N1 feature maps
%           w: 1*N1  kernel
%  output -- nfim: 1*N2 feature maps
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[~,N2] = size(w); 
nfim = zeros(1,N2);
for i = 1:N2
    nfim(i) = fim*w(:,i);
end