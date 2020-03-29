%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Schlieren MATLAB code
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; 
clc;  
clf;
close all;

%% Gaussian beam 
% Field size and sampling
% Set 5 * 5 mm field
% Sampling 1024+ pixel
L0 = 5e-3;
Nx = 4096 + 1;
Ny = 1024 + 1;
x = L0 * linspace(-1, 1, Nx);  
y = L0 * linspace(-1, 1, Ny);
[X, Y] = meshgrid(x, y); 


% Laser Standard deviation 
% Set 1 mm
% Variable sigma_r
sigma_r = 1e-3;

% Wave length
% Green
% Variable lambda
lambda = 532e-9;

% Gaussian function with a = A, b = x-scale, c = y-scale, d = laser standard deviation
f_gauss2D = @(a,b,c,d) (a .* exp(- ((b.^2 + c.^2) / (2 * ((d).^2)))));
U0 = f_gauss2D( 1, X, Y, sigma_r );

% Figure
figure(1);
mesh(X, Y, U0);

if (mod(Ny, 2)==0)
	halfNy = Ny / 2;
else
	halfNy = (Ny + 1) / 2;
end
figure(2);
plot(x, U0(halfNy, :), 'c');
grid on;

figure(3);
imagesc(U0);

%% Glass Cylinder

% Glass Cylinder diameter and focal length
% Set d = 1.5e-3, fglass = 62.5e-3
% Variable dglass, r, fglass, k
nglass = 1.5;
nair = 1.0002967;
dglass = 1.6e-3;

r = dglass / 2;
% fglass = - (r * nglass) / ( 2 * (nair - nglass));
fglass = 62.5e-3;
k = 2 * pi / lambda;

U1 = GlassCylinder( U0, X, Y, k, fglass, r );


% Figure
% for i = 1: size(U1, 1)
%     ComplexDouble = U1(i, :);
%     ComplexDouble(imag(ComplexDouble) ~= 0) = abs(ComplexDouble(imag(ComplexDouble)~=0));
%     U1(i, :) = ComplexDouble;
% end 
% figure(11);
% mesh(X, Y, U1);


%% First Len Properties

% Focal length of lens
% Variable d, f
d = 100e-3;
f = 100e-3;

[ U2, Lx2, Ly2 ] = firstLenProperties( U1, L0, L0, X, Y, lambda, f, d );


% Figure
% for i = 1: size(U2, 1)
%     ComplexDouble = U2(i, :);
%     ComplexDouble(imag(ComplexDouble) ~= 0) = abs(ComplexDouble(imag(ComplexDouble)~=0));
%     U2(i, :) = ComplexDouble;
% end    
% figure(21);
% mesh(X, Y, U2);


%% Knife Edge

% knife edge position
% Variable p
% Default p = 0, expression the knife edge in the focal position
p = 0;

[ U3 ] = knifeEdge( U2, X, Y, p );

% Figure
% for i = 1: size(U3, 1)
%     ComplexDouble = U3(i, :);
%     ComplexDouble(imag(ComplexDouble) ~= 0) = abs(ComplexDouble(imag(ComplexDouble)~=0));
%     U3(i, :) = ComplexDouble;
% end    
% figure(31);
% mesh(X, Y, U3);


%% Second Len Properties

% Focal length of lens
% Variable z
z = 100e-3;

[ U4, Lx2, Ly2 ] = secondLenProperties( U3, Lx2, Ly2, lambda, z );

% Figure
for i = 1: size(U4, 1)
    ComplexDouble = U4(i, :);
    ComplexDouble(imag(ComplexDouble) ~= 0) = abs(ComplexDouble(imag(ComplexDouble)~=0));
    U4(i, :) = ComplexDouble;
end    
figure(41);
mesh(X, Y, U4);

figure(42);
imagesc(U4);

if (mod(Ny, 2)==0)
	halfNy = Ny / 2;
else
	halfNy = (Ny + 1) / 2;
end
figure(43);
plot(x, U4(halfNy, :), 'c');
grid on;

figure(44);
plot(x, U4(halfNy, :), 'b');
hold on;
axis([-2e-3, 2e-3, 0, 1.2]);
grid on;


%% Photoconductive Detector Result
CU4 = conj(U4);

I = CU4 .* U4;

% Figure
for i = 1: size(I, 1)
    ComplexDouble = I(i, :);
    ComplexDouble(imag(ComplexDouble) ~= 0) = abs(ComplexDouble(imag(ComplexDouble)~=0));
    I(i, :) = ComplexDouble;
end    
figure(51);
mesh(X, Y, I);

figure(52);
imagesc(I);

if (mod(Ny, 2)==0)
	halfNy = Ny / 2;
else
	halfNy = (Ny + 1) / 2;
end
figure(53);
plot(x, I(halfNy, :), 'c');
grid on;

figure(54);
plot(x, I(halfNy, :), 'b');
hold on;
axis([-2e-3, 2e-3, 0, 1.4]);
grid on;
