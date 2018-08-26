% compute the loss function using MSE(Minimum Mean Squared Error)
function E = loss(label, fim)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input -- label: 1*10 groudtruth
%          fim: 1*84 feature map
% Output-- e: loss
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if label==0
    A = random1(10);
    for i =1:10
    E(i) = sum((A(i)-fim).*(A(i)-fim));
    end
else
    E = fim(label);
end