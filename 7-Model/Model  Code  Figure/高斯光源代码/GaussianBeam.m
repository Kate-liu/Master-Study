%% Gaussian beam 
clear; 
clc;  
clf;
close all;


% Field size and sampling
% Set 5 * 5 mm field
L0 = 5e-3;
Nx = 1000;
Ny = 1000;
x = L0 * linspace(-1, 1, Nx);  % linspace 均分计算指令，用于产生x1,x2之间的N 等分点
y = L0 * linspace(-1, 1, Ny);
[X, Y] = meshgrid(x, y);  % meshgrid 生成网格采样点的函数


% Standard deviation 
% Set 1 mm
sigma_r = 1e-3;


% Gaussian function with a=I0, b=x-scale, c=y-scale, d=standard deviation
% @是用于定义函数句柄的操作符
% 高斯光源
f_gauss2D = @(a,b,c,d) (a .* exp(-((b.^2+c.^2)/(2*((d).^2)))));
U0 = f_gauss2D(1, X, Y, sigma_r);

% Figure
figure(1);
mesh(X, Y, U0);

figure(2);
meshc(X, Y, U0);

figure(3);
imagesc(U0);

figure(4);
plot(x, U0(Nx/2, :), 'c');
grid on;


