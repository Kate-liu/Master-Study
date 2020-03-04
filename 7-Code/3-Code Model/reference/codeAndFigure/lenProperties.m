function [ U2, Lx2, Ly2 ] = lenProperties( U1, Lx1, Ly1, lambda, z )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Fourier Properties of the lens in MATLAB
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% input  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% U1: 输入电场
% Lx1: 输入电场x方向尺寸
% Ly1: 输入电场y方向尺寸
% lambda: 激光波长 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% output  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% U2: 输出电场
% Lx2: 输出电场x方向尺寸
% Ly2: 输出电场y方向尺寸
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    [N, M] = size(U1);
    
    dx = Lx1 / N;
    dy = Ly1 / M;
    
    Lx2 = lambda * z / dx;
    Ly2 = lambda * z / dy;
    
    constant = 1 / lambda * z;
    
    U2 = constant * fftshift(fft2(ifftshift(U1))) * dx * dy;

end

