%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% quadExtrema.m
% Ryan Ellis
%
% finds min and max of a quadratic, and graphs it
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars
% inputs
L=input("Input left limit: ");
R=input("Input right limit: ");
a=input("Input A: ");
b=input("Input B: ");
c=input("Input C: ");

% graphs curve
figure
x = L:0.02:R; 
y= a*x.^2+b*x+c;
plot(x,y), grid on;

% calculates possible min/max
LIntercept=a*L^2+b*L+c;
RIntercept=a*R^2+b*R+c;
Xinflection=-b/(2*a);
Yinflection=-(b^2-4*a*c)/(4*a);

% checks which is actual min/max
min=LIntercept;
max=LIntercept;

if(LIntercept>RIntercept)
    min=RIntercept;
end

if(LIntercept<RIntercept)
    max=RIntercept;
end

% only checks inflection point if in limit
if (Xinflection>=L && Xinflection<=R) 
    if(RIntercept<Yinflection)
        max=Yinflection;
    end
    if(RIntercept>Yinflection)
        min=Yinflection;
    end
end

% output
% (yes I know %g isn't ideal here, but it looks better than %d or %f)
fprintf("Minimum over interval: %g\n",min); 
fprintf("Maximum over interval: %g\n",max); 
                                          
