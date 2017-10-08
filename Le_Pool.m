% Pooling function
function nfim = Le_Pool(fim)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  input -- fim: m*n feature map
%  output -- nfim: (m/2)*(n/2) feature map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n] = size(fim);
nfim = zeros(m/2,n/2);    
for i = 1:m/2
    for j = 1:n/2
        nfim(i,j) = sum(sum(fim(i*2-1:i*2,j*2-1:j*2)));
    end
end