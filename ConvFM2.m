% Convolution function
function nfim = ConvFM2(fim, w, N2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  input -- fim: 1*N1 feature maps
%           w: 1*N1  kernel
%  output -- fim: 1*N2 feature maps
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[~,N1] = size(fim);
nfim = zeros(1,N2);
idx = zeros(1,N1);
for i = 1:N1
    idx(i) = i;
end
for i =1:N2
    A = (i-1)*16+1;
    B = i*16;
    WW = w(:,A:B);
    nfim(i) = Conf(fim,idx,WW);
end