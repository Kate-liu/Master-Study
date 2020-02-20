%% n>1

clear; 
clc;  
clf;
close all;

n1 = 1;  % n(air)
n2 = 0.996;  % n(plasma)
n = n1 / n2; % 

zeta1 = linspace(0, pi/2, 1000);  % 入射角弧度，将0 - pi/2等分为1000?份
x = zeta1 * 180 / pi;  % 入射角角度

zeta2 = real(asin(n.*sin(zeta1)));  % 折射角，弧度

rpz = -n.*cos(zeta2) + cos(zeta1);  % 反射光中平行分量的反射系数分子
rpm = n.*cos(zeta2) + cos(zeta1);  % 反射光中平行分量的反射系数分母
rp = rpz./rpm;  % 反射光中平行分量的反射系数

rsz = n.*cos(zeta1) - cos(zeta2);  % 反射光中垂直分量的反射系数分子
rsm = n.*cos(zeta1) + cos(zeta2);  % 反射光中垂直分量的反射系数分母
rs = rsz./rsm;  % 反射光中垂直分量的反射系数

% Rp = rp.^2;  % 平行分量反射率
% Rs = rs.^2;  % 垂直分量反射率
% critical = acsc(n) * 180 / pi;  % 临界角
% Brewster = acot(n) * 180 / pi;  % 布鲁斯特角

plot(x, rp, x, rs);

xlabel( 'x/Angle' );
ylabel( 'y/Reflectance' );
title( 'Fresnel' );
legend('rp', 'rs', 'location', 'northwest');

% figure(2);
% plot(x, rp); % 小于0
% 
% figure(3);
% plot(x, rs); % 大于0
