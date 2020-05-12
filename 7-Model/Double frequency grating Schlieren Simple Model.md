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
其中，$k_{TestObject}$ 表示光线经过被测对象的波数，可表示为 $k_{TestObject} = \frac{2 \pi }{\lambda} \cdot n_{TestObject}$ , $\Delta z$ 表示光线沿光轴方向穿过被测对象的距离。

其中，相位的偏移表达式也可以表示为：
$$
\Delta \Phi (x, y)=
\int _{z_1} ^{z_2}
\frac{2 \pi }{\lambda} \cdot n_{TestObject}(x, y, z)
\cdot dz
$$
其中，$z_1$ 表示为被测对象靠近光源的位置，$z_2$ 表示为被测对象远离光源的位置，其中$z_2 > z_1$，并且$z_2 - z_1$ 就是光线沿光轴方向穿过被测对象的距离。$n_{TestObject}(x, y, z)$ 表示被测对象在空间上的折射率。

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
其中，$F (\xi, \eta) $ 是$E_1 (x, y)$ 的准确傅里叶变换，常数相位因子无关紧要。





### Double frequency grating（双频光栅）

**双频光栅**是一块在干板上记录着两个空间频率相差不大的正弦光栅。

双频光栅的两个**周期**，分别表示为：
$$
d_1 = \lambda / sin \theta_1 
\\
d_2 = \lambda / sin \theta_2
$$
角度差 $\Delta \theta = | \theta_1 - \theta_2 |$ ，表示为双频光栅的**分裂角**。

双频光栅的**一级平均衍射角**为：$\theta = (\theta_1 + \theta_2) / 2$ 。

双频光栅的**拍周期**表示为：
$$
\frac{1}{d'} = | \frac{1}{d_1} - \frac{1}{d_2} | = | \frac{sin \theta_1  - sin \theta_2 }{\lambda} |
$$
在实际的实验的时候，将双频光栅片**放置**在普通纹影仪的刀口位置，取代刀口装置。

其中穿过被测对象的每一平行光线，将在双频光栅的一级衍射角方向上分裂为一对夹角为$\Delta \theta$ 的光线。经过双频光栅后，匹配对的光线将发生**干涉**。

综上，可以表示**双频光栅的方程**为：
$$
g(x) = cos(2 \pi f_1 x) + cos(2 \pi f_2 x)
$$
上式中，$f_1$ 和 $f_2$ 表示为双频光栅的频率。

当频谱面与双频光栅作用的时候，由于 $g(x) $ 是周期函数，可以写成傅里叶级数的形式，并基于[欧拉公式](#欧拉公式)，化简余弦函数，如下所示：
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
其中，$\xi$ 与$x$ 相对应。

所以，可以得到**刀口后的电场**表达式，并利用**空间滤波器滤除+1级频谱**，基于**傅里叶变换的时移特性**：
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
其中，$E_4 (x, y) $ 是$E_3 (\xi, \eta)$ 的准确傅里叶变换，常数相位因子无关紧要。

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

其中，$E_4 (x, y)$ 是$E_3 (x, y)$ 的准确傅里叶变换，常数相位因子无关紧要。






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







## Code（代码）

> 将上述模型内容实现成为代码。
>
> 对标文件：DoubleFrequencyGratingSchlierenMain.m

```matlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Double Frequency Grating Schlieren MATLAB Code
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
x = L * linspace(-1, 1, N);  
y = L * linspace(-1, 1, N);
[X, Y] = meshgrid(x, y); 
center = N / 2;

% Wave length
% Green
lambda = 532e-9;

% Pixel Size
Pixel_Size = L / N;

% Constant Laser Intensity
% The uniform light intensity is 1
Laser_Intensity = 1;
E0 = Laser_Intensity + zeros(N, N);

% Figure
figure(1);
mesh(X, Y, E0);


%% Test Object of the Cylinder （圆柱形被测对象）

E1 = E0;
Delta_Phi = zeros(N, N);

r = 0.8e-3;  % Cylinder radius 0.8mm
n_Air = 1;  % air Refractive
n_Plasma = 1 - 4 * 10^(-3);  % Cylinder Refractive

% A formula to calculate
kAir = 2 * pi * n_Air / lambda;
kPlasma = 2 * pi * n_Plasma / lambda;
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
title('E1');


% Cylinder object influence
for i = 1 : size(E0, 2)
    if abs(X(1, i)) >= r
        Delta_Phi(:, i) = kAir * 2 * r;

    else
        Delta = sqrt(r^2 - X(1, i)^2);
        Delta_Phi(:, i) = kAir * 2 * ( r - Delta) + kPlasma * 2 * Delta;

    end
end

figure(15);
mesh(Delta_Phi);
title('Delta_Phi');


%% First Len Properties

F1 = fftshift(fft2(E1));

F1_ = log(abs(F1).^2)-2;
max_F1 = max(max(F1_));
F1_ = F1_ / max_F1;

figure(21);
imshow(F1_);
title('F1_');


%% Double frequency grating

G = zeros(N, N);

f1 = 1 / (32 * Pixel_Size);  % Period
f2 = 1 / (64 * Pixel_Size);

for i = 1 : N
    for j = 1 : N
        Delta_x = (j - center) * Pixel_Size;
        Delta_y = (center - i) * Pixel_Size;
        
        G(i, j) = cos(2 * pi * f1 * Delta_x) + cos(2 * pi * f2 * Delta_x);
    end
end


figure(31);
imshow(G);
title('G');


%% Used Double frequency grating
E3 = G .* F1;

figure(41);
imshow(E3);
title('E3');


%% Fourier transform and Used Double frequency grating
E4 = ifft2(ifftshift(E3));

figure(51);
imshow(E4);
title('E4');


%% Fourier transform and don't Used Double frequency grating
Reference_E4 = ifft2(ifftshift(F1));

figure(61);
imshow(Reference_E4);
title('Reference_E4');


%% Photoconductive Detector Result and Used Double frequency grating
Cimage_E4 = conj(E4);

I = Cimage_E4 .* E4;


figure(71);
imshow(I);

figure(72);
imagesc(I);
colormap(gray);

figure(73);
mesh(I);
title('I');


%% Photoconductive Detector Result and don't Used Double frequency grating
Cimage_Reference_E4 = conj(Reference_E4);

I_Reference = Cimage_Reference_E4 .* Reference_E4;


figure(81);
imshow(I_Reference);

figure(82);
imagesc(I_Reference);
colormap(gray);

figure(83);
mesh(I_Reference);
title('I_Reference');





% Reference
% Reference_E4 = fftshift(fft2(Reference_E3));
% 
% Reference_E4_ = log(abs(Reference_E4).^2) - 2;
% max_Reference_E4 = max(max(Reference_E4_));
% Reference_E4_ = Reference_E4_ / max_Reference_E4;
% figure(41);
% imshow(Reference_E4_);
% title('Reference_E4_');
% 
% figure(42);
% imshow(log(abs(Reference_E4)), []);
% 
% 
% % Test
% Test_E4 = fftshift(fft2(Test_E3));
% 
% Test_E4_ = log(abs(Test_E4).^2) - 2;
% max_Test_E4 = max(max(Test_E4_));
% Test_E4_ = Test_E4_ / max_Test_E4;
% figure(43);
% imshow(Test_E4_);
% title('Test_E4_');
% 
% figure(44);
% imshow(log(abs(Test_E4)), []);
% 

%% Filter frequency +1
% % Reference
% Reference_Frequence = zeros(N, N);
% 
% line = 513;
% column = 529;
% Reference_Frequence(line-3: line+3, column-3: column+3) = Reference_E4(line-3: line+3, column-3: column+3);
% 
% Reference_Frequence_ = log(abs(Reference_Frequence).^2) - 2;
% max_Reference_Frequence = max(max(Reference_Frequence_));
% Reference_Frequence_ = Reference_Frequence_ / max_Reference_Frequence;
% figure(51);
% imshow(Reference_Frequence_);
% title('Reference_Frequence_');
% 
% figure(52);
% imshow(log(abs(Reference_Frequence)), []);   
% 
% 
% % Test
% Test_Frequence = zeros(N, N);
% 
% Test_Frequence(line-3: line+3, column-3: column+3) = Test_E4(line-3: line+3, column-3: column+3);
% 
% Test_Frequence_ = log(abs(Test_Frequence).^2) - 2;
% max_Test_Frequence = max(max(Test_Frequence_));
% Test_Frequence_ = Test_Frequence_ / max_Test_Frequence;
% figure(53);
% imshow(Test_Frequence_);
% title('Test_Frequence_');
% 
% figure(54);
% imshow(log(abs(Test_Frequence)), []);
% 
% 
% %% Inverse Fourier transform
% % Reference
% Reference_E5 = ifft2(ifftshift(Reference_Frequence));
% 
% figure(61);
% imshow(Reference_E5);
% title('Reference_E5');
% 
% 
% % Test
% Test_E5 = ifft2(ifftshift(Test_Frequence));
% 
% figure(62);
% imshow(Test_E5);
% title('Test_E5');
% 
% 
% %% The phase field
% % Reference
% Reference_E6 = zeros(N, N);
% 
% for i = 1: N
%     for j = 1: N
%         Reference_E6(i, j) = atan2(imag(Reference_E5(i, j)), real(Reference_E5(i, j)));  % Calculate the phase principal
%     end
% end
% 
% figure(71);
% mesh(Reference_E6);
% 
% figure(72);
% imshow(Reference_E6);
% title('Reference_E6');
% 
% 
% % Test
% Test_E6 = zeros(N, N);
% 
% for i = 1: N
%     for j = 1: N
%         Test_E6(i, j) = atan2(imag(Test_E5(i, j)), real(Test_E5(i, j)));  % Calculate the phase principal
%     end
% end
% 
% figure(73);
% mesh(Test_E6);
% 
% figure(74);
% imshow(Test_E6);
% title('Test_E6');
% 
% 
% %% Phase unwrapping
% % Reference
% Reference_Phase = zeros(N, N);
% 
% for i = 1: N
%     Reference_Phase(i, :) = unwrap(Reference_E6(i, :));   %相位解包裹
% end
% 
% figure(81);
% mesh(Reference_Phase);
% 
% 
% % Test
% Test_Phase = zeros(N, N);
% 
% for i = 1: N
%     Test_Phase(i, :) = unwrap(Test_E6(i, :));   %相位解包裹
% end
% 
% figure(82);
% mesh(Test_Phase);
% 
% 
% 
% %% Interference in the results
% Interference_result = Test_Phase - Reference_Phase;
% 
% figure(91);
% mesh(Interference_result);
% 
% 
% figure(92);
% imagesc(Interference_result);
% 
% 
% %% Abel inverse transformation
% % N0 = n_Air;          % 环境折射率
% % lamda = lambda;     % 激光的波长为532nm 绿光
% % 
% % diff_D = Interference_result;
% % 
% % for m = 1: size(diff_D, 1)
% %     for n = fix(size(diff_D, 2) / 2): (size(diff_D, 2) - 1)     %将n分成两部分求
% %         k = 0;
% %         sqrt_nr = [];
% %         for n2 = n: size(diff_D, 2)       %       for循环
% %             k = k + 1;
% %             sqrt_nr(k) = sqrt((n2+1)^2 - n^2);
% %         end
% %         len = length(diff_D(m, n: end));
% %         Nr(m,n) = (-lamda/ (2* pi^2)) * (sum(diff_D(m,n:end) ./ sqrt_nr(1: len))) + N0;
% %     end
% %     
% %     for n = 1: fix(size(diff_D, 2) /2)                      % fix就是向0取整数
% %         k = 0;
% %         sqrt_nr = [];
% %         for n2 = n: size(diff_D, 2)
% %             k = k + 1;
% %             sqrt_nr(k) = sqrt((n2 + 1)^2 - n^2);
% %         end
% %         len = length(diff_D(m, n: end));
% %         Nr(m, n) = (-lamda/ (2* pi^2)) * (sum(diff_D(m, n: end) ./ sqrt_nr(1: len))) + N0;
% %     end
% % end
% % figure(101);
% % imagesc(Nr);title('折射率俯视图');
% % 
% % figure(102);
% % mesh(Nr);title('折射率三维图');
% % 
% % % figure(103);surf(Nr, 'LineStyle', 'none');title('折射率截面');
% % 
% % [u, v, channels] = size(Nr);
% % v = 512;
% % figure(104);
% % title('折射率截面');
% % plot(Nr(:, v), 'c'); %青色-300的列矩阵
% % grid on;
% % 
% 
% 
% %% Abel New
% PRO = radon(Interference_result, 0);
% figure(111);
% plot(PRO);
% 
% PRO_dif = diff(PRO);
% figure(112);
% plot(PRO_dif);
% 
% 
% delta0=1;
% 
% %% CT参数设置
% tNum = 18; %投影方向数,180个投影方向(最好是18的倍数)
% pNum = size(PRO_dif, 1);  % 每方向采样数(不是"十"，是"l")
% EsNum = pNum * delta0;   % 每方向投影宽度，m
% sAreax = EsNum / sqrt(2); % 重建区域尺寸，m
% gNum = 200;  % 重建区域网格划分
% shijichicun = delta0 * pNum;   % 重建实际尺寸 
% % Re0=1.000270396017465497;  % 参考折射率(532nm)
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SrcImg = zeros(tNum, pNum);
% for i = 1: pNum
%     SrcImg(:, i) = PRO_dif(i);
% end  %投影数据
% 
% ResImg = zeros(gNum, gNum); % 重建面大小
% Delta = sAreax / gNum;  % 重建网格间距
% 
% tDelta = pi/ tNum;   % 投影方向间隔
% pDelta = EsNum/ pNum;  % 单方向投影采样间隔
% 
% px0 = -Delta * (gNum-1) / 2;
% py0 = px0;
% 
% tTheta = zeros(tNum);
% for i = 1: tNum
%     tTheta(i) = (i-1) * tDelta;
% end
% 
% FMax = 1 / (2 * pDelta);
% 
% for i = 1: gNum
%     for j = 1: gNum
%         ResImg(i,j) = 0;
%         
%         cx = px0 + (j-1) * Delta;
%         cy = py0 + (gNum-i) * Delta;
%         
%         for m = 1: tNum
%             sumv = 0;
%             rx = cx * cos(tTheta(m)) + cy*sin(tTheta(m));
%             for n = 1: pNum
%                 Index = rx-((n-1) * pDelta-EsNum / 2);
%                 % 消除倾斜
%                 % sumv=sumv+(SrcImg(m,n)*CalK(Index,FMax))*(1-10*Index^2/0.05^2)*pDelta;   %原来此句话是这样的 sumv=sumv+(SrcImg(m,n)*CalK(Index,FMax))*(1-4*Index^2/0.05^2)*pDelta;
%                 % sumv=sumv+(SrcImg(m,n)*CalK(Index,FMax))*(1-4*Index^2/0.05^2)*pDelta;
%                 % 不消除倾斜
%                 sumv = sumv + (SrcImg(m, n) * CalK(Index, FMax)) * pDelta;
%             end
%             ResImg(i, j) = ResImg(i, j) + sumv * tDelta;
%         end
%         ResImg(i, j) = -ResImg(i, j);
%     end
% end
% 
% figure(113);
% mesh(ResImg);
% 
% % for i=1:gNum
% %     for j=1:gNum
% %         ResImg(i,j)=Re0-ResImg(i,j);
% %     end
% % end
% % figure,mesh(ResImg-1);
% 
% 
% 



```





## Result（结果）

> 根据仿真的过程，保存相应阶段的图片。

### 光源

figure 1

![光源](Double frequency grating Schlieren Simple Model.assets/光源.bmp)



### 被测对象带来的相位变化

Figure 11

![被测对象带来的相位变化-3D](Double frequency grating Schlieren Simple Model.assets/被测对象带来的相位变化-3D.bmp)



![被测对象带来的相位变化-1D](Double frequency grating Schlieren Simple Model.assets/被测对象带来的相位变化-1D.bmp)





### 经过被测对象后光场

Figure 12

![经过被测对象后光场](Double frequency grating Schlieren Simple Model.assets/经过被测对象后光场.bmp)





### 经过第一个透镜之后

Figure21

![经过第一个透镜之后](Double frequency grating Schlieren Simple Model.assets/经过第一个透镜之后.bmp)



### 双频光栅

![双频光栅](Double frequency grating Schlieren Simple Model.assets/双频光栅.bmp)



### 加双频光栅之后的光场

![穿过双频光栅之后](Double frequency grating Schlieren Simple Model.assets/穿过双频光栅之后.bmp)





### 不加双频光栅穿过第二个透镜光场

figure61

![不加双频光栅穿过第二个透镜光场](Double frequency grating Schlieren Simple Model.assets/不加双频光栅穿过第二个透镜光场.bmp)



figure62

![不加双频光栅穿过第二个透镜光场2](Double frequency grating Schlieren Simple Model.assets/不加双频光栅穿过第二个透镜光场2.bmp)





### 加双频光栅穿过第二个透镜光场

figure 51

![加双频光栅穿过第二个透镜光场](Double frequency grating Schlieren Simple Model.assets/加双频光栅穿过第二个透镜光场.bmp)



Figure 52

![加双频光栅穿过第二个透镜光场2](Double frequency grating Schlieren Simple Model.assets/加双频光栅穿过第二个透镜光场2.bmp)





### 不加双频光栅探测器的光强

Figure 81

![不加双频光栅探测器的光强](Double frequency grating Schlieren Simple Model.assets/不加双频光栅探测器的光强.bmp)



figure 82

![不加双频光栅探测器的光强2](Double frequency grating Schlieren Simple Model.assets/不加双频光栅探测器的光强2.bmp)



### 加双频光栅探测器的光强

figure 71

![加双频光栅探测器的光强](Double frequency grating Schlieren Simple Model.assets/加双频光栅探测器的光强.bmp)



figure 72

![加双频光栅探测器的光强2](Double frequency grating Schlieren Simple Model.assets/加双频光栅探测器的光强2.bmp)



figure 73

![加双频光栅探测器的光强3](Double frequency grating Schlieren Simple Model.assets/加双频光栅探测器的光强3.bmp)







## Verification(验证)

> 对于仿真的结果进行验证。

### 实现思路

1.分别获得添加测试对象和没有添加测试对象的光强图

2.进行光强图处理，解相位，得到折射率



### 获取测试光强图代码

> 对标文件：DoubleFrequencyGratingSchlierenMain.m

```matlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Double Frequency Grating Schlieren MATLAB Code
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
x = L * linspace(-1, 1, N);  
y = L * linspace(-1, 1, N);
[X, Y] = meshgrid(x, y); 
center = N / 2;

% Wave length
% Green
% Variable lambda
lambda = 532e-9;

% Pixel Size
Pixel_Size = L / N;

% Constant Laser
% The uniform light intensity is 1
Laser_Intensity = 1;
E0 = Laser_Intensity + zeros(N, N);

% Figure
figure(1);
mesh(X, Y, E0);

if (mod(N, 2)==0)
	halfNy = N / 2;
else
	halfNy = (N + 1) / 2;
end
figure(2);
plot(x, E0(halfNy, :), 'c');
grid on;

figure(3);
imagesc(E0);


%% Test Object of the Cylinder （圆柱形被测对象）

E1 = E0;
Delta_Phi = zeros(N, N);

r = 0.8e-3;  % Cylinder radius 0.8mm
n_Air = 1;  % air Refractive
n_Plasma = 1 - 4 * 10^(-3);  % Cylinder Refractive

% A formula to calculate
kAir = 2 * pi * n_Air / lambda;
kPlasma = 2 * pi * n_Plasma / lambda;
for i = 1 : size(E0, 2)
    if abs(X(1, i)) >= r
        E1(:, i) = E0(:, i) .* exp(1i * kAir * 2 * r);

    else
        Delta = sqrt(r^2 - X(1, i)^2);
        E1(:, i) = E0(:, i) .* exp(1i * (kAir * 2 * ( r - Delta) + kPlasma * 2 * Delta));

    end
end

% Figure
figure(12);
imshow(E1);
title('E1');


%% First Len Properties
% Test 
F1 = fftshift(fft2(E1));

% Reference 
Reference_F1 = fftshift(fft2(E0));

F1_ = log(abs(F1).^2)-2;
max_F1 = max(max(F1_));
F1_ = F1_ / max_F1;

Reference_F1_ = log(abs(Reference_F1).^2)-2;
max_Reference_F1_ = max(max(Reference_F1_));
Reference_F1_ = Reference_F1_ / max_Reference_F1_;

figure(21);
imshow(F1_);
title('F1_');

figure(22);
imshow(Reference_F1_);
title('Reference_F1_');



%% Double frequency grating

G = zeros(N, N);

f1 = 1 / (32 * Pixel_Size);  % Period
f2 = 1 / (64 * Pixel_Size);

for i = 1 : N
    for j = 1 : N
        Delta_x = (j - center) * Pixel_Size;
        Delta_y = (center - i) * Pixel_Size;
        
        G(i, j) = cos(2 * pi * f1 * Delta_x) + cos(2 * pi * f2 * Delta_x);
    end
end


figure(31);
imshow(G);
title('G');


%% Used Double frequency grating
% Test 
E3 = G .* F1;

% Reference 
Reference_E3 = G .* Reference_F1;

figure(41);
imshow(E3);
title('E3');

figure(42);
imshow(Reference_E3);
title('Reference_E3');


%% Fourier transform
% Test 
E4 = ifft2(ifftshift(E3));

% Reference 
Reference_E4 = ifft2(ifftshift(Reference_E3));

figure(51);
imshow(E4);
title('E4');

figure(52);
imshow(log(abs(E4)), []);

figure(53);
imshow(Reference_E4);
title('Reference_E4');

figure(54);
imshow(log(abs(Reference_E4)), []);


%% Photoconductive Detector Result and Used Double frequency grating
% Test 
Cimage_E4 = conj(E4);
I = Cimage_E4 .* E4;

% Reference 
Cimage_I = conj(Reference_E4);
Reference_I = Cimage_I .* Reference_E4;

figure(71);
imshow(I);

figure(72);
imagesc(I);
colormap(gray);

figure(73);
mesh(I);
title('I');

figure(74);
imshow(Reference_I);

figure(75);
imagesc(Reference_I);
colormap(gray);

figure(76);
mesh(Reference_I);
title('Reference_I');


```



### 测试光强图

figure 71

![TestPic](Double frequency grating Schlieren Simple Model.assets/TestPic.bmp)

figure 74

![ReferencePic](Double frequency grating Schlieren Simple Model.assets/ReferencePic.bmp)





### 验证代码

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


%% Input Data
% Path Configure 
Code_path = fileparts(mfilename('fullpath'));
Data_path = 'Data/';

Test_name = 'TestPic';  % Can be changed name
Reference_name = 'ReferencePic';

Test_Path = fullfile(Code_path, Data_path, Test_name);
Reference_Path = fullfile(Code_path, Data_path, Reference_name);

% Import picture
Test = imread([ Test_Path '.bmp']);  % Can be change picture format
Reference = imread([ Reference_Path '.bmp']);

% Figure
figure(1);
imshow(Test);

figure(2);
imshow(Reference);

% Test = imrotate(Test, 90,'nearest');
% figure(3);
% imshow(Test)
% 
% Reference = imrotate(Reference, 90,'nearest');
% figure(4);
% imshow(Reference)


%% Change to gray picture
Test_Gray = rgb2gray(Test);
Reference_Gray = rgb2gray(Reference);

% Figure
figure(11);
imshow(Test_Gray);

figure(12);
imshow(Reference_Gray);


%% Used Binarization
Test_threshold = graythresh(Test_Gray);  % Find Binarization threshold
Test_Binarization = im2bw(Test_Gray, Test_threshold);  % Set Binarization

Reference_threshold = graythresh(Reference_Gray);
Reference_Binarization = im2bw(Reference_Gray, Reference_threshold);

% Figure
figure(21);
imshow(Test_Binarization)

figure(22);
imshow(Reference_Binarization)



%% Fourier transform 
Test_FFT = fftshift(fft2(Test_Gray));
Reference_FFT = fftshift(fft2(Reference_Gray));

figure(31);
imshow(log(abs(Test_FFT)), []);

figure(32);
imshow(log(abs(Reference_FFT)), []);

aaa = fft2(fftshift(Test));
figure(33);
imshow(log(abs(aaa)), []);


%% 
Test_IFFT = ifft2(Test_FFT);
Reference_IFFT = ifft2(Reference_FFT);


figure(41);
imshow(Test_IFFT)

figure(42);
imshow(Reference_IFFT)


%%
Test_Angle = angle(Test_IFFT);

figure(51);
mesh(Test_Angle)


%% 
Test_Phase = unwrap(Test_Angle);

figure(61);
mesh(Test_Phase)













```



























