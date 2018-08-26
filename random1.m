function A = random1(N)
 A = rand(1,N)-0.5;
 for i = 1:N
     if A(i) >= 0
         A(i) = 1;
     else
         A(i) = -1;
     end
 end