

# Background oriented schlieren in a density stratified fluid



## Abstract 

在分层流动实验中，非侵入式定量流体密度测量方法至关重要。 数字成像导致合成schlieren方法，其中通过计算重建折射率的变化。 在这项研究中，提出了对这些方法之一的扩展，称为背景定向的纹影。 该扩展功能可以在分层液体实验中准确重建密度场。 通常，实验是由光源，背景图案和位于透明容器相对两侧的照相机执行的。 通过玻璃气水玻璃气进行的多媒体成像会导致额外的像差，从而破坏重建过程。 两步校准和图像重新映射转换是通过分层介质校正图像并提供透明液体非侵入式全场密度测量的关键组件。 



## I. Introduction 

密度的非侵入性测量对于分层流体实验特别重要。 在过去的十年中，开发了许多光学技术。例如，schlieren，阴影照相法，干涉仪等，可以根据流体折射率的差异进行密度变化测量。数字成像技术的发展有助于创建 数字对等物，例如合成schlieren方法。

**折射率**随n = c / c0的变化而变化，其中c，c0分别是介质和真空中的光速。 穿过不均匀密度区域的光线从其原始路径偏转。 **密度不均匀性与折射率之间的关系**由Gladstone-Dale n − 1 = G（λ）ρ定义，其中G（λ）是Gladstone-Dale常数，λ是光束的波长，而ρ是 流体的密度。

面向背景的Schlieren（BOS）属于合成schlieren方法家族. **BOS利用一种光源，该光源将位于测试室一侧的带纹理的背景（通常是点的随机图案）投射到相机上传感器位于另一侧。**第一图像（称为参考图像）通过均匀密度的停滞流体记录在背景图案上。在流体运动或密度变化时，与参考图像相比，密度梯度会引起投影图案的变形。使用**光流法或粒子图像测速（PIV）方法**对畸变进行量化，并提供与折射率导数成正比的虚拟位移场。3Raffel和Richard对叶片的形成和相互作用进行了深入的BOS研究。涡旋现象，旨在减少直升机旋翼产生的噪音。在Venkatakrishnan和Meier中可以找到BOS技术的不确定性分析。作者将在2马赫空气中行进的圆锥的2D密度场与已知的圆锥图进行了比较。作者还使用泊松方程对位移场进行了积分，并重建了密度场。

最近，Berger等人[1]将BOS扩展到空气流动的三维测量。作者扩展了图像处理算法，以捕获时间分辨的不稳定气体密度场。 在过去的十年中，一些研究集中在该技术的准确性上。 例如，Elsinga，4 Goldhahn和Seume，5和Vinnichenko 13测试了各种参数对技术的测量灵敏度和分辨率的影响，并提出了一套有关BOS系统最佳设置的指南。

BOS成功地用于测量分层（空间变化密度）流体的密度变化，研究了内部重力波（例如Sutherland10或振荡圆柱周围的密度扰动）的影响，例如Dalziel等人3。 Dalziel等人[2]使用通过BOS获得的密度梯度测量值，以校正同步采集的PIV图像并提高受折射率变化影响的速度估算的准确性。 然而，据我们所知，尚无出版物在非分层情况下实施基于泊松方程积分的分层流体重构密度场，例如，Venkatakrishnan和Meier。12在这项工作中，我们扩展了 BOS方法具有多遍校准和图像校正功能，可以在分层环境中重建密度场。

在这项研究中，我们注意到失真是由多媒体（空气玻璃，液体玻璃，空气）成像中的几种来源引起的，特别是在其数字版本中。折射率高的气-液-液界面改变了其作为透镜的行为，从而放大了光源，照相机和透镜的光学像差。因此，有必要通过此处提出的多步法校准BOS光学系统。该过程开始于通过BOS图案图像通过测试区域中的空气（空气-玻璃-空气-玻璃-空气），然后进行均匀的液体校准（空气-玻璃-液体-玻璃-空气）并重新映射数字图像。新的多步校准程序伴随着一种新颖的数字图像重新映射方法，该方法可以校正位移场。重新映射基于位移场，该位移场是通过将参考图像和均质液体的图像进行关联而获得的。此步骤之后是通过停滞的分层流体捕获的参考图像。这项研究的重要结果是，校准和数字图像校正使我们能够基于泊松方程的解重建正确的密度场。我们验证了该方法正确地重构了两个测试的密度：（a）空气-水界面； （b）多层稳定分层盐溶液。

本文的结构如下。 在第二部分中，我们简要回顾了面向背景的schlieren方法的相关原理。 第三节介绍了应用于实验数据的图像处理和重建算法。 第四节显示了这两个测试的实验装置和实验结果。 最后，我们在第五节中总结了研究。



## II. BOS MODEL

在本节中，为简洁起见，总结了BOS技术的基本原理，并通过扩展扩展了BOS技术，该扩展允许重构分层液体中的流体密度。
常见设置是背景随机点图案，该图案由光源和数码相机照亮，它们面向通过流体（气体或液体）的光，如图1所示。

<img src="Background oriented schlieren in a density stratified fluid-translation.assets/image-20200403220724211.png" alt="image-20200403220724211" style="zoom:50%;" />

>图 1. BOS设置的示意图。 z轴是成像轴，x，y是正交坐标。 重要的横截面标记为1-6。

BOS技术基于密度变化导致的背景图像失真。 该图像相对于随机图案的参考图像失真，没有液体。 畸变是沿着穿过流体的光线的折射率变化的累积效应。 位移场∆xd和∆yd可以根据参考图像和失真图像的相关性来计算。 例如，图2展示了我们实验中的畸变图像以及相应的位移场。

<img src="Background oriented schlieren in a density stratified fluid-translation.assets/image-20200403220958254.png" alt="image-20200403220958254" style="zoom:50%;" />

>图 2.（a）背景图像失真； （b）在盐溶液层上方的水层中的相应位移场

根据斯涅尔定律，光线穿过不同折射率的界面会改变与折射率比率成比例的方向（折射）。 因此，光线的曲率可近似于定居点[9]。

<img src="Background oriented schlieren in a density stratified fluid-translation.assets/image-20200403220441613.png" alt="image-20200403220441613" style="zoom:50%;" />

积分方程 （1）对于流体层的厚度W，获得偏转角αx和αy，7

<img src="Background oriented schlieren in a density stratified fluid-translation.assets/image-20200403220533430.png" alt="image-20200403220533430" style="zoom:50%;" />

当为气体流动或密度梯度场实施BOS时，这些模型足以进行进一步分析[7,9]。但是，在我们感兴趣的特定情况下，光线也会在气-玻璃，玻璃-液体，液体中折射 -玻璃和玻璃-空气接口。 根据图1，它通过第IV节（在我们的情况下，层数为N = 6）。 因此，需要扩展分析以重建密度场。 对于每一层厚度为Hi的空气，玻璃或液体，其位移均根据方程式估算。 

<img src="Background oriented schlieren in a density stratified fluid-translation.assets/image-20200403220908259.png" alt="image-20200403220908259" style="zoom:50%;" />

Δyi等效获得。 总位移∆x，∆y是各个挠度的总和

<img src="Background oriented schlieren in a density stratified fluid-translation.assets/image-20200403221918391.png" alt="image-20200403221918391" style="zoom:50%;" />

分析的下一步是基于泊松方程重建密度场：12

<img src="Background oriented schlieren in a density stratified fluid-translation.assets/image-20200403222024625.png" alt="image-20200403222024625" style="zoom:50%;" />

乘数K是不同层的贡献的倒数，

<img src="Background oriented schlieren in a density stratified fluid-translation.assets/image-20200403222101330.png" alt="image-20200403222101330" style="zoom:50%;" />

BOS方法逆转了泊松方程式（5）的使用 。 首先使用互相关PIV算法为每个坐标x，y获得位移Δx，Δy。
然后，通过数值估计（使用高阶精度数值方法）位移场的梯度，并求解未知ni的泊松方程。 在我们的情况下，分层流体层的折射率n3是所需的结果。
偏微分方程的数值解需要边界条件。 示意地，边界条件总结在图3中。

<img src="Background oriented schlieren in a density stratified fluid-translation.assets/image-20200404115319351.png" alt="image-20200404115319351" style="zoom:50%;" />

>图 3. Poisson方程解的边界条件：顶部/底部Dirichlet边界条件nx，y1 = 1.432和nx，yend = 1.332。
>左/右条件是诺伊曼型，∂n∂x| x1，y =∂n∂x| x2，yand∂n∂x| xend，y =∂n∂x| xend-1，y。

最终，使用Gladstone-Dale关系（n − 1 = G（λ）ρ）将n的场转换为密度场ρ（x，y）。



## III. IMAGE REMAPPING METHOD

文献综述表明，难以对层状流体实施合成席列烯法。 我们已经确定关键问题与多媒体成像路径有关。 这里提出的方法称为**图像重映射方法**。 该方法利用了称为重新映射的多步骤校准和图像处理例程。 重新映射是图像中每个像素按位移场指定的距离移动。

当水箱中充满空气和水（或另一种折射率均匀，接近最终溶液的液体）时，会捕获两个参考图像。 储槽中的液体会导致相机记录的图像中的点出现明显位移（称为初始图像）。 简而言之，此处说明的方法使用校准将结果与这种明显的失真分开。

这些步骤的顺序在图4的框图中显示。

<img src="Background oriented schlieren in a density stratified fluid-translation.assets/image-20200404115737640.png" alt="image-20200404115737640" style="zoom:50%;" />

> 图 4.程序流程图

•我们通过空气Ia（x，y），水Iw和盐水分层溶液Is捕获三幅背景图案的图像。 （I代表图像。）

•第一个校准是与空气和水图像相关的位移场∆x，∆y，Ia ∗ I ∗ w，其中∗是卷积算符，下标∗是共轭（反转）图像 。

•首先使用位移场重新映射通过盐水分层溶液获得的背景图案图像，该位移场的起源是光学系统和由于多媒体（空气-玻璃-水-玻璃-空气）成像而引起的像差。

•图像Is 是与空气Ia中获取的原始参考图像相关，结果Δxc，∆yc用于构造和求解泊松方程。

•泊松方程解的结果是所需的密度场ρ（x，y）（应用n→ρ转换）

<img src="Background oriented schlieren in a density stratified fluid-translation.assets/image-20200404120342068.png" alt="image-20200404120342068" style="zoom:50%;" />

>图 5.假设将位移矢量场的（左）裁剪作为其相应幅值的校准和（右）轮廓。

单个步骤的结果如图5所示。左图以箭头显示位移场∆x，∆y。该图强调了背景图案的多媒体成像所产生的典型失真。通过使空气和水图像Ia和Iw互相关来**量化位移场**。使用基于FFT的标准相关方法对两个图像进行了分析，询问区域为16×16 像素^2。**位移场的大小∆x2 + ∆y2 在图5的右图中显示为轮廓**。最大位移为数十个像素，并且在图像边缘处较大。

注意，我们介绍了整个场测量方法，图像对应于大约20×25 cm2的场。在四百万像素的图像中看不到七十像素的失真。但是，我们知道，由于泊松方程利用边界条件边缘的积分，因此误差传播到结果很重要的地方。

为了纠正图像失真，开发了**图像重映射代码**。 首先，通过将参考图像与穿过满水的水箱Iw的背景图案的图像相关联来获得校准场。 在随后的阶段中，该校准字段用于校正盐水图像产生的失真。 使用线性插值法在密集的矩形网格网格上重新采样校准矢量场。 然后使用标准图像重新映射方法将所得的新场应用于盐溶液图像的每个像素：I = I（Tx（x，y），Ty（x，y））（T表示变换图）。 它重新映射失真图像的每个像素，从而反转校准图像的位移场。

重新映射的效果并不明显，因此不容易看到。 我们在图6中展示了（a）空气-水情况和（b）多层分层解决方案在有和没有校正的情况下位移场的等高线图。原始的（未重映射的）结果由实线轮廓和校正后的线表示。 用虚线表示。 等高线图非常相似。 然而，如上所述，在**泊松方程的求解过程中会累积误差**。 作为第二 IV显示，结果对于重建的密度场非常重要

<img src="Background oriented schlieren in a density stratified fluid-translation.assets/image-20200404120902865.png" alt="image-20200404120902865" style="zoom:50%;" />

>图 6.（a）空气-水（实线）和空气-盐溶液（虚线）的位移量的等高线图。 （b）比较水盐溶液（固体）和校正后的重新映射版本（虚线）的位移量。



## IV. EXPERIMENTAL RESULTS

实验在玻璃罐中进行，该玻璃罐的横截面为20×20 cm2，高度为30 cm。 随机点图案是使用Matlab脚本创建的（makebospattern.m由Frederic Moisy提供，http：//www.fast.u-psud.fr/pivmat）。 **参考**：http://www.fast.u-psud.fr/pivmat/

在**A4尺寸的透明纸上随机分布有20万个黑点**。 具有背景图案的透明片材附着在水箱的背面。 它由配备有塑料光扩散片的白光发光二极管（LED）照明。 光分布大致均匀。 通过所提出的方法校正了由于数字BOS应用中缺少抛物面反射镜而导致的光的不均匀性。

该成像系统使用一个**4百万像素CCD相机（Optronis CL4000CXP）**，其10位传感器为2304×1720像素，其放大倍数为56.2μm/像素。 所有BOS图像对的处理均与PIV图像相似（在当前情况下，使用的是基于FFT的16×16像素互相关）。

我们在这里介绍两个重要的测试，即测试I和II。 在测试I中，我们仅使用空气中的参考图像，并实现该方法以获取**空气-水界面的位置并重建两种流体的密度**。 空气-水界面在不同的运行之间切换，通过阀门将水从水箱中排出。

在测试II中，我们使用空气中的参考图像，水中的参考图像Iw实施该方法，并尝试**重建水/泻盐（MgSO4）分层溶液的密度场**。 为了强调该方法的准确性，我们建立了四个不同的密度差层，ρ= 1.00、1.12、1.20、1.27 g / ml（使用比重瓶）。 此外，每一层都是自然分层的。

两种测试的结果显示如下。



### A. Test I results

在测试I中获得的两个示例图像（空气-水界面）如图7所示。顶部面板显示了背景图案的图像。黑线是空气（顶部）和水（底部）之间的界面。我们测试了空气-水界面的几个位置（为简洁起见，此处未显示）。图7（c）显示了BOS方法第一步的结果，这些图像与参考图像的相关性。最大位移出现在界面上。重要的是要注意，**结果取决于空气-水界面相对于照相机的成像轴的相对高度（即，图1中的射线与成像轴之间的角度**）。该算法的结果是分别来自空气和水两层ρa和ρw的密度场ρ（x，y）。密度场在水平方向上是均匀的，结果在图7（d）中显示为沿x的空间平均值。界面的位置由空气密度ρa 到 ρw的跳跃表示。

<img src="Background oriented schlieren in a density stratified fluid-translation.assets/image-20200404122231770.png" alt="image-20200404122231770" style="zoom:50%;" />

>图。 7.测试I的结果。（a）和（b）通过两层空气和水的背景图案的图像。 黑线是两个不同位置的界面。 （c）两个图像的位移场。 （d）通过泊松方程重建的密度分布。



### B. Test II results

在测试II中，我们测量了四层分层盐溶液的密度场。 原始图像显示在图2和3中。 图8（a）和8（b）以及重新映射的图像。 重新映射算法的效果尚不清楚。 但是，在计算BOS之后，我们发现了惊人的差异。

在航空盐溶液中使用朴素的BOS方法会产生**伪影**。 为了完整起见，我们首先将图8（c）中的相关结果与图8（d）中重新映射（校正）的图像对的结果进行比较。

<img src="Background oriented schlieren in a density stratified fluid-translation.assets/image-20200404122953976.png" alt="image-20200404122953976" style="zoom:50%;" />

>图 8.（a）通过四层盐水溶液浓度增加的BOS模式的原始图像。 （b）重新映射的图像。 （c）水参考图像与4层图像的相关性。 （d）重新映射的图像的相关结果。

这项工作提出的BOS方法的最终结果和主要结果如图9所示。该图显示了泊松方程中使用的位移场的大小。 接下来，我们演示泊松方程的解，将其转换为密度单位。 右面板显示了密度的空间平均轮廓。 实线对应于图9所示的结果，该结果使用重新映射的，校正后的图像对。 虚线表示未经校正的水盐溶液对分析的结果。 尽管这些值在定义上是正确的，但显然，未校正的图像对会导致完全错误的浓度分布。 我们验证了重建方法可提供不同密度层的正确位置。 在我们的案例中，结果表明，不仅可以精确地重建密度层，而且实际值的误差在5％以内。

<img src="Background oriented schlieren in a density stratified fluid-translation.assets/image-20200404123150464.png" alt="image-20200404123150464" style="zoom:50%;" />

> 图 9.校正图像对分析的结果。 （左）位移场的大小，（dx2 + dz2）1/2，（中心）泊松方程解。
> 彩色图分别对应于以像素为单位的位移场和以（g / ml）为单位的密度（右）。 BOS方法的最终结果是四层盐溶液的密度分布ρ（z）。 实线-使用新方法（虚线）校正的溶液-水盐溶液图像对位移场的Poisson解，无需校正。





## V. SUMMARY AND CONCLUSIONS

文献综述表明，基于流体的折射率，密度场的光学测量方法的应用有所增加。 这部分是由于**成像技术**的进步。 它促进了**合成数字光学方法**的使用，例如合成鹅卵石。 这些方法越来越有用的两种典型情况是可压缩的高马赫数气流和温度或密度分层流体。 在这两种情况下，密度梯度场都是最重要的。

由于在工作中强调的现象，以与在气流中相同的方式重构分层流体中的密度场是困难的–分层影响密度场重构的准确性。 例如，在使用水和盐溶液的装置中，折射率本身的变化取决于分层的程度。 这些影响在分层流体中的结果是纹影图像的变形。 对于其他光学测量技术（例如PIV），大部分流体中折射率的变化只是其他误差的来源，可以校正此误差，例如Dalziel等人[2]提出的，但是，将重建应用于BOS 失真图像的输出会导致错误的密度场。

提出了利用BOS重构分层液体流密度场的方法。 据我们所知，这是第一次使用泊松方程在多层分层中重建正确的密度场。 该方法使用静态校准，因此仅适用于密度场为二维的停滞流体，而沿成像轴没有密度梯度。 该想法正在扩展到动态校准的图像。

在分析空气和水中的背景图案图像的差异时，我们确定了分层流体中图像变形的主要原因。 由于折射率变化，背景图案有明显的位移。 表观位移对位移矢量场的大小和方向具有不可忽略的影响。 部分由于成像光学元件，图像角落的误差特别大。 然后，当我们整合泊松方程时，失真会传播到最终结果中。

这项工作中开发的算法使用反卷积方法校正了图像。 该校正减少了测量误差，并允许对分层流体中的密度进行定量测量。 此外，这种校正对于非完美平行的光源和现实的数字成像光学系统也很有用。

我们的方法提高了BOS的适用性。 校正后的图像可以产生定量的密度场数据，其质量可以与直接的侵入式密度测量相媲美。 希望这种方法将增加BOS在分层流中的应用。 还需要进行另一项研究，以验证折射率变化很大的气体和液体流动方法的准确性。





## VI. ACKNOWLEDGMENTS

以色列科学基金会根据第945/15号赠款，部分支持这项工作。





## VII. Code README

### 面向背景的Schlieren用于分层液体箱

#### 面向背景的Schlieren

维基百科，自由的百科全书
面向背景的schlieren（BOS）是一种使用流体密度和折射率之间的Gladstone-Dale关系来可视化流体密度梯度的新技术。

BOS无需使用昂贵的镜子，激光器和刀口，从而简化了可视化过程。 BOS以其最简单的形式使用了简单的背景图案，例如随机生成的点图案，便宜的闪光灯光源和高速数码相机。

在实施的最初阶段，它主要用作定性的可视化方法。开发该技术的进一步研究将使流体流动的定量可视化成为可能，包括低温流动，超音速和高超声速流动，生物医学设备流动可视化等各种应用。

在<https://en.wikipedia.org/wiki/Background-oriented_schlieren_technique>上了解更多信息。



#### 液体盒有什么特别之处



#### 分层案例有何特别之处



#### 谁写的软件

该软件主要由特拉维夫大学Alex Liberzon实验室的Lilly Verso编写，使用
以OpenPIV软件包为平台。该软件利用OpenPIV Matlab软件包进行互相关分析
（本质上是PIV分析的简化版本）和OpenPIV-用于Poisson求解器思想的压力包。额外
使用公共领域的Matlab代码对Poisson求解器进行了测试。这些软件包的作者深表感谢。



#### 依赖关系

1. OpenPIV-Matlab http://www.openpiv.net/openpiv-matlab/
2. OpenPIV-Pressure http://www.openpiv.net/openpiv-pressure/
3. IMWRAP-<https://github.com/animesh-garg/videoSeg>下的<https://github.com/animesh-garg/videoSeg/blob/master/src/classic_NL_Code/utils/imwarp.m>
4. 2D泊松方程-<http://www.mathworks.com/matlabcentral/fileexchange/38090-2d-poisson-equation/content/Poisson_equation_2D.m>
5. 创建BOS模式-Federic Moisy的<http://www.fast.u-psud.fr/~moisy/ml/misc/makebospattern.m>





#### 如何引用这项工作：

L. Verso和A. Liberzon，“密度分层流体中的背景定向Schlieren”，Rev。Sci。仪器86，103705（2015）

@article {Verso：2015，
   作者=“ Verso，Lilly和Liberzon，Alex”，
   title =“在密度分层流体中的以背景为导向的纹影”，
   journal =“科学仪器评论”，
   年=“ 2015”，
   音量=“ 86”，
   数字=“ 10”，
   eid = 103705，
   url =“ http://scitation.aip.org/content/aip/journal/rsi/86/10/10.1063/1.4934576”，
   doi =“ http://dx.doi.org/10.1063/1.4934576”
}





### VIII. Code html

#### 面向背景的SCHLIEREN适用于分层液体情况

下面提出对面向背景的Schlieren（BOS）的扩展。 该扩展功能可以在分层液体实验中准确重建密度场。 通过空气玻璃，水玻璃玻璃空气进行的多媒体成像会导致附加像差，从而破坏重建过程。 两步校准和图像重映射转换是通过分层介质校正图像并提供透明液体非侵入式全场密度测量的关键组件。



#### 内容

- [LOAD THE IMAGES](#1)
- [LOAD THE PARAMETERS FILE](#2)
- [CREATE THE CALIBRATION FIELD: Correlation air-water](#3)
- [THE REMAPPING](#4)
- [CORRELATION REFERENCE-REMAPPED](#5)
- [Comparison between corrected and not-corrected case](#6)
- [POISSON INTEGRATION](#7)
- [GRAPHICAL OUTPUT](#8)
- [ROUTINES](#9)
- [Parameters.m](#10)
- [BOS_correlation_OpenPIV.m](#11)
- [BOS_Remapping.m](#12)
- [BOS_PoissonSolver.m](#13)
- [List of the subfunctions contained in BOS_PoissonSolver](#14)
- [crop_field.m](#15)
- [create_RHS.m](#16)
- [CreateGrid.m](#17)
- [Poisson_equation_2D.m](#18)
- [Gladstone_Dale.m](#19)



#### 加载图像

我们通过空气（im1），水（im2）和盐水分层溶液（im3）捕获并加载背景图案的三幅图像（im代表图像）。

```matlab
im1=im2double(imread('Data/Air_ref.tif'));
im2=im2double(imread('Data/Water_ref.tif'));
im3=im2double(imread('Data/4layers.tif'));
```





#### 加载参数文件

参数文件包含：

必须通过实验测量的校准因子（Mconversion），因为它取决于相机分辨率和相机与背景点之间的距离；

 以像素为单位测量的图像大小（Lx，Lz）； 

泊松积分所涉及的边界条件（val_up，val_down）； 

PIV互相关算法中使用的询问区域An的像素大小（nx_pixel，ny_pixel）和两个方向x和y上的移动窗口重叠（overlap_x，overlap_y）。

```matlab
[Mconversion,Const,Lx,Lz,val_up,val_down,nx_pixel,ny_pixel,overlap_x,...
    overlap_y]=Parameters();
```



#### 创建校准字段：相关的空气-水

校准是位移场$ \Delta x $;获得的$ \Delta y $与空气和水图像（im1，im2）相关。

```matlab
[Calibration]=BOS_correlation_OpenPIV(im1,im2,nx_pixel,ny_pixel,overlap_x);

Magn_cal=sqrt(Calibration.u.^2+Calibration.v.^2);

skip = 2;              % Skip vectors
set(0,'defaulttextinterpreter','latex')

figure
subplot('position',[0.1 0.1 0.35 0.8]);
hold on
quiver(Calibration.x(1:skip:end,1:skip:end),Calibration.y(1:skip:end,1:skip:end),...
    Calibration.u(1:skip:end,1:skip:end),Calibration.v(1:skip:end,1:skip:end),...
    'AutoScale','off');
axis equal
xlim([min(min(Calibration.x)),max(max(Calibration.x))])
ylim([min(min(Calibration.y)),max(max(Calibration.y))])
title('Calibration vector field')
set(gca,'Ydir','reverse')
xlabel('x [px]')
ylabel('y [px]')

subplot('position',[0.55 0.1 0.4 0.8]);
contour(Calibration.x,Calibration.y,Magn_cal,50)
axis equal
xlim([min(min(Calibration.x)),max(max(Calibration.x))])
ylim([min(min(Calibration.y)),max(max(Calibration.y))])
set(gca,'Ydir','reverse')
title('Calibration magnitude')
xlabel('x [px]')
ylabel('y [px]')
h = colorbar;
ylabel(h,'$\sqrt{\Delta x^{2} +\Delta y^{2}} \hspace{0.25cm}[px]$');
```

<img src="Background oriented schlieren in a density stratified fluid-translation.assets/BOS_CODE_01.png" alt="img" style="zoom:75%;" />





#### 应用重新映射

通过位移场重新映射通过盐酸盐分层溶液获得的背景图案图像，该位移场起源于光学系统和由于多媒体（空气-玻璃-水-玻璃-空气）成像而引起的像差

```matlab
[im3_remapped] = BOS_Remapping(Calibration,im3);
imwrite(im3_remapped,'Remapped_4layers.tif
```





#### 相关引用已删除

将校正后的图像（im3_remapped）与原始参考图像摄入空气中（im1）相关，并将结果用于构造Poission方程并对其进行求解。 

我们建议修改An的大小并重叠，以获得更好的互相关结果，因为位移im1-im3_remapped比im1-im2偏移小一个数量级。

```matlab
nx_pixel=32;
ny_pixel=32;
overlap_x=0.25;
skip = 5;              % Skip vectors

[Displacement_POisson]=BOS_correlation_OpenPIV(im1,im3_remapped,nx_pixel,...
    ny_pixel,overlap_x);
```





#### 纠正和未纠正案例之间的比较

```matlab
[Displ_notcorr]=BOS_correlation_OpenPIV(im2,im3,nx_pixel,ny_pixel,...
    overlap_x);


figure
subplot(121)
quiver(Displ_notcorr.x(1:skip:end,1:skip:end),Displ_notcorr.y(1:skip:end,1:skip:end),...
    Displ_notcorr.u(1:skip:end,1:skip:end),Displ_notcorr.v(1:skip:end,1:skip:end),5);
axis equal
xlim([min(min(Displ_notcorr.x)),max(max(Displ_notcorr.x))])
ylim([min(min(Displ_notcorr.y)),max(max(Displ_notcorr.y))])
title('Displacement field without correction')
set(gca,'Ydir','reverse')
subplot(122)
quiver(Displacement_POisson.x(1:skip:end,1:skip:end),Displacement_POisson.y(1:skip:end,1:skip:end),...
    Displacement_POisson.u(1:skip:end,1:skip:end),Displacement_POisson.v(1:skip:end,1:skip:end),5);
axis equal
xlabel('x [px]')
ylabel('y [px]')
xlim([min(min(Displacement_POisson.x)),max(max(Displacement_POisson.x))])
ylim([min(min(Displacement_POisson.y)),max(max(Displacement_POisson.y))])
set(gca,'Ydir','reverse')
title('Displacement field corrected')
```

<img src="Background oriented schlieren in a density stratified fluid-translation.assets/BOS_CODE_02.png" alt="img" style="zoom:75%;" />



#### 泊松积分

关联的结果（im1，im3_remapped）然后通过泊松算子进行积分。 最终，通过应用Gladstone-Dale转换，我们计算出了2D密度场。

```matlab
[n2, xc, zc]=BOS_PoissonSolver(Displacement_POisson,Const,Lx,Lz);
[n2_nc, x_nc, z_nc]=BOS_PoissonSolver(Displ_notcorr,Const,Lx,Lz);

% Gladstone-Dale conversion
[Dens,Dens_av]=Gladstone_Dale(n2,xc,zc);
[Dens_2,Dens_av_2]=Gladstone_Dale(n2_nc, x_nc, z_nc);
```





#### 图形输出

```matlab
% ++++++++++++ Comparison Magnitudo +++++++++++++++++++++++++++++++++++++++

Magnitudo=sqrt(Displacement_POisson.u.^2+Displacement_POisson.v.^2);
Magnitudo_nc=sqrt(Displ_notcorr.u.^2+Displ_notcorr.v.^2);

figure
subplot(121)
contourf(Displacement_POisson.x*Mconversion,...
    Displacement_POisson.y*Mconversion,Magnitudo,50)
axis equal
h1=colorbar;
xlabel('x [cm]')
ylabel('y [cm]')
axis equal
xlim([min(min(Displacement_POisson.x*Mconversion)),...
    max(max(Displacement_POisson.x*Mconversion))])
ylim([min(min(Displacement_POisson.y*Mconversion)),...
    max(max(Displacement_POisson.y*Mconversion))])
%caxis([0 5])
title('Corrected')
set(gca,'Ydir','reverse')
ylabel(h1,'$\sqrt{\Delta x^{2} +\Delta y^{2}} \hspace{0.25cm}[px]$');

subplot(122)
contourf(Displ_notcorr.x*Mconversion,Displ_notcorr.y*Mconversion,...
    Magnitudo_nc,50)
axis equal
h2=colorbar;
xlabel('x [cm]')
ylabel('y [cm]')
axis equal
xlim([min(min(Displ_notcorr.x*Mconversion)),...
    max(max(Displ_notcorr.x*Mconversion))])
ylim([min(min(Displ_notcorr.y*Mconversion)),...
    max(max(Displ_notcorr.y*Mconversion))])
%caxis([0 5])
title('Not-corrected')
set(gca,'Ydir','reverse')
ylabel(h2,'$\sqrt{\Delta x^{2} +\Delta y^{2}} \hspace{0.25cm}[px]$');

% ++++ Results: Corrected Magnitude, Density field, Density profiles ++++++

figure
subplot('position',[0.08 0.35 0.3 0.4]);
contour(Displacement_POisson.x*Mconversion,...
    Displacement_POisson.y*Mconversion,Magnitudo,20)
axis equal
h=colorbar;
xlabel('x [cm]')
ylabel('y [cm]')
xlim([min(min(Displacement_POisson.x*Mconversion)),...
    max(max(Displacement_POisson.x*Mconversion))])
ylim([min(min(Displacement_POisson.y*Mconversion)),...
    max(max(Displacement_POisson.y*Mconversion))])
% caxis([0 10])
title('Corrected')
set(gca,'Ydir','reverse')

subplot('position',[0.42 0.35 0.3 0.4]);
pcolor(Dens.x*Mconversion, Dens.z*Mconversion, Dens.f')
shading flat
axis equal tight
xlabel('x [cm]')
title('Density Corrected')
colorbar;
set(gca,'Ydir','reverse')

subplot('position',[0.77 0.4 0.20 0.45]);
hold on
plot(Dens_av,Dens.z*Mconversion,'b','linewidth',1.5)
plot(Dens_av_2,Dens_2.z*Mconversion,'b--','linewidth',1.5)
xlabel('\rho [g/mL]')
xlim([0.99 1.3])
ylim([0 28])
Leg=legend('Corrected','Not-Corrected');
set(gca,'Ydir','reverse')
set(Leg,'location','northoutside');

% ++++++++++++ Comparison POisson solutions +++++++++++++++++++++++++++++++

figure
subplot(121)
surf(xc,zc,n2')
xlabel('x [px]')
ylabel('y [px]')
zlabel('n')
title('Corrected')

subplot(122)
surf(x_nc,z_nc,n2_nc')
xlabel('x [px]')
ylabel('y [px]')
zlabel('n')
title('Not-corrected')
```



<img src="Background oriented schlieren in a density stratified fluid-translation.assets/BOS_CODE_03.png" alt="img" style="zoom:75%;" />



<img src="Background oriented schlieren in a density stratified fluid-translation.assets/BOS_CODE_04.png" alt="img" style="zoom:75%;" />



<img src="Background oriented schlieren in a density stratified fluid-translation.assets/BOS_CODE_05.png" alt="img" style="zoom:75%;" />













