% convolution operator
function f = Conv(im,w)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  input -- im: m*n image
%            w: 5*5 weight(kernel)
%  output -- fim: (m-2)*(n-2) feature map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n] = size(im);
f = zeros(m-4,n-4);
for i = 3:m-2
    for j = 3:n-2
        A = im(i-2:i+2,j-2:j+2);
        B = A(:).*w;
        f(i-2,j-2) = sum(B);
    end
end