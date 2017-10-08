% Convolution function
function fim = ConvIm(im, w)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  input -- im: m*n image
%           w: 1*N  kernel
%  output -- fim: 1*N feature maps
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[~,N] = size(w);
fim = cell(1,N);
for i =1:N
    fim{i} = Conv(im,w(:,i));
end