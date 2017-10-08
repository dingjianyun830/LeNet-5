% Convolution function
function nfim = ConvFM(fim, w, Arr, ArrN)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  input -- fim: 1*N1 feature maps
%           w: 1*N1  kernel
%  output -- fim: 1*N2 feature maps
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[~,N2] = size(ArrN);
AAA = zeros(1,N2);
nfim = cell(1,N2);
for i = 1:N2
    AAA(i) = sum(ArrN(1:i));
end
for i =1:N2
    if i == 1
        WW = w(:,1:AAA(i));
    else
        WW = w(:,AAA(i-1)+1:AAA(i));
    end
    nfim{i} = Conf(fim,Arr{i},WW);
end