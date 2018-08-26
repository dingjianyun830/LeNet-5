function Out = RBF(fim,w)
Out = zeros(1,10);
for  i = 1:10
    Out(i) = sum((fim-w(i)).*(fim-w(i)));
end