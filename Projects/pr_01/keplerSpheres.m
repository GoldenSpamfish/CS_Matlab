%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% keplerSpheres.m
% Ryan Ellis
%
% Finds radii of spheres nesting platonic solids
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars

%radius calculations (using table)
r1=1;
r2=r1*(4/sqrt(6))*sqrt(6)/12;
r3=r2*0.5*(2/sqrt(3));
r4=r3*(sqrt(6)/6)*(2/sqrt(2));
r5=r4*(sqrt(250+110*sqrt(5))/20)*(4/(sqrt(15)+sqrt(3)));
r6=r5*(sqrt(42+18*sqrt(5))/12)*(4/sqrt(10+2*sqrt(5)));

%aligned printouts
disp(" ")
disp("Sphere        Radius          Circumference")
   disp("-------------------------------------------")
fprintf("   1       %.9f         %2.9f\n",r1,r1*2*pi)
fprintf("   2       %.9f         %2.9f\n",r2,r2*2*pi)
fprintf("   3       %.9f         %2.9f\n",r3,r3*2*pi)
fprintf("   4       %.9f         %2.9f\n",r4,r4*2*pi)
fprintf("   5       %.9f         %2.9f\n",r5,r5*2*pi)
fprintf("   6       %.9f         %2.9f\n",r6,r6*2*pi)
