# README

## instruction

这个文档设计我看过的所有关于schlieren的GitHub上的code，做出的总结。

链接地址：https://github.com/search?q=schlieren

对于重要的文章，我会在其后面标注星号，即*。

**特别重要**（有论文有代码）：* * * * *  

**值得使用**（一些小工具代码）：* * *

**可以看一下**（有一点特色的代码段）：*





## 01-SchlierenRay

使用的是Qt框架的C++写的，由于我目前还不会，所以略过。



## 02-bos* * * * *

是一篇论文的代码，论文：Background Oriented Schlieren for stratified liquid cases。

OpenPIV-githubCode

https://github.com/OpenPIV



OpenPIV-Matlab

 http://www.openpiv.net/openpiv-matlab/



OpenPIV-Pressure

 http://www.openpiv.net/openpiv-pressure/



OpenPIV-python

http://www.openpiv.net/openpiv-python/



random dot pattern

The random dot pattern is created using a Matlab script (makebospat- tern.m courtesy of Frederic Moisy, http://www.fast.u-psud.fr/pivmat). 

http://www.fast.u-psud.fr/pivmat/



### Gladstone_Dale

![image-20200202213727735](README.assets/image-20200202213727735.png)





## 03-PyFSPro



Schlieren-Videography

https://hackaday.io/project/9034-schlieren-videography



这个程序一直没有运行，卡在了liblo的安装，最终我还会放弃了。

liblo (sudo apt-get install python-liblo)





## 04-Background-Oriented-Schlieren* * * 

包含产生BOS背景图的程序，以及示例图像





## 05-schlieren

这个里面关于Python2的代码直接使用不了，还是缺少一个包npshm，一直找不到啊！放弃了！

关于MATLAB的代码，也是醉了，里面只有函数，没有入口程序。直接放弃了！







## 06-Schlieren_PG* * * 

可以直观的看到纹影的图，还可以进行相应的操作。选择不同的参数。

值得学习的地方是那个室友kivy图像化显示的窗口操作方法，很妙！





## 07-Schlieren-Videography-with-Moir-Effekt

这是一个捕捉纹影的程序，怎么使用我也不会，目前是没有任何的价值。





## 08-SchlierenMkIV

未下载，属于新的文件

https://github.com/InterplanetaryEngineer/SchlierenMkIV





## 09-SchlierenView

安装picamera的时候报错了，导致这个代码依然没法看！！！放弃看！





## 10-zebrography

基于CW-BOS成像技术对聚焦超声(FUS)压力场进行了定量成像。



## 11-schlieren*

有一个比较好的使用方式：使用jupyter进行代码的书写与展示

其次，这个内容主要是合成纹影的算法，并且也不是很准确，有一点差评。





## 12-schlieren_code

主要涉及的是化学中使用激光纹影法，但是安装包瞎子啊不下来，没法测试代码可行不！放弃了！





## 13-NAO-Schlieren

日文什么流程东西，直接放弃了！





## 14-boSchlieren*

有一点我可以学习的，关于公式的代码实现方式，里面使用的是jupyter进行书写的。

全文是关于背景纹影的方法，与我目前的内容并不相符。



## 15-BOS

使用c++开发的代码，我需要放弃了。。。。



## 16-Numerical_Schlieren_Macro_for_Tecplot

与目前的内容不相关，没有下载。



## 17-Schlieren-fast

c++写的程序，与我不相关，没有下载。



## 18-PilotWaveSchlieren

一种合成纹影的方法。没有下载。





## 19-Schlieren-and-Shadowgraphy-Simulation* * * * *

最匹配的仿真计算代码了。

我需要好好看看！应该是好好地看看！干！





## 20-Background-Oriented-Schlieren

写程序不给我写注释，完全猜不出来，放弃了！





## 21-RandomDotSS

这个仓库的代码，炸库了。。。。



## 22-SCH* * * * *

这里的内容算是一个代码的工具集合地，但是没有一个明确的示例，所以想要去用的时候才可以去这里找，看看哪个是合适的，所以需要自己好好地探索一番了！

故，这个工具自己可以好好地用起来！也算是describe Tools for Schlieren flow visualization in Matlab 的功能了。

注意：代码的注释还是有一点的。



## 23-Image-Recognition*

describe is Schlieren Image Recognition of Shock Wave， 但是并没感觉到可以，但是里面关于图像的一点操作，其实可以看看的。

可以借鉴内部的但图像处理。





## 24-schlieren_openCV* * * 

我算是把这个导不进去包的问题解决了，并且实现了piv测试数据的方式。

所以，这个文档还是有用的。里面还有一些关于使用openpiv的例子，不错，可以好好的研究piv使用。





## 25-Background-Oriented-Schlieren

这是使用c++ 写的代码，主要涉及 使用BOS观察tank的密度变化，对我没啥用，放弃了。但是里面的代码还是很多的，应该是比较详细的，可以看一下。







## 26-flowstragram

一个被废弃的库





## 27-Background_Oriented_Schlieren* * * * *

里面有详细的教程，关于BOS的内容，还有实际的视频演示。需要好好地学习与理解。

并且，这里面的内容算是2019年的，属于最新的内容了！干！





## 28-modernFullScaleSchlierenSystem* 

这个里面没有代码，只有一些图，但是这些图很有参考意思，竟然可以使用1px进行网格划分，最终获得照片。可以基于此进行后续的思考。

有用的价值就是像素对照之后的仿真思想。





## 29-openBOS*

这个文件确实有代码，但是代码离我还是很远，或者说这个代码可以在批量使用BOS的时候使用，目前对于我没啥用！

有用的一点就是给我了一个更加清楚的代码结构，我可以试一试！哈哈！







## 30-fcd* * * * *

一种基于快速傅立叶解调的定量合成纹影成像方法

有代码，有文章，关键代码可以运行，很棒啊！！！

这个文章和代码都需要我好好地看看！





## 31-dicflow*

这个代码属于FCD上面那个代码的前身，所以可以先看了上面的，再接着看下面的。

值得看一下！不怕多的思想很重要！





## 32-flowstagram* * * * *

这个文件里面是model，关于mirror, light, and camera mounts for a cheap schlieren imaging system，我或许可以使用使用。

等我使用SolidWorks打开之后在确定吧！

目前，我觉得这个东西可以当成我的三维模型使用。





## 33-recolor.py* * * 

这是一个很棒的图像处理工具，可以直接对于视频的全部色素进行更换，也就是更换color，妙不可言！

如果有必要一定要使用这个工具！















