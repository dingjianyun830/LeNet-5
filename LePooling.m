function nfim = LePooling(fim)
[m,n] = size(fim);
nfim = zeros(m/2,n/2);
for i = 1:2:m
    for j = 1:2:n
        nfim(i,j) = sum(fim(i:i+1,j:j+1));
    end
end
