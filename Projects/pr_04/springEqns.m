%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% springEqns
% Hannah Ceisler / Ryan Ellis
%
% Solves system of linear eqns for springs
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
F=2000;
k=[100 50 75 200];
n=length(k);

A=[-k(1)-k(2)  k(2)       0          0; 
    k(2)      -k(2)-k(3)  k(3)       0; 
    0          k(3)      -k(3)-k(4)  k(4); 
    0          0         -k(4)       k(4)];
b = [0; 0; 0; F;];
% A2=sum(A,2)'

x=A\b;

for i = 1:n
    fprintf('the value of x%i is %g\n',i,x(i))
end


