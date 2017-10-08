% updated all parameters
function para = UpdatePara(para,deltaPara,sigma)
para.C1.W = para.C1.W + sigma*deltaPara.C1.W;
para.C1.b = para.C1.b + sigma*deltaPara.C1.b;
para.S2.W = para.S2.W + sigma*deltaPara.S2.W;
para.S2.b = para.S2.b + sigma*deltaPara.S2.b;
para.C3.W = para.C3.W + sigma*deltaPara.C3.W;
para.C3.b = para.C3.b + sigma*deltaPara.C3.b;
para.S4.W = para.S4.W + sigma*deltaPara.S4.W;
para.S4.b = para.S4.b + sigma*deltaPara.S4.b;
para.C5.W = para.C5.W + sigma*deltaPara.C5.W;
para.C5.b = para.C5.b + sigma*deltaPara.C5.b;
para.F6.W = para.F6.W + sigma*deltaPara.F6.W;
para.F6.b = para.F6.b + sigma*deltaPara.F6.b;