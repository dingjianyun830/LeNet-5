% initial parameter
function para = initial_para()
% initial C1 layer parameter
para.C1.N = 6;
para.C1.W = initial_Kernel(para.C1.N,5);
para.C1.b = ones(1,para.C1.N);
% initial S2 layer parameter
para.S2.N = 6;
para.S2.W = ones(1,para.S2.N);
para.S2.b = ones(1,para.S2.N);
% initial C3 layer parameter
para.C3.N = 16;
para.C3.Arr = {[1,2,3],[2,3,4],[3,4,5],[4,5,6],[1,5,6],[1,2,6],[1,2,3,4],[2,3,4,5],[3,4,5,6],[1,4,5,6],[1,2,5,6],[1,2,3,6],[1,2,4,5],[2,3,5,6],[1,3,4,6],[1,2,3,4,5,6]};
para.C3.ArrN = [3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,6];
para.C3.W = initial_Kernel(sum(para.C3.ArrN),5);
para.C3.b = ones(1,para.C3.N);
% initial S4 layer parameter
para.S4.N = 16;
para.S4.W = ones(1,para.S4.N);
para.S4.b = ones(1,para.S4.N);
% initial C5 layer parameter
para.C5.N = 120;
para.C5.W = initial_Kernel(para.C5.N*para.S4.N,5);
para.C5.b = ones(1,para.C5.N);
% initial F6 layer parameter
para.F6.N = 84;
for i = 1:para.F6.N  
    para.F6.W(:,i) = randi([-1,1],1,120);
end
para.F6.b = ones(1,para.F6.N);

