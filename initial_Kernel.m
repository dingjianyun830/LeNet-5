% initial_Kernal function
function W = initial_Kernel(N,r)
% random N 5*5 weight(kernel) 
W = zeros(r*r,N);
for i = 1:N
    A = randn(r,r);
    W(:,i) = A(:);
end
