function [ U1 ] = FuzzyPlasmaCylinder( U0, X, Y, ra, rp, n1, n2, lambda )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Fuzzy Plasma Cylinder
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% input  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% U0: 平行光的电场（未进入模糊圆柱形等离子体的电场）
% X: x 方向数据
% Y: y 方向数据
% ra: 等离子体的半径, 表示的是大于这个值之后就全是空气, 包含等离子体 和 等离子体与空气混合 部分。
% rp: 表示的是小于这个值之后就全是等离子体
% n1: 空气的折射率
% n2: 圆柱形等离子体柱的折射率
% lambda: 激光的波长
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% output  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% U1: 通过模糊圆柱柱形等离子体后的电场
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

kAir = 2 * pi * n1 / lambda;
kPlasma = 2 * pi * n2 / lambda;

m = (kAir - kPlasma) / (ra - rp);
t = kAir - m * ra
p = @(z , x) z * t + z * m * sqrt(z^2 + y^2) + m * x^2 * log(z + sqrt(z^2 + x^2));

for (i = 1 : size(U0, 2) )

	if (abs(X(1, i)) >= ra)
		U1(:, i) = U0(:, i) .* exp(1i * kAir * 2 * ra);

	elseif (abs(X(1, i)) >= rp)
		x = abs(X(1, i));
		z1 = sqrt(ra^2 - x^2);
		z2 = 0;

		DeltaPhiAir = kAir * (2 * ra - 2 * (sqrt(ra^2 - x^2)));
		DeltaPhiAirPlasma = 2 * ( p(z1, x) - p(z2, x) );
		
		U1(:, i) = U0(:, i) .* exp(1i * (DeltaPhiAir + DeltaPhiAirPlasma));

	else
		x = abs(X(1, i));
		z1 = sqrt(ra^2 - x^2);
		z2 = sqrt(rp^2 - x^2);

		if x ~= 0
			HalfDeltaP = p(z1, x) - p(z2, x);
		else
			HalfDeltaP = p(z1, 1e-15) - p(z2, 1e-15);
		end


		DeltaPhiAir = kAir * (2 * ra - 2 * (sqrt(ra^2 - x^2)));
		DeltaPhiAirPlasma = 2 * ( p(z1, x) - p(z2, x) );
		DeltaPhiPlasma = kPlasma * (2 * (sqrt(rp^2 - x^2)));

		U1(:, i) = U0(:, i) .* exp(1i * (DeltaPhiAir + DeltaPhiAirPlasma + DeltaPhiPlasma));

	end
end

