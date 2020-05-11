function [ U1 ] = GlassCapillary( U0, X, Y, r_big, r_small, n_glass, lambda )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Glass Capillary
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% input  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% U0: 平行光的电场（未进入毛细血管形玻璃管的电场）
% X: x 方向数据
% Y: y 方向数据
% r_big: 毛细血管形玻璃管的外径
% r_small: 毛细血管形玻璃管的内径
% n_glass: 毛细血管形玻璃管的折射率
% lambda: 激光的波长
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% output  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% U1: 通过毛细血管形玻璃管后的电场
%  
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% warning  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% size(U0, 1) 表示取出的是Ny的大小
% size(U0, 2) 表示取出的是Nx的大小
% U0(:, i) 表示的是第i列的全部数据
% U0(i, :) 表示的是第i行的全部数据
% U0(a, b) 表示的是第a行第b行的数据点
% m, t  表示的是等离子体与空气混合部分的波数 的线性插值的参数
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

U1 = U0;

k = 2 * pi / lambda;

k_glass = 2 * pi / lambda * n_glass;


for i = 1 : size(U0, 2)

	Delta1 = sqrt(r_big^2 - X(1, i)^2);
	Delta2 = sqrt(r_small^2 - X(1, i)^2);
	DeltaZ = Delta1 - Delta2;

	if abs(X(1, i)) >= r_big
		U1(:, i) = U0(:, i) .* exp(1i * k * 2 * r_big);

	elseif abs(X(1, i)) >= r_small
		U1(:, i) = U0(:, i) .* exp(1i * (k * 2 * (r_big - Delta1) + k_glass * 2 * Delta1));

	else
		U1(:, i) = U0(:, i) .* exp(1i * (k * 2 * (r_big - DeltaZ) + k_glass * 2 * DeltaZ));

	end

end

