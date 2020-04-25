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
 \\
= ....?
 \quad \quad \quad \quad  \quad \quad \quad \quad \quad  \quad \quad \quad \quad \quad  \quad \quad \quad \quad \quad  \quad \quad \quad \quad \quad  
\\
= 
C \cdot 2 \pi [\delta (\xi - k \delta_0) + \delta (\eta - k \eta_0)]
 \quad \quad \quad  \quad \quad \quad \quad \quad  \quad \quad \quad \quad \quad  
\\
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
在实际的实验的时候，将双频光栅片**放置**在普通纹影仪的刀口位置附近，取代刀口。

其中穿过被测对象的每一平行光线，将在双频光栅的一级衍射角方向上分裂为一对夹角为$\Delta \theta$ 的光线。经过双频光栅后，匹配对的光线将发生**干涉**。

综上，可以表示双频光栅的方程为：
$$
g(x) = cos(2 \pi f_1 x) + cos(2 \pi f_2 x)
$$
上式中，$f_1$ 和 $f_2$ 表示为双频光栅的频率。

当频谱面与双频光栅作用的时候，由于 $g(x) $ 是周期函数，可以写成傅里叶级数的形式，如下所示：
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

所以，可以得到**刀口后的电场**表达式：
$$
E_3 (\xi, \eta)  
= 
F (\xi, \eta) \cdot G(\xi)
$$







### Second  Len（第二个凸透镜）

光线经过第二个透镜的时候，由于透镜具有傅里叶特性，根据傅里叶变化，可以得到双频光栅纹影装置中光线经过第二个凸透镜之后的光场信息为：

$$
E_4 (x,y) 
= 
\mathcal{F}^{-1} \{ E_3 (\xi, \eta)  \} 
$$
其中，$E_4 (x, y) $ 是$E_3 (\xi, \eta)$ 的准确傅里叶变换，常数相位因子无关紧要。

进行化简如下：
$$
E_4 (x,y) 
= 
\mathcal{F}^{-1} \{ E_3 (\xi, \eta)  \} 
\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad  \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad 
\\
=
\iint _{-\infty}^{+\infty}
E_3 (\xi, \eta) 
\exp \{  i  ( 2 \pi \xi +  2 \pi  \eta) \}
d\xi  d\eta
\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad 
\\
=
\iint _{-\infty}^{+\infty}
F (\xi, \eta) \cdot G(\xi) \cdot
\exp \{  i  ( 2 \pi \xi +  2 \pi  \eta) \}
d\xi  d\eta
\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad 
\\
=
\iint _{-\infty}^{+\infty}
F (\xi, \eta) \cdot 
\frac{1}{2} (e^{i 2 \pi f_1 \xi }+ e^{ - i 2 \pi f_1 \xi}
+
e^{i 2 \pi f_2 \xi }+ e^{ - i 2 \pi f_2 \xi})
\cdot
\exp \{  i  ( 2 \pi \xi +  2 \pi  \eta) \}
d\xi  d\eta
\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad 
\\
=
\iint _{-\infty}^{+\infty}
C \cdot 2 \pi [\delta (\xi - k \delta_0) + \delta (\eta - k \eta_0)]
\cdot 
\frac{1}{2} (e^{i 2 \pi f_1 \xi }+ e^{ - i 2 \pi f_1 \xi}
+
e^{i 2 \pi f_2 \xi }+ e^{ - i 2 \pi f_2 \xi})
\cdot
\exp \{  i  ( 2 \pi \xi +  2 \pi  \eta) \}
d\xi  d\eta
\\
=
\frac{1}{2} C \cdot
\iint _{-\infty}^{+\infty}
\cdot 2 \pi [\delta (\xi - k \delta_0) + \delta (\eta - k \eta_0)]
\cdot  
(e^{i 2 \pi f_1 \xi }+ e^{ - i 2 \pi f_1 \xi}
+
e^{i 2 \pi f_2 \xi }+ e^{ - i 2 \pi f_2 \xi})
\cdot
\exp \{  i  ( 2 \pi \xi +  2 \pi  \eta) \}
d\xi  d\eta
\\
= .....?
\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad 
\\
=
\frac{1}{2} C \cdot [ e^{ i \Delta \varphi (x - 2 \pi f_1 , y) } + e^{ i \Delta \varphi (x - 2 \pi f_2 , y) }]
\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad
$$








### Light intensity（光强）

已知光线经过第二个凸透镜，到达像平面的光场，其表示为 $E_4 (x,y) $ 。

所以，可以得到**光电探测器的强度**表示为：
$$
I(x,y) = < E_4 (x,y) \cdot E_4 ^* (x,y) >
$$
其中， $ < \cdot > $ 表示时间平均。

也即，
$$
I(x,y) 
=  E_4 (x,y) \cdot E_4 ^* (x,y)
$$

其中复共轭 $E_4 ^* (x,y)$ 可以表示为：
$$
E_4 ^* (x,y)
=
\frac{1}{2} C \cdot [ e^{ -i \Delta \varphi (x - 2 \pi f_1 , y) } + e^{ - i \Delta \varphi (x - 2 \pi f_2 , y) }]
$$
所以，最后光电探测器上光场强度可以表示为：
$$
I(x,y) 
=  E_4 (x,y) \cdot E_4 ^* (x,y)
\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad
\\
=
\frac{1}{2} C \cdot [ e^{ i \Delta \varphi (x - 2 \pi f_1 , y) } + e^{ i \Delta \varphi (x - 2 \pi f_2 , y) }]
\cdot
\frac{1}{2} C \cdot [ e^{ -i \Delta \varphi (x - 2 \pi f_1 , y) } + e^{ - i \Delta \varphi (x - 2 \pi f_2 , y) }]
 \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad 
\\
=
\frac{1}{4} C^2 + \frac{1}{4} C^2 + 
\frac{1}{4} C^2 \cdot e^{ i \Delta \varphi (x - 2 \pi f_1 , y) }  \cdot e^{ -i \Delta \varphi (x - 2 \pi f_2 , y) } + 
\frac{1}{4} C^2 \cdot e^{ i \Delta \varphi (x - 2 \pi f_2 , y) }  \cdot e^{ -i \Delta \varphi (x - 2 \pi f_1 , y) }
 \quad \quad \quad \quad \quad 
\\
=
\frac{1}{2} C^2 + 
\frac{1}{4} C^2 \cdot e^{ i [ \Delta \varphi (x - 2 \pi f_1 , y) - \Delta \varphi (x - 2 \pi f_2 , y) ]} + 
\frac{1}{4} C^2 \cdot e^{ i [ \Delta \varphi (x - 2 \pi f_2 , y) - \Delta \varphi (x - 2 \pi f_1 , y) ] }
 \quad \quad \quad \quad \quad  \quad \quad \quad \quad \quad  \quad 
\\
= ... ?
 \quad \quad \quad \quad \quad  \quad \quad \quad \quad \quad  \quad \quad \quad \quad \quad  \quad \quad \quad  \quad \quad \quad  \quad \quad   \quad \quad \quad \quad \quad  \quad \quad \quad \quad \quad  \quad \quad \quad \quad \quad  \quad  \quad  \quad 
\\
=
\frac{1}{2} C^2 + 
\frac{1}{4} C^2 \cdot \{2 cos [\Delta \varphi (x - 2 \pi f_1 , y) - \Delta \varphi (x - 2 \pi f_2 , y) ] \}
 \quad \quad \quad \quad \quad  \quad \quad \quad \quad \quad  \quad \quad \quad \quad \quad  \quad \quad \quad 
\\
=
\frac{1}{2} C^2 + 
\frac{1}{2} C^2 \cdot cos \{ 
\frac{\Delta \varphi (x - 2 \pi f_1 , y) - \Delta \varphi (x , y)}{-2 \pi f_1} \cdot ( -2 \pi f_1)
+
\frac{\Delta \varphi (x , y) - \Delta \varphi (x - 2 \pi f_2 , y) }{2 \pi f_2} \cdot ( 2 \pi f_2)
\}
\\
=
\frac{1}{2} C^2 + 
\frac{1}{2} C^2 \cdot cos 
\{ 
\frac {\partial \Delta \varphi (x , y) }{\partial x} \cdot  2 \pi (f_2 - f_1)
\}
 \quad \quad \quad \quad \quad  \quad \quad \quad \quad \quad  \quad \quad \quad \quad \quad  \quad \quad \quad  \quad \quad \quad  \quad \quad  
\\
$$







## Code（代码）

> 将上述模型内容实现成为代码。

```matlab



```





## Result（结果）

### 光源





### 经过被测对象后光场



### 使用的刀口



### 第二个凸透镜后的光场





### 探测器的光强

















