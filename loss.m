% compute the loss function using MSE(Minimum Mean Squared Error)
function E = loss(GT, fim)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input -- label: 1*10 groudtruth
%          fim: 1*84 feature map
% Output-- e: loss
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[~,N1] = size(GT);
E = zeros(1,N1);
for i = 1:N1
    E(i) = sum(0.5*(GT(i)-fim).*(GT(i)-fim));
end