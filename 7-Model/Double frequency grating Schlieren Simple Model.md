# Double frequency grating Schlieren Simple Model

> 进行**双频光栅纹影**装置模型的公式推导，也可称其为**双频光栅纹影剪切干涉法**。

## Set up(装置)

双频光栅纹影装置，可以简化为下图所示：

<img src="Double frequency grating Schlieren Simple Model.assets/含被测对象的双频光栅纹影装置示意图.png" alt="image-20200424173508708" style="zoom:50%;" />

<center><font color="red">图1 含被测对象的双频光栅纹影装置示意图</font><cebnter>


> 视觉角度：主视图；
>
> 坐标说明：x-世界坐标系水平方向，y-世界坐标系垂直方向，z-光轴方向。
>
> 图示：1-激光器（532nm），2-扩束透镜组1，3-扩束透镜组2，4-物平面，5-凸透镜，6-双频光栅，7-凸透镜，8-像平面，9-被测对象。





## Model(模型)

> 结合装置示意图，进行双频光栅纹影光路的理论推导。

### Laser Source（激光光源）

由于双频光栅纹影装置需要将光源扩束准直为**直径大于被测对象直径**的光束，而在实际的理论推导中，忽略点光源被扩束准直的过程，直接设置光源为扩束之后的平行光，接着就是光线进入被测对象内部，可以查看下面的装置示意图：

<img src="Double frequency grating Schlieren Simple Model.assets/双频光栅纹影装置示意图（仿真）.png" alt="image-20200424174512630" style="zoom:50%;" />

<center><font color="red">图2 双频光栅纹影装置示意图（仿真）</font><cebnter>


>视觉角度：主视图；
>
>坐标说明：x-世界坐标系水平方向，y-世界坐标系垂直方向，z-光轴方向。
>
>图示：1-物平面，2-被测对象，3-凸透镜，4-双频光栅，5-凸透镜，6-像平面。

所以，我们可以将平行光设置为一个常量值，表示为：
$$
E_0(x,y) = C
$$
其中，C表示为一个常数。

也可以将其设置为高斯光源，详细内容参考：ModelDetails.md 中，Laser Source（激光光源）节。





### Test Object（被测对象）

当平行光束通过被测对象的时候，其相位会发生变化，产生的相位偏移表达式可以表示为：
$$
\Delta \Phi (x, y)=
k_{TestObject} \cdot \Delta z
$$
其中，$k_{TestObject} $ 表示光线经过被测对象的波数，可表示为 $k_{TestObject} = \frac{2 \pi }{\lambda} \cdot n_{TestObject}$ , $\Delta z$ 表示光线沿光轴方向穿过被测对象的距离。

其中，相位的偏移表达式也可以表示为：
$$
\Delta \Phi (x, y)=
\int _{z_1} ^{z_2}
\frac{2 \pi }{\lambda} \cdot n_{TestObject}(x, y, z)
\cdot dz
$$
其中，$z_1 $ 表示为被测对象靠近光源的位置，$z_2$ 表示为被测对象远离光源的位置，其中$z_2 > z_1$，并且$z_2 - z_1$ 就是光线沿光轴方向穿过被测对象的距离。$n_{TestObject}(x, y, z)$ 表示被测对象在空间上的折射率。

所以，我们可以得到光线经过被测对象之后的光场表达式：
$$
E_1(x,y) 
= E_0(x,y)\cdot \exp \{i \cdot \Delta \Phi(x, y) \}
= C \cdot \exp \{i \cdot \Delta \Phi(x, y) \}
$$
**注**：由于需要测试被测对象的温度参数，还需要进行折射率到温度的推导。





### First Len（第一个凸透镜）

光线继续沿着光轴传播，穿过第一个凸透镜的时候，由于透镜具有傅里叶特性，根据傅里叶变化，可以得到双频光栅纹影装置中光线经过第一个凸透镜之后的光场信息为：
$$
 F (\xi, \eta)
=
\mathcal{F} \{ E_1 (x,y) \}
 \quad \quad \quad \quad  \quad \quad \quad \quad  \quad \quad \quad \quad  \quad \quad \quad \quad  \quad \quad \quad \quad  \quad \quad \quad \quad 
\\
=
\iint _{-\infty}^{+\infty}
E_1 (x,y) 
\exp \{  - i  ( 2 \pi \xi +  2 \pi  \eta) \}
dx dy
 \quad \quad \quad \quad  \quad \quad \quad \quad 
\\
=
\iint _{-\infty}^{+\infty}
C \cdot \exp \{ i \cdot \Delta \Phi(x, y) \}
\exp \{ - i  ( 2 \pi \xi +  2 \pi  \eta) \}
dx dy
 \quad \quad \quad 
\\
=
\iint _{-\infty}^{+\infty}
C \cdot \exp \{ i \cdot (  \Delta \Phi(x, y)  -  2 \pi \xi -  2 \pi  \eta) \}
dx dy
 \quad \quad \quad \quad  \quad
 
$$
其中，$ F (\xi, \eta) $ 是$ E_1 (x, y)$ 的准确傅里叶变换，常数相位因子无关紧要。





### Double frequency grating（双频光栅）

**双频光栅**是一块在干板上记录着两个空间频率相差不大的正弦光栅。

双频光栅的两个**周期**，分别表示为：
$$
d_1 = \lambda / sin \theta_1 
\\
d_2 = \lambda / sin \theta_2
$$
角度差 $ \Delta \theta = | \theta_1 - \theta_2 | $ ，表示为双频光栅的**分裂角**。

双频光栅的**一级平均衍射角**为：$ \theta = (\theta_1 + \theta_2) / 2 $ 。

双频光栅的**拍周期**表示为：
$$
 \frac{1}{d'} = | \frac{1}{d_1} - \frac{1}{d_2} | = | \frac{sin \theta_1  - sin \theta_2 }{\lambda} |
$$
在实际的实验的时候，将双频光栅片**放置**在普通纹影仪的刀口位置，取代刀口装置。

其中穿过被测对象的每一平行光线，将在双频光栅的一级衍射角方向上分裂为一对夹角为$ \Delta \theta $ 的光线。经过双频光栅后，匹配对的光线将发生**干涉**。

综上，可以表示**双频光栅的方程**为：
$$
g(x) = cos(2 \pi f_1 x) + cos(2 \pi f_2 x)
$$
上式中，$  f_1$ 和 $ f_2$ 表示为双频光栅的频率。

当频谱面与双频光栅作用的时候，由于 $ g(x) $ 是周期函数，可以写成傅里叶级数的形式，并基于[欧拉公式](#欧拉公式)，化简余弦函数，如下所示：
$$
G(\xi) 
=
cos(2 \pi f_1 \xi) + cos(2 \pi f_2 \xi)
\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad 
\\
= 
\frac{1}{2} (e^{i 2 \pi f_1 \xi }+ e^{ - i 2 \pi f_1 \xi})
+
\frac{1}{2} (e^{i 2 \pi f_2 \xi }+ e^{ - i 2 \pi f_2 \xi})
\\
= 
\frac{1}{2} (e^{i 2 \pi f_1 \xi }+ e^{ - i 2 \pi f_1 \xi}
+
e^{i 2 \pi f_2 \xi }+ e^{ - i 2 \pi f_2 \xi})
$$
其中，$ \xi$ 与$x $ 相对应。

所以，可以得到**双频光栅后的电场**表达式，并利用**空间滤波器滤除+1级频谱**，基于**傅里叶变换的时移特性**：
$$
E_3 (\xi, \eta)  
= 
F (\xi, \eta) \cdot G(\xi， \eta)
\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad 
\\
(代入G(\xi， \eta))
\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad 
\\
=
F (\xi, \eta) \cdot 
\frac{1}{2} (e^{i 2 \pi f_1 \xi }+ e^{ - i 2 \pi f_1 \xi}
+
e^{i 2 \pi f_2 \xi }+ e^{ - i 2 \pi f_2 \xi})
\\
(进行空间滤波)
\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad 
\\
=
F (\xi, \eta) \cdot 
\frac{1}{2} ( e^{ - i 2 \pi f_1 \xi} + e^{ - i 2 \pi f_2 \xi})
\quad \quad \quad \quad \quad \quad \quad \quad
\\
(化简)
\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad 
\\
=
\frac{1}{2} F (\xi, \eta) \cdot  e^{ - i 2 \pi f_1 \xi} + 
\frac{1}{2} F (\xi, \eta) \cdot e^{ - i 2 \pi f_2 \xi}
\quad \quad \quad \quad 
\\
$$







### Second  Len（第二个凸透镜）

光线经过第二个透镜的时候，由于透镜具有傅里叶特性，根据傅里叶变化，可以得到双频光栅纹影装置中光线经过第二个凸透镜之后的光场信息为：

$$
E_4 (x,y) 
= 
\mathcal{F}^{-1} \{ E_3 (\xi, \eta)  \}
$$
其中，$ E_4 (x, y) $ 是$E_3 (\xi, \eta)$ 的准确傅里叶变换，常数相位因子无关紧要。

基于[傅里叶变换的时延特性](#傅里叶变换的时延特性)，进行化简如下：
$$
E_4 (x,y) 
= 
\mathcal{F}^{-1} \{ E_3 (\xi, \eta)  \} 
\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad 
\\
=
\mathcal{F}^{-1} \{ 
\frac{1}{2} F (\xi, \eta) \cdot  e^{ - i 2 \pi f_1 \xi} + 
\frac{1}{2} F (\xi, \eta) \cdot e^{ - i 2 \pi f_2 \xi}  \} 
\\
(傅里叶变换的时延特性)
\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad 
\\
=
\frac{1}{2} E_1 (x - 2 \pi f_1, y)
+
\frac{1}{2} E_1 (x - 2 \pi f_2, y)
\quad \quad \quad \quad 
\\
(带入E_1(x,y) )
\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad 
\\
=
\frac{1}{2} C \cdot  e^{ i \Delta \Phi (x - 2 \pi f_1 , y) } + 
\frac{1}{2} C \cdot  e^{ i \Delta \Phi (x - 2 \pi f_2 , y) }
\quad \quad \quad \quad 
\\
(化简 )
\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad 
\\
=
\frac{1}{2} C \cdot [ e^{ i \Delta \Phi (x - 2 \pi f_1 , y) } + e^{ i \Delta \Phi (x - 2 \pi f_2 , y) }]
\quad \quad \quad \quad \quad \quad
$$

其中，$ E_4 (x, y) $ 是$E_3 (x, y)$ 的准确傅里叶变换，常数相位因子无关紧要。






### Light intensity（光强）

已知光线经过第二个凸透镜，到达像平面的光场，其表示为 $E_4 (x,y) $ 。

所以，可以得到**光电探测器的强度**表示为：
$$
I(x,y) = < E_4 (x,y) \cdot E_4 ^* (x,y) >
$$
其中， $ < \cdot > $ 表示时间平均。

在仿真测试的时候，由于整个系统的状态都是不变量，所以可以得到光电探测器的强度表示为，
$$
I(x,y) 
=  E_4 (x,y) \cdot E_4 ^* (x,y)
$$

其中复共轭 $E_4 ^* (x,y)$ 可以表示为：
$$
E_4 ^* (x,y)
=
\frac{1}{2} C \cdot [ e^{ -i \Delta \Phi (x - 2 \pi f_1 , y) } + e^{ - i \Delta \Phi (x - 2 \pi f_2 , y) }]
$$
所以，最终光电探测器上光场强度可以表示为：
$$
I(x,y) 
=  E_4 (x,y) \cdot E_4 ^* (x,y)
\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad
\\
=
\frac{1}{2} C \cdot [ e^{ i \Delta \Phi (x - 2 \pi f_1 , y) } + e^{ i \Delta \Phi (x - 2 \pi f_2 , y) }]
\cdot
\frac{1}{2} C \cdot [ e^{ -i \Delta \Phi (x - 2 \pi f_1 , y) } + e^{ - i \Delta \Phi (x - 2 \pi f_2 , y) }]
 \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad 
\\
(相乘展开)
\\
=
\frac{1}{4} C^2 + \frac{1}{4} C^2 + 
\frac{1}{4} C^2 \cdot e^{ i \Delta \Phi (x - 2 \pi f_1 , y) }  \cdot e^{ -i \Delta \Phi (x - 2 \pi f_2 , y) } + 
\frac{1}{4} C^2 \cdot e^{ i \Delta \Phi (x - 2 \pi f_2 , y) }  \cdot e^{ -i \Delta \Phi (x - 2 \pi f_1 , y) }
 \quad \quad \quad \quad \quad 
\\
(化简)
\\
=
\frac{1}{2} C^2 + 
\frac{1}{4} C^2 \cdot e^{ i [ \Delta \Phi (x - 2 \pi f_1 , y) - \Delta \Phi (x - 2 \pi f_2 , y) ]} + 
\frac{1}{4} C^2 \cdot e^{ i [ \Delta \Phi (x - 2 \pi f_2 , y) - \Delta \Phi (x - 2 \pi f_1 , y) ] }
 \quad \quad \quad \quad \quad  \quad \quad \quad \quad \quad  \quad 
\\
(化简)
\\
=
\frac{1}{2} C^2 + 
\frac{1}{4} C^2 \cdot \{
e^{ i [ \Delta \Phi (x - 2 \pi f_1 , y) - \Delta \Phi (x - 2 \pi f_2 , y) ]} + 
e^{ - i [ \Delta \Phi (x - 2 \pi f_1 , y) - \Delta \Phi (x - 2 \pi f_2 , y)] }
\}
\quad \quad \quad \quad \quad  \quad \quad \quad \quad \quad  \quad \quad
\\
(欧拉公式)
\\
=
\frac{1}{2} C^2 + 
\frac{1}{4} C^2 \cdot \{2 cos [\Delta \Phi (x - 2 \pi f_1 , y) - \Delta \Phi (x - 2 \pi f_2 , y) ] \}
 \quad \quad \quad \quad \quad  \quad \quad \quad \quad \quad  \quad \quad \quad \quad \quad  \quad \quad \quad 
\\
(配形式)
\\
=
\frac{1}{2} C^2 + 
\frac{1}{2} C^2 \cdot cos \{ 
\frac{\Delta \Phi (x - 2 \pi f_1 , y) - \Delta \Phi (x , y)}{-2 \pi f_1} \cdot ( -2 \pi f_1)
+
\frac{\Delta \Phi (x , y) - \Delta \Phi (x - 2 \pi f_2 , y) }{2 \pi f_2} \cdot ( 2 \pi f_2)
\}
\\
(导数的定义)
\\
=
\frac{1}{2} C^2 + 
\frac{1}{2} C^2 \cdot cos 
\{ 
\frac {\partial \Delta \Phi (x , y) }{\partial x} \cdot  2 \pi (f_2 - f_1)
\}
 \quad \quad \quad \quad \quad  \quad \quad \quad \quad \quad  \quad \quad \quad \quad \quad  \quad \quad \quad  \quad \quad \quad  \quad \quad  
\\
$$





## Reference（参考）

### 欧拉公式

在[Double frequency grating（双频光栅）](#Double frequency grating（双频光栅）)中，使用了欧拉公式进行公式的化简，基于已有的搜索引擎，我们可以得到欧拉公式的表示为：
$$
e^{i x} = cos(x) + i \cdot sin(x)
$$
其中，公式中$e$ 是自然对数的底，$i$ 是虚数单位。

所以，我们可以同理得到另一个变体欧拉公式，表示为：
$$
e^{- i x} = cos(- x) + i \cdot sin(- x)
\quad
\\
= cos(x) - i \cdot sin(x)
$$
此时，将欧拉公式与变体欧拉公式相加之后，可以得到：
$$
e^{- i x} + e^{i x} 
= 
[cos(x) + i \cdot sin(x) ]+
[cos(x) - i \cdot sin(x) ]
\\
=
2 \cdot cos(x)
\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad
$$
变化一个形式可以表示为：
$$
cos(x)
=
\frac{1}{2}
[ e^{- i x} + e^{i x} ]
$$
在计算[Light intensity（光强）](#Light intensity（光强）) 的时候，可以将上式子变形为：
$$
2 \cdot cos(x)
=
e^{- i x} + e^{i x}
$$






### 傅里叶变换的时延特性

在[Second  Len（第二个凸透镜）](#Second  Len（第二个凸透镜）)中，使用了傅里叶变换的时延特性，基于搜索引擎可以知道傅里叶变换的时延（移位）特性表示为：

若：
$$
f(t) \leftrightarrow F(\omega)
$$
则：
$$
f_1(t) = f(t - t_0) \leftrightarrow F_1(\omega) = F(\omega)\cdot e^{-i \omega t_0}
$$
时延（移位）性说明波形在时间轴上时延，不改变信号振幅频谱，仅使信号增加一 $-\xi t_0$ 的线性相位。

在使用傅里叶变换的时移特性的时候，我们的右边等于 $F (\xi, \eta) \cdot  e^{ - i 2 \pi f_1 \xi} $  ，此时可表示 $\omega = \xi$ ，那么 $t_0 = 2 \pi f_1$ ，所以可以得到左边等于 $f(x - 2 \pi f_1)$  ，将其对应于实际的化简中，可以表示为;
$$
f(x - 2 \pi f_1, y) \leftrightarrow  F (\xi, \eta) \cdot  e^{ - i 2 \pi f_1 \xi}
$$


> 参考：https://wenku.baidu.com/view/7fb2491c650e52ea551898f0?xreader=1#1







### 导数的定义

在计算[Light intensity（光强）](#Light intensity（光强）) 的时候，使用了导数的定义进行光强的化简，基于高等数学可以知道：
$$
\frac{f(x- \Delta x) - f(x)} {\Delta x} = f'(x)
$$
那么在计算的时候，可以得到：
$$
\frac{f(x- \Delta x , y) - f(x , y)} {\Delta x} 
= \frac {\partial f(x,y)} {\partial x}
$$

> 参考：https://wenku.baidu.com/view/f690c362561252d380eb6e84.html







## Simulation Logic(仿真逻辑)

> 简单介绍仿真的时候，每一部分的取舍。

光源：

> 取一个常数，光场是 $E_0(x,y) = C$ 。

被测对象：

> 取一个圆柱形被测物，内部折射率小于空气折射率（小于1），并且圆柱的高远大于仿真的测试区域。
>
> 被测对象带来的相位变化表达式：
>
> $\Delta \Phi (x)=
> \begin{cases} 
> k(air) \cdot 2R
> \quad \quad \quad\quad \quad \quad\quad \quad \quad\quad \quad \quad\quad \quad \quad\quad \quad \quad \quad \quad   ,|x|>R 
> \\ 
> \\
> k(air) \cdot (2R - 2 \cdot \Delta z(x)) + k(plasma) \cdot 2 \cdot \Delta  z(x)  
> \quad \quad \quad \quad   ,|x| \leq R
> \end{cases}$ 
>
> 上式中， $k(air) = \frac{2 \pi n(air)}{\lambda}$ ， $k(plasma) = \frac{2 \pi n(plasma)}{\lambda}$ ，$\Delta z (x) = \sqrt {R^2 - x^2} $ 。
>
> 经过被测对象后的光场信息为：
>
> $E_1(x,y) 
> = E_0(x,y)\cdot \exp \{i \cdot \Delta \Phi(x, y) \}
> = C \cdot \exp \{i \cdot \Delta \Phi(x, y) \}$ 

第一个透镜：

> 进行光场的傅里叶变化，得到的频域表达式，表示为：
>
> $F (\xi, \eta)
> =
> \mathcal{F} \{ E_1 (x,y) \}$ 
>
> 其中，$F (\xi, \eta) $ 是$E_1 (x, y)$ 的准确傅里叶变换。

双频光栅：

> 双频光栅的表达式为：
>
> $G(\xi) 
> =
> cos(2 \pi f_1 \xi) + cos(2 \pi f_2 \xi)$ 
>
> 上式中，$f_1$ 和 $f_2$ 表示为双频光栅的频率，$\xi$ 表示为至于$x$ 方向相关。 
>
> $E_3 (\xi, \eta)  
> = 
> F (\xi, \eta) \cdot G(\xi， \eta)$ 
>
> 并进行**空间滤波，滤除+1级频谱**。

第二个透镜：

> 进行光场的逆傅里叶变化，得到时域的表达式，表示为：
>
> $E_4 (x,y) 
> = 
> \mathcal{F}^{-1} \{ E_3 (\xi, \eta)  \}$ 
>
> 其中，$E_4 (x, y)$ 是$E_3 (x, y)$ 的准确傅里叶变换。

光强：

>计算像面上的光强，表示为：
>
>$I(x,y) 
>=  E_4 (x,y) \cdot E_4 ^* (x,y)$ 。
>
>其中，$E_4 ^* (x,y)$ 是 $E_4 (x,y)$ 的复共轭。







## Result（结果）

> 根据仿真的过程，保存相应阶段的图片。

### Code（代码）

> 将上述模型内容实现成为代码。

```matlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Double Frequency Grating Schlieren MATLAB Code
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;  % 清空工作区变量
clc;  % 清空当前的命令行窗口
close all;  % 关闭打开的所有figure窗口


%% Laser Source （激光光源）

% Field size and sampling
% Set 10 * 10 mm field
% Sampling 1024 pixel
L = 5;
N = 1024;
center = ceil( N / 2 );

x = L * linspace(-1, 1, N);  
y = L * linspace(-1, 1, N);
[X, Y] = meshgrid(x, y); 

% Wave length
% Green Laser 
lambda = 532e-6;

% Pixel Size mm
Pixel_Size = L / N;

% Constant Laser Intensity
% The uniform light intensity is 1
% ONES(M,N) or ONES([M,N]) is an M-by-N matrix of ones.
E0 = ones(N, N);

% Figure
figure(1);
mesh(X, Y, E0);
title('光源');

figure(2);  % 显示的会是一个纯白色图像，imshow默认将取值0-1，1表示的是白色，0表示黑色
imshow(E0);
title('光源');


%% Test Object of the Cylinder （圆柱形被测对象）

E1 = E0;
Delta_Phi = zeros(N, N);

r = 0.8;  % Cylinder radius 0.8mm
n_Air = 1;  % air Refractive
n_Plasma = 1 - 4 * 10^(-3);  % Cylinder Refractive

kAir = 2 * pi * n_Air / lambda;  % 计算波数 k
kPlasma = 2 * pi * n_Plasma / lambda;

% Cylinder object influence（圆柱形被测物对光场的相位影响）
for i = 1 : N
    if abs(X(1, i)) >= r
        Delta_Phi(:, i) = kAir * 2 * r;

    else
        DeltaZ = sqrt(r^2 - X(1, i)^2);
        Delta_Phi(:, i) = kAir * 2 * ( r - DeltaZ) + kPlasma * 2 * DeltaZ;

    end
end

figure(11);
mesh(Delta_Phi);
% colormap(gray);
title('被测对象对于光场的相位影响');


% Calculate output test object light field (穿过被测对象的光场)
for i = 1 : size(E0, 2)
    if abs(X(1, i)) >= r
        E1(:, i) = E0(:, i) .* exp(1i * kAir * 2 * r);

    else
        Delta = sqrt(r^2 - X(1, i)^2);
        E1(:, i) = E0(:, i) .* exp(1i * (kAir * 2 * ( r - Delta) + kPlasma * 2 * Delta));

    end
end

figure(12);
imshow(E1);
title('穿过被测对象的光场');


%% First Len Properties(第一个凸透镜)
F1 = fftshift(fft2(E1));

% 按行取一维傅里叶变换完成二维变换
% for i = 1 : size(E0, 1)
%     F1(i,:)= fftshift(fft(E1(i,:)));
% end

imF = log( abs(F1) );
figure(21);
imshow(imF, []);
title('经过第一个透镜之后的光场');


%% Double frequency grating （双频光栅）

G0 = zeros(N, N);
G1 = zeros(N, N);

Period1 = 1 / 15;  % Period，光栅表示为1mm 20 线对
Period2 = 1 / 20;
f1 = 25;  % frequency, 1 / Period
f2 = 20;

for i = 1 : N
    for j = 1 : N
%         Delta_x = X(1, j) + L;    
        Delta_x  = ( j - center ) * Pixel_Size;
        G0(i, j) = cos(2 * pi * f1 * Delta_x) + cos(2 * pi * f2 * Delta_x);
        
    end
end

figure(31);
imshow(G0);
title('完整版双频光栅');


for i = 1 : N
    for j = 1 : N
        Delta_x  = ( j - center ) * Pixel_Size; 
        G1(i, j) = 0.5 * exp(1i * 2 * pi  * f1 * Delta_x )  + 0.5 *exp(1i * 2 * pi  * f2 * Delta_x ) ;
        
    end
end

figure(32);
imshow(abs(G1));
title('使用e指数滤除+1级之后的双频光栅');


%% Used Double frequency grating（双频光栅之后的光场）
E3 = G1 .* F1;

figure(41);
imshow( log(abs(E3)), [] );
title('使用滤除+1频谱的双频光栅之后的光场');



%% Spatial filter（空间滤波器滤除+1级频谱）

% Reference_Frequence = zeros(N, N);
% line = 513;
% column = 529;
% Reference_Frequence(line-3: line+3, column-3: column+3) = E3(line-3: line+3, column-3: column+3);
% 
% Reference_Frequence_ = log(abs(Reference_Frequence).^2) - 2;
% max_Reference_Frequence = max(max(Reference_Frequence_));
% Reference_Frequence_ = Reference_Frequence_ / max_Reference_Frequence;
% figure(43);
% imshow(Reference_Frequence_);
% title('Reference_Frequence_');



%%  Second Len Properties(第二个凸透镜)
E4 = ifft2(ifftshift(E3));

% for i=1:N
%     E4(i,:) = ifft(ifftshift(E3(i,:)));
% end

figure(51);
imshow(E4);
title('经过第二个透镜之后的光场');


%% Photoconductive Detector Result （光强分布）
Cimage_E4 = conj(E4);

Light_Intensity = Cimage_E4 .* E4;


figure(61);
imshow(Light_Intensity);
title('光强分布');

figure(62);
imagesc(Light_Intensity);
colormap(gray);
title('光强分布二维视图');

figure(63);
mesh(Light_Intensity);
% colormap(gray);
title('光强分布三维视图');

figure(64);
x_axis = center;
plot(Light_Intensity( x_axis , : ), 'r' );
title('径向光强曲线');



```





### 光源

figure 1

![光源](Double frequency grating Schlieren Simple Model.assets/光源.bmp)



### 被测对象带来的相位变化

Figure 11

![被测对象对于光场相位的影响](Double frequency grating Schlieren Simple Model.assets/被测对象对于光场相位的影响.bmp)









### 经过被测对象后光场

Figure 12

![经过被测对象之后的光场](Double frequency grating Schlieren Simple Model.assets/经过被测对象之后的光场.bmp)





### 双频光栅-光栅a

figure 31

![双频光栅](Double frequency grating Schlieren Simple Model.assets/双频光栅.bmp)





### 滤除+1频谱的e指数光栅-光栅b

![使用e指数表示滤波之后的双频光栅](Double frequency grating Schlieren Simple Model.assets/使用e指数表示滤波之后的双频光栅.bmp)





### 使用双频光栅之后的频域-光栅a

> 下面，将会分别讨论不滤波的结果和滤除+1级的结果。

显示的是一条直线，没法进行+1 级滤波。

所以后面的内容是没有进行滤波的操作。

![直接使用双频光栅之后的光场](Double frequency grating Schlieren Simple Model.assets/直接使用双频光栅之后的光场.bmp)







#### 第二个透镜之后光场

figure 51

![经过第二个透镜之后的光场](Double frequency grating Schlieren Simple Model.assets/经过第二个透镜之后的光场-1589446985537.bmp)





#### 探测器的光强分布

figure 71

![光强分布1](Double frequency grating Schlieren Simple Model.assets/光强分布1.bmp)



figure 72

![光强分布2](Double frequency grating Schlieren Simple Model.assets/光强分布2.bmp)





figure74

![光强分布3](Double frequency grating Schlieren Simple Model.assets/光强分布3.bmp)





### 使用滤除+1频谱的双频光栅之后的频域-光栅b

此时就不需要继续进行滤波操作了。

使用e指数表示的光栅已经滤除了+1级频谱。

![使用滤除+1频谱的双频光栅之后的光场](Double frequency grating Schlieren Simple Model.assets/使用滤除+1频谱的双频光栅之后的光场.bmp)





#### 第二个透镜之后光场

figure 51

![经过第二个透镜之后的光场-滤波](Double frequency grating Schlieren Simple Model.assets/经过第二个透镜之后的光场-滤波.bmp)



#### 探测器的光强分布

figure 71

![光强分布1-滤波](Double frequency grating Schlieren Simple Model.assets/光强分布1-滤波.bmp)





figure 72

![光强分布2-滤波](Double frequency grating Schlieren Simple Model.assets/光强分布2-滤波.bmp)



figure 74

![光强分布3-滤波](Double frequency grating Schlieren Simple Model.assets/光强分布3-滤波.bmp)



可以很明显的看到使用了+1滤波之后，整个图像右半部分被滤除了，并且消除了高部的信号。







## 附图

### 平行光经过透镜之后的频域

平行光经过一个透镜，只需要进行一次傅里叶变换，可以看到的是一个点的频域图。

![平行光傅里叶变换之后的频域](Double frequency grating Schlieren Simple Model.assets/平行光傅里叶变换之后的频域.bmp)





### 使用一维傅里叶循环代替二维傅里叶变换

#### Code（代码）

> 将上述模型内容实现成为代码。

```matlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Double Frequency Grating Schlieren MATLAB Code
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;  % 清空工作区变量
clc;  % 清空当前的命令行窗口
close all;  % 关闭打开的所有figure窗口


%% Laser Source （激光光源）

% Field size and sampling
% Set 10 * 10 mm field
% Sampling 1024 pixel
L = 5;
N = 1024;
center = ceil( N / 2 );

x = L * linspace(-1, 1, N);  
y = L * linspace(-1, 1, N);
[X, Y] = meshgrid(x, y); 

% Wave length
% Green Laser 
lambda = 532e-6;

% Pixel Size mm
Pixel_Size = L / N;

% Constant Laser Intensity
% The uniform light intensity is 1
% ONES(M,N) or ONES([M,N]) is an M-by-N matrix of ones.
E0 = ones(N, N);

% Figure
figure(1);
mesh(X, Y, E0);
title('光源');

figure(2);  % 显示的会是一个纯白色图像，imshow默认将取值0-1，1表示的是白色，0表示黑色
imshow(E0);
title('光源');


%% Test Object of the Cylinder （圆柱形被测对象）

E1 = E0;
Delta_Phi = zeros(N, N);

r = 0.8;  % Cylinder radius 0.8mm
n_Air = 1;  % air Refractive
n_Plasma = 1 - 4 * 10^(-3);  % Cylinder Refractive

kAir = 2 * pi * n_Air / lambda;  % 计算波数 k
kPlasma = 2 * pi * n_Plasma / lambda;

% Cylinder object influence（圆柱形被测物对光场的相位影响）
for i = 1 : N
    if abs(X(1, i)) >= r
        Delta_Phi(:, i) = kAir * 2 * r;

    else
        DeltaZ = sqrt(r^2 - X(1, i)^2);
        Delta_Phi(:, i) = kAir * 2 * ( r - DeltaZ) + kPlasma * 2 * DeltaZ;

    end
end

figure(11);
mesh(Delta_Phi);
% colormap(gray);
title('被测对象对于光场的相位影响');


% Calculate output test object light field (穿过被测对象的光场)
for i = 1 : size(E0, 2)
    if abs(X(1, i)) >= r
        E1(:, i) = E0(:, i) .* exp(1i * kAir * 2 * r);

    else
        Delta = sqrt(r^2 - X(1, i)^2);
        E1(:, i) = E0(:, i) .* exp(1i * (kAir * 2 * ( r - Delta) + kPlasma * 2 * Delta));

    end
end

figure(12);
imshow(E1);
title('穿过被测对象的光场');


%% First Len Properties(第一个凸透镜)
% F1 = fftshift(fft2(E1));

% 按行取一维傅里叶变换完成二维变换
for i = 1 : size(E0, 1)
    F1(i,:)= fftshift(fft(E1(i,:)));
end

imF = log( abs(F1) );
figure(21);
imshow(imF, []);
title('经过第一个透镜之后的光场');


%% Double frequency grating （双频光栅）

G0 = zeros(N, N);
G1 = zeros(N, N);

Period1 = 1 / 15;  % Period，光栅表示为1mm 20 线对
Period2 = 1 / 20;
f1 = 25;  % frequency, 1 / Period
f2 = 20;

for i = 1 : N
    for j = 1 : N
%         Delta_x = X(1, j) + L;    
        Delta_x  = ( j - center ) * Pixel_Size;
        G0(i, j) = cos(2 * pi * f1 * Delta_x) + cos(2 * pi * f2 * Delta_x);
        
    end
end

figure(31);
imshow(G0);
title('完整版双频光栅');


for i = 1 : N
    for j = 1 : N
        Delta_x  = ( j - center ) * Pixel_Size; 
        G1(i, j) = 0.5 * exp(1i * 2 * pi  * f1 * Delta_x )  + 0.5 *exp(1i * 2 * pi  * f2 * Delta_x ) ;
        
    end
end

figure(32);
imshow(abs(G1));
title('使用e指数滤除+1级之后的双频光栅');


%% Used Double frequency grating（双频光栅之后的光场）
% 更换不同的光栅的时候，需要更换G0 或者 G1
E3 = G0 .* F1;

figure(41);
imshow( log(abs(E3)), [] );
title('使用滤除+1频谱的双频光栅之后的光场');


%%  Second Len Properties(第二个凸透镜)
% E4 = ifft2(ifftshift(E3));

for i=1:N
    E4(i,:) = ifft(ifftshift(E3(i,:)));
end

figure(51);
imshow(E4);
title('经过第二个透镜之后的光场');


%% Photoconductive Detector Result （光强分布）
Cimage_E4 = conj(E4);

Light_Intensity = Cimage_E4 .* E4;


figure(61);
imshow(Light_Intensity);
title('光强分布');

figure(62);
imagesc(Light_Intensity);
colormap(gray);
title('光强分布二维视图');

figure(63);
mesh(Light_Intensity);
% colormap(gray);
title('光强分布三维视图');

figure(64);
x_axis = center;
plot(Light_Intensity( x_axis , : ), 'r' );
title('径向光强曲线');


```



#### 使用双频光栅之后的频域-光栅a

##### 探测器的光强分布

figure 63

![光强分布2-一维傅里叶](Double frequency grating Schlieren Simple Model.assets/光强分布2-一维傅里叶.bmp)



figure 64

![光强分布3-一维傅里叶](Double frequency grating Schlieren Simple Model.assets/光强分布3-一维傅里叶.bmp)







#### 使用滤除+1频谱的双频光栅之后的频域-光栅b

##### 探测器的光强分布

figure 63

![光强分布2-一维傅里叶-滤波](Double frequency grating Schlieren Simple Model.assets/光强分布2-一维傅里叶-滤波.bmp)



figure 64

![光强分布3-一维傅里叶-滤波](Double frequency grating Schlieren Simple Model.assets/光强分布3-一维傅里叶-滤波.bmp)











## Verification(验证)

> 对于仿真的结果进行验证。

### 验证思路

基于 [理论模型](#Model(模型)) 推导最终得到的光强表达式，将被测对象引起的相位偏移，导入理论公式，进行验证。

理论公式如下所示：
$$
I(x,y) 
=  E_4 (x,y) \cdot E_4 ^* (x,y)
\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad  \quad \quad \quad  \quad \quad \quad 
\\
=
\frac{1}{2} C^2 + 
\frac{1}{2} C^2 \cdot cos 
\{ 
\frac {\partial \Delta \Phi (x , y) }{\partial x} \cdot  2 \pi (f_2 - f_1)
\}
 \quad \quad \quad  \quad \quad \quad 
\\
=
\frac{1}{2} E_0(x,y)^2 + 
\frac{1}{2} E_0(x,y)^2 \cdot cos 
\{ 
\frac {\partial \Delta \Phi (x , y) }{\partial x} \cdot  2 \pi (f_2 - f_1)
\}
$$
其中，$\Delta \Phi (x, y)=
k_{TestObject} \cdot \Delta z $ ，表示为被测对象对于光场相位的该变量，$f_1$ 和 $f_2$ 表示为双频光栅的频率，C表示为一个初始平行光源的常数值。





### 验证代码

> 基于验证思路实现验证代码如下。

```matlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Verification Double Frequency Grating Schlieren MATLAB Code
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; 
clc;  
clf;
close all;


%% Laser Source （激光光源）

% Field size and sampling
% Set 5 * 5 mm field
% Sampling 1025 pixel
L = 5e-3;
N = 1024 + 1;
center = ceil( N / 2 );

x = L * linspace(-1, 1, N);  
y = L * linspace(-1, 1, N);
[X, Y] = meshgrid(x, y); 

% Wave length
% Green Laser 
lambda = 532e-9;

% Pixel Size mm
Pixel_Size = L / N;

% Constant Laser Intensity
% The uniform light intensity is 1
Laser_Intensity = 1;
E0 = Laser_Intensity + zeros(N, N);

% Figure
figure(1);
mesh(X, Y, E0);
title('光源');

figure(2);  % 显示的会是一个纯白色图像，imshow默认将取值0-1，1表示的是白色，0表示黑色
imshow(E0);
title('光源');


%% Test Object of the Cylinder （圆柱形被测对象）

E1 = E0;
Delta_Phi = zeros(N, N);

r = 0.8e-3;  % Cylinder radius 0.8mm
n_Air = 1;  % air Refractive
n_Plasma = 1 - 4 * 10^(-3);  % Cylinder Refractive

kAir = 2 * pi * n_Air / lambda;  % 计算波数 k
kPlasma = 2 * pi * n_Plasma / lambda;

% Cylinder object influence（圆柱形被测物对光场的相位影响）
for i = 1 : size(E0, 2)
    if abs(X(1, i)) >= r
        Delta_Phi(:, i) = kAir * 2 * r;

    else
        DeltaZ = sqrt(r^2 - X(1, i)^2);
        Delta_Phi(:, i) = kAir * 2 * ( r - DeltaZ) + kPlasma * 2 * DeltaZ;

    end
end

figure(11);
mesh(Delta_Phi);
% colormap(gray);
title('被测对象对于光场的相位影响');


%% Double frequency grating （双频光栅）

G = zeros(N, N);

f1 = 1 / (32 * Pixel_Size);  % Period
f2 = 1 / (64 * Pixel_Size);


%% Photoconductive Detector Result （光强分布）

Light_Intensity = zeros(N - 1, N - 1);

constant =  2 * pi * (f2 - f1);

integration = diff(Delta_Phi, 1, 2 );

for i = 1 : N - 1
    for j = 1 : N - 1
        
        Light_Intensity(i, j)  = E0(i, j)^2 * ( 1 + cos( integration(i, j) * constant ) ) / 2;
        
    end
end


figure(41);
imshow(Light_Intensity);
title('光强分布');

figure(42);
imagesc(Light_Intensity);
colormap(gray);
title('光强分布二维视图');

figure(43);
mesh(Light_Intensity);
% colormap(gray);
title('光强分布三维视图');

figure(44);
x_axis = center;
plot(Light_Intensity( x_axis , : ), 'r' );
title('径向光强曲线');



```



### 结果

#### 被测对象带来的相位变化

figure11

![被测对象带来的相位变化-验证](Double frequency grating Schlieren Simple Model.assets/被测对象带来的相位变化-验证.bmp)





#### 光强分布

figure41

![光强分布1-验证](Double frequency grating Schlieren Simple Model.assets/光强分布1-验证.bmp)



figure43

![光强分布2-验证](Double frequency grating Schlieren Simple Model.assets/光强分布2-验证.bmp)



figure44

![光强分布3-验证](Double frequency grating Schlieren Simple Model.assets/光强分布3-验证.bmp)



