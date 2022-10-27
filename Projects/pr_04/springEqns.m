%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% springEqns
% Hannah Ceisler / Ryan Ellis
%
% Solves system of linear eqns for springs
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% givens
F=2000;
k=[100 50 75 200];

% matrix determined with paper math
A=[-k(1)-k(2)  k(2)       0          0; 
    k(2)      -k(2)-k(3)  k(3)       0; 
    0          k(3)      -k(3)-k(4)  k(4); 
    0          0         -k(4)       k(4)];
% vector determined with paper math
b = [0; 0; 0; F;];

% matrix operation
x=A\b;

% printout
for i = 1:length(k)
    fprintf('the value of x%i is %g\n',i,x(i))
end


