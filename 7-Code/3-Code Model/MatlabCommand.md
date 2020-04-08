# MATLAB Command

## 参考

参考1：https://blog.csdn.net/qq_38274944/article/details/88727565

参考2：https://blog.csdn.net/gyt15663668337/article/details/83962357



## linspace

linspace是Matlab中的均分计算指令，用于产生x1,x2之间的N点行线性的矢量。

```matlab
>> x = 10;
>> y = 11;
>> z = linspace(x, y, 100);
>> x

x =

    10

>> y

y =

    11

>> z

z =

  Columns 1 through 10

   10.0000   10.0101   10.0202   10.0303   10.0404   10.0505   10.0606   10.0707   10.0808   10.0909
   ......
   ......

  Columns 91 through 100

   10.9091   10.9192   10.9293   10.9394   10.9495   10.9596   10.9697   10.9798   10.9899   11.0000

>> 
```





## meshgrid

例如， 要在“3<=x<=5，6<=y<=9，z不限制[区间](https://baike.baidu.com/item/区间)” 这个区域内绘制一个3D图形，如果只需要整数坐标为采样点的话。我们可能需要下面这样一个坐标构成的[矩阵](https://baike.baidu.com/item/矩阵)：

(3,9),(4,9),(5,9);

(3,8),(4,8),(5,8);

(3,7),(4,7),(5,7);

(3,6),(4,6),(5,6);

在matlab中我们可以这样描述这个坐标矩阵：

把各个点的x坐标独立出来，得：

3,4,5;

3,4,5;

3,4,5;

3,4,5;

再把各个点的y坐标也独立出来：

9,9,9;

8,8,8;

7,7,7;

6,6,6;

这样对应的x、y结合，便表示了上面的坐标[矩阵](https://baike.baidu.com/item/矩阵)。[mesh](https://baike.baidu.com/item/mesh)grid就是产生这样两个矩阵，来简化我们的操作。然后根据(x, y)计算获得z，并绘制出三维图形。

```matlab
[X,Y] = meshgrid(x,y)
解释：输出X的每一行的数值都是复制的x的值；输出Y的每一列的数值都是复制的y的值。


[X,Y]=meshgrid(x)与[X,Y]=meshgrid(x,x)是等同的
```







## 绘制曲线图plot,plot3

```matlab
plot3(X,Y,Z)
plot3(X1,Y1,Z1,X2,Y2,Z2)
plot3(X,Y,Z,‘PropertyName’,PropertyValue）
plot3(X1,Y1,Z1,‘PropertyName’,PropertyValue,X2,Y2,Z2,‘ProperName’,PropertyValue)

figure
theta = 0:.01*pi:2*pi;
x = sin(theta);
y = cos(theta);
z = cos(4*theta);
plot3(x,y,z,'LineWidth',3);hold on;

theta = 0:.02*pi:2*pi;
x = sin(theta);
y = cos(theta);
z = cos(4*theta);
plot3(x,y,z,'rd','MarkerSize',3,'LineWidth',3);hold on;

```





## 绘制网格图mesh,meshc,meshz

1）确定x,y的起始点，步长，终点。
2）绘制3D网格图，计算机需要在Oxy平面进行采样，运用[X,Y] = meshgrid(x,y)来生成X、Y两个采样点矩阵，假设x中有m个元素，y中有n个元素，那么X为一个n x m的矩阵，Y也是一个n x m的矩阵。



绘制函数z=f(x,y)的三维网格图的过程：

确定自变量x和y的取值范围和取值间隔
利用meshgrid函数生成“格点”矩阵
计算自变量采样“格点”上的函数值：Z = f(x,y)
matlab中提供了mesh函数用于实现绘制网格图：

mesh(X,Y,Z)：绘制三维网格图，颜色与曲面的高度相匹配
mesh(Z)：系统默认颜色与网格区域的情况下绘制数据Z的网格图
mesh(...,C,'PropertyName',PropertyValue)：对指定的颜色C，指定的属性值，画出三维图形
meshc(...)：用于画网格图与基本的等值线图
meshz(...)：用于绘制包含零平面的网格图
h = mesh(...)：返回图形对象句柄属性值向量h

```matlab
mesh(X,Y,Z)：以X为x轴自变量，Y为y轴自变量，X、Y均为向量，如果X长度为m，Y长度为n，那么Z为一个m x n的矩阵。

x = -10:0.1:10;
y = -10:0.1:10;
[X,Y] = meshgrid(x,y);
Z = -X.^2-Y.^2+200;
mesh(X,Y,Z)


[X,Y] = meshgrid(-3:.5:3);
Z = 2 * X.^2-3 * Y.^2;
subplot(2,2,1)
plot3(X,Y,Z)
title('plot3')
subplot(2,2,2)
mesh(X,Y,Z)
title('mesh')
subplot(2,2,3)
meshc(X,Y,Z)
title('meshc')
subplot(2,2,4)
meshz(X,Y,Z)
title('meshz')
set(gcf,'Color','w');
```





## 绘制曲面图surf,surfl,surfc

表示三维空间内数据的变化规律。函数有surf、surfc和surfl

- surf(X,Y,Z)：绘制三维的彩色曲面图。
- surf(X,Y,Z,C)：图形的颜色采用参数C,同样可以添加属性值

```matlab
[x,y,z] = peaks;
surf(x,y,z)

[x,y] = meshgrid(-3:1/8:3);
z = peaks(x,y);
subplot(2,2,1);surf(z);
title('surf(z)绘制形式');
subplot(2,2,2);surf(x,y,z);
title('surf(x,y,z)绘图形式');
subplot(2,2,3);surfl(x,y,z);
title('surfl(x,y,z)绘图形式');
subplot(2,2,4);surfc(x,y,z);
title('surfc(x,y,z)绘图形式');
```





## 主，左，俯视图view

```matlab
ttl={'主视图','左视图','俯视图','三维图'};
angle={[0,0],[-90,0],[0 90],[-37.5,30]};
for i=1:4
subplot(2,2,i);
ezmesh('1/((1-X)^2+Y^2)^0.5+1/((1+X)^2+Y^2)^0.5',[-2 2]);
view(angle{i});
title(ttl{i});
end
```









## 常见函数

### imread

**函数语法**：

```matlab
 A = imread(filename, fmt)
[X, map] = imread(...)
[...] = imread(filename)
[...] = imread(URL,...)
[...] = imread(...,Param1,Val1,Param2,Val2...)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[X, map] = imread(...) 
从filename文件中，读取索引图像X以及与之对应的颜色表到map中。颜色表中的值将归一化到[0,1]之间。

[...] = imread(filename) 
尝试推断文件内容的格式

[...] = imread(URL,...) 
从互联网地址中读取图像。其中URL必须包含协议，如http://

[...] = imread(...,Param1,Val1,Param2,Val2...) 
指定参数属性对来指定格式，可查看下面的指定格式信息部分（按字母顺序进行排序）
        
        BMP  位图
        CUR 静态光标文件
        GIF 图像互换格式
        HDF4 分层数据格式
        ICO 图标文件
        JPEG 联合图像专家组
        JPEG2000 联合图像专家组2000
        PBM 流式位图(单色)
        PCX  Windows的画笔
        PGM 流式灰度图
        PNG 流式网络图形
        PPM 流式像素图
        RAS SUM光栅图片格式
        TIFF 标签图像文件格式
        XWD  X windows转储格式
```



**参数解析**:

A = imread(filename, fmt) 
根据文件名filename读取灰度或彩色图像。若filename文件不在当前目录下，也不在Matlab搜索路径下，则必须指定全路径。根据标准文件扩展名指定文件的格式fmt。如为图形交换格式文件指定'gif'格式。用imformats函数查看支持的格式的扩展名清单，若imread函数找不到filename文件，将查打filename.fmt文件。

返回的数组A包含图像数据。若文件包含灰色图像，A是M\*N的数组；若文件包含真彩色图像，A是M\*N\*3的数组。对于彩色的tiff文件将用CMYK颜色空间，A是M\*N\*4的数组。
返回的A的类型与图像采样的位有关。如24位颜色imread函数返回uint8数据因为每个颜色分量都是8位的。



**数据格式**:
1、BMP  位图
支持的位深	不压缩	RLE压缩	输出的类型	说明
1位	y	-	逻辑型	
4位	y	y	uint8	
8位	y	y	uint8	
16位	y	-	uint8	每像素1采样
24位	y	-	uint8	每像素3采样
32位	y	-	uint8	每像素3采样(填充1字节)

2、CUR 静态光标文件
支持的位深	不压缩	压缩	输出类型
1位	y	-	逻辑型
4位	y	-	uint8
8位	y	-	uint8
指定格式的语法：
  [...] = imread(..., idx) 
从多图标或光标文件中读取一个图像。idx是一个整数用于指定图像在文件中出现的序号。如idx=3即读取文件中第3个图像。若忽略idx，则读取文件中第一个图像。
  [A, map, alpha] = imread(...) 
返回资源的与操作的掩码，它可以用来确定透明度信息。对于静态光标文件，这个掩码是最有用的东西。
注意：Windows的光标是32*32像素的，而Matlab为16*16像素的。若装有图像处理工具箱，可以用imresize函数进行放缩。

3、GIF 图像互换格式
支持的位深	不压缩	压缩	输出类型
1位	y	-	逻辑型
2位到8位	y	-	uint8
指定格式的语法：
  [...] = imread(..., idx) 
从多帧的gif文件(动画)中读取一帧或多帧信息。idx必须是整数或整数组成的向量。如idex=3代表读取第3帧的图像；idx=1:5则只读取头5帧的图像。
  [...] = imread(..., 'frames', idx) 
与上述语法相同，但这里的idx可以为'all'，代表读取读取整个文件所有的帧。
 注意：由于gif文件的结构方式，当读取部分帧时实际上要读取所有的帧。因此，指定要读取的帧的向量或所有帧要比用循环来读取gif文件要来得快。

4、HDF4 分层数据格式
支持的位深	带颜色图的光栅图像	不带颜色图的光栅图像	输出类型	说明
8位	y	y	uint8	
24位	-	y	uint8	每像素3采样
指定格式的语法：
  [...] = imread(..., ref) 
从一个多图像的HDF4文件中读取一个图像。ref是一个整数，用于指定图像的识别参考号码。如ref=12，即读取参考数为12的图像。注意：在HDF4文件中，参考数与文件中图像的序号并不是一致的，可借助imfinfo函数得到二者之前的关系。另外若忽略ref，则读取文件中第一个图像。

5、ICO 图标文件
        参看2、CUR 静态光标文件

6、JPEG 联合图像专家组
支持的位深	有损压缩	无损压缩	输出类型	说明
8位	y	y	uint8	灰度或RGB
12位	y	y	uint16	灰度或RGB
16位	-	y	uint16	灰度

7、JPEG2000 联合图像专家组2000
支持的位深	有损压缩	无损压缩	输出类型	说明
1位	y	y	逻辑型	仅灰度
2到8位	y	y	uint8	灰度或RGB
9到16位	y	y	uint16	灰度或RGB
指定格式的语法：
  [...] = imread(..., 'Param1', value1, 'Param2', value2, ...) 
用下表中的参数属性对来控制读操作
        'ReductionLevel'：一个非负整数，用于指定图像减少的分辨率。若ReductionLevel=L，则图像分辨率以2^L尺度减小。缺省的ReductionLevel为0，即不减少分辨率。该值以总压缩水平为限，由imfinfo函数返回的WaveletDecompositionLevels字段给出。
        'PixelRegion'：以(rows,cols)表示，返回以rows,cols为界的子图像。其中rows和col都是含有两个元素的向量。若ReductionLevel大于0，则rows和cols为减小图像的坐标。

8、PBM 流式位图(单色)
支持的位深	二进制Raw	ASCII编码	输出类型
1位	y	y	逻辑型

9、PCX  Windows的画笔
支持的位深	输出类型	说明
1位	逻辑型	仅灰度图像
8位	uint8	灰度或索引图像
24位	uint8	RGB，每像素3个8位采样

10、PGM 流式灰度图
支持的位深	二进制Raw	ASCII编码	输出类型	说明
8位	y	-	uint8	
16位	y	-	uint16	
随意	-	y	1到8位返回uint8，9到16位返回uint16	归一化的值

11、PNG 流式网络图形
支持的位深	输出类型	说明
1位	逻辑型	灰度图像
2位	uint8	灰度图像
4位	uint8	灰度图像
8位	uint8	灰度或索引图像
16位	uint16	灰度或索引图像
24位	uint8	RGB，每个像素三个8位采样
48位	uint16	RGB，每个像素三个16位采样
指定格式的语法：
  [...] = imread(...,'BackgroundColor',BG) 
以背景色BG对输入的图像合成，若BG为'none'，则不进行合成。若输入的是索引图像，BG必须是[1,P]之间的整数，这里的P是颜色表的长度。若输入的是灰度图，BG必须是[0,1]之间的整数。若输入的是RGB图像，RGB三分量都必须在[0,1]之间。字符串'BackgroundColor'可以被忽略。
  [A, map, alpha] = imread(...) 
如果存在返回alpha通道，否则返回空。注意当输入文件含有灰度或真彩图像，map可能为空。
若指定alpha这个输出参数，BG若不指定，则缺省为'none'。否则，若PNG文件含有背景颜色块，这个值将作为BG的缺省值；若alpha没有指定且文件中也没有背景颜色块，对于索引图像文件BG缺省值为1、灰度图BG缺省值为0、真彩色(RGB)图像BG缺省值为[0,0,0]。

12、PPM 流式像素图
支持的位深	二进制Raw	ASCII编码	输出类型
不多于16位	y	-	uint8
任意位	-	y		

13、RAS SUM光栅图片格式
支持的位深	输出类型	说明
1位	逻辑型	位图
8位	uint8	索引图像
24位	uint8	RGB，每像素三个8位采样
32位	uint8	含有alpha的RGB，每像素四个8位采样

14、TIFF 标签图像文件格式
imread函数支持下列tiff：
        1、每个像素任意个采样
        2、CCITT 3及4传真、PackBits、JPEG、LZW、ThunderScan压缩，以及不压缩的图像
        3、逻辑型、灰度、索引、真彩以及高光谱图像
        4、RGB、BMYK、CIELAB、ICCLAB颜色空间。若彩色图像使用CMYK颜色空间，则A是M*N*4数组。可以用imfinfo函数查看图像文件使用的颜色空间（查看PhotometricInterpretation字段）。若文件包含CIELAB颜色数据，imread先转成ICCLAB然后再导入MATLAB空间，这是因为8或16位的CIELAB编码的值使用的是有符号或无符号的数据类型，而这些类型不能在单一MATLAB数组中保存。
        5、数据重组成块或扫描线
下表给出imread支持的位深等信息：
支持的位深	压缩	输出类型	说明
不压缩	Packbits	CCITT	RGB	ICCLAB	CLELAB	CMYK		
1位	y	y	y	-	-	-	-	逻辑型	
8位	y	y	-	-	-	-	-	uint8	
12位	-	-	-	-	-	-	-	uint16	灰色或索引图像
16位	-	-	-	-	-	-	-	uint16	灰色或索引图像
24位	y	y	-	y	y	y	-	uint8	每像素3采样
32位	-	-	-	-	-	-	y	uint8	每像素4采样
36位	-	-	-	y	-	-	-	uint16	每像素3采样
48位	-	-	-	y	y	y	-	uint16	每像素3采样
64位	-	-	-	-	-	-	y	double	每像素4采样
注意：imread函数支持8位整型以及32位浮点型的任意压缩以及上述颜色空间的图像。
指定格式的语法：
  A = imread(...) 
返回使用RGB、CIELAB、ICCLAB或CMYK颜色空间的数据。若使用CMYK颜色空间，则A是M*N*4的数组。
  [...] = imread(..., 'Param1', value1, 'Param2', value2, ...) 
指定参数属性对来指定格式：参数有：
'Index'：正整数，用于指定要读的图像。如指定'Index'为3，则imread读文件中的第三个图像。若省略，imread则读取文件中第一个图像。
'Info'：imfinfo函数返回的结构体。
'PixelRegion'：细胞元数组{rows,cols}，指定区域的边界。rows和cols必须是两个元素或三个元素的向量。若指定两个元素的向量，各元素的值是从1开始计算的序数[start stop]；若指定三个元素的向量，各元素的值是从1开始计算的序数[start increment stop]即[起始 步长 终止]。
版权的信息，可查看libtiffcopyright.txt文件。

15、XWD  X windows转储格式
支持的位深	ZPixmaps	XYBitmaps	XYPixmaps	输出类型
1位	y	-	y	逻辑型
8位	y	-	-	uint8
支持的类:对于大多数的格式，每个颜色imread用8位或者更少的位来保存一个像素。下表给出各种文件数据类型返回的数组类型。
文件中的数据类型	imread返回的数组类
每像素1位	逻辑型
每像素2到8位	uin8
每像素9到16位	uint16（bmp、JPEG、PNG和TIFF）。对于5-6-5的16位bmp格式，Matlab返回uint8






位深是保存每个像素所需要的位数。位深等于每像素的采样数*每次采样需要的位数。因此对于每个分量需要8位的格式而言，每个像素三次采样的位深为24位。有时采样大小与位深并不是对应的，如48位的位深，它可以是6次8位采样，也可以是4次12位采样，也可以是3次16位采样。



**典型实例**:

```matlab
例1：
imdata = imread('xxxxx.jpg');        %读取文件

例2：
[cdata,map] = imread( filename )         %读索引图像文件
if ~isempty( map )     
   cdata = ind2rgb( cdata, map );         %将索引图像数据转为RGB图像数据
end 

例3：读取tiff文件中第6个图像：
[X,map] = imread('xxxxx.tif',6);

例4：读取HDF4中的第四个图像，HDF4要用参考号来读取图像：
info = imfinfo('xxxxx.hdf');
[X,map] = imread('xxxx.hdf',info(4).Reference);

例5：读一个24位的PNG图像，其完全透明的像素设置为红色。：
bg = [1 0 0];            %背景色
A = imread('xx.png','BackgroundColor',bg);

例6：返回png图像的alpha通道：
[A,map,alpha] = imread('your_image.png');

例7：读ico图像，用透明的掩码并显示：
[a,b,c] = imread('xxx.ico'); 
b2 = [b; 1 1 1];                         %构建新的颜色表
d = ones(size(a)) * (length(b2) - 1);    %非透明区域，取[1,1,1]
d(c == 0) = a(c == 0);                     %保留透明的区域的颜色
image(uint8(d)), colormap(b2)            %显示
```








### im2double

im2double函数用于将图像转换为双精度。

语法形式有4种，分别是：

```matlab
I2 = im2double(I); 

RGB2 = im2double(RGB); 

I = im2double(BW); 

X2 = im2double(X, 'indexed'); 


```



**描述**：

I2 = im2double(I)将灰度图像I转换为双精度，必要时可以缩放其数据。如果输入图像是双精度类型，则输出图像类型与其相同。

RGB2 = im2double(RGB)将真彩色图像RGB转换为双精度，必要时可以缩放其数据。

I = im2double(BW)将二值图像BW转换成一幅双精度图像。

X2 = im2double(X, 'indexed')将索引图像X转换为双精度，必要时可以对其数据进行偏置。



**类型支持**：

灰度图像和真彩色图像的类型可以是uint8, uint16, double, logical, single, int16。

索引图像的类型可以是uint8, uint16, double, logical。二值图像的类型必须是logical。

输出图像的类型是double。




### addpath

添加运行时的路径，防止调用未在路径下的文件报错。

```matlab
addpath('./openpiv');
```



### openpiv

输入两个图片，输出位移场。

```matlab
[x,y,u,v] = openpiv( im1, im2, ...
    nx, ny, ...
    overlap_px, overlap_py);
```



### imwrite









