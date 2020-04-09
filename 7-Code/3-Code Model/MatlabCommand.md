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









# 常见函数

## IO | show | path

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



### imwrite

**函数功能**：将图像数据写入到图像文件中，存储在磁盘上。



**调用格式**：imwrite(A,filename,fmt)

A是图像数据，filename是目标图像名字，fmt是要生成的图片的格式。



**图片格式**有：：bmp（1-bit、8-bit和24-bit）、gif（8-bit）、hdf、jpg（或jpeg）（8-bit、12-bit和16-bit）、jp2或jpx、pbm、pcx（8-bit）、pgm、png、pnm、ppm、ras、tif（或tiff）、xwd。

各种格式支持的图像位数不一样，比如bmp格式不支持16-bit，而png格式支持， 又如gif只支持8-bit格式。

imwrite(X,map,filename,fmt)

如果要存储一张索引图像， 需要指定颜色表，这样在硬盘上生成图像文件时指定的颜色表和图像数据将一起写入图像文件。

imwrite(...,filename)

imwrite(...,Param1,Val1,Param2,Val2...)



**程序示例**：

本例子展示如何将一张真彩色.jpg格式图片转换为灰度图像、索引图像、二值图像

```matlab
close all;
clear all;
warning off all;

imgrgb=imread('flower.jpg')
imwrite(imgrgb,'flower.bmp','bmp');%.jpg格式转换为bmp格式

imggray=rgb2gray(imgrgb);
imwrite(imggray,'flower_grayscale.bmp','bmp');%存储为灰度图像

[imgind,map]=rgb2ind(imgrgb,256);%转换为256色的索引图像

% 直接将文件写在了当前工作目录的根目录下，无法操作写入其他目录，待验证
imwrite(imageDoubleGray1,'imageDoubleGray1.jpg', 'jpg')
imwrite(imageDoubleGray1,'imageDoubleGray1.bmp','bmp');
```



### save

将工作区变量保存到文件中

**参考**：
https://ww2.mathworks.cn/help/matlab/ref/save.html

**语法**

```matlab
save(filename)
save(filename,variables)
save(filename,variables,fmt)
save(filename,variables,version)
save(filename,variables,version,'-nocompression')
save(filename,variables,'-append')
save(filename,variables,'-append','-nocompression')
save filename
```

**说明**

`save(filename)` 将当前工作区中的所有变量保存在 MATLAB® 格式的二进制文件（MAT 文件）`filename` 中。如果 `filename` 已存在，`save` 会覆盖该文件。

`save(filename,variables)` 仅保存 `variables` 指定的结构体数组的变量或字段。

`save(filename,variables,fmt)` 以 `fmt` 指定的文件格式保存。`variables` 参数为可选参数。如果您不指定 `variables`，`save` 函数将保存工作区中的所有变量。





 

### imshowpair

观测两幅图像的区别。

```matlab
figure;
imshowpair(moving, fixed, 'method');
title('Unregistered');
```

imshowpair函数就是指以成双成对的形式显示图片，其中一个重要的参数就是‘method’，他有4个选择
（1）‘falsecolor’ 字面意思理解就是伪彩色的意思了，其实就是把两幅图像的差异用色彩来表示，这个是默认的参数。
（2）‘blend’ 这是一种混合透明处理类型，技术文档的翻译是alpha blending，大家自己理解吧。
（3）‘diff’ 这是用灰度信息来表示亮度图像之间的差异，这是对应‘falsecolor’的一种方式。
（4）参数‘monotage’可以理解成‘蒙太奇’，这是一种视频剪辑的艺术手法，其实在这里我们理解成拼接的方法就可以了。





### addpath

添加运行时的路径，防止调用未在路径下的文件报错。

```matlab
addpath('./openpiv');
```



### quiver

箭头图或速度图

**参考**：
https://www.cnblogs.com/rgvb178/p/5926168.html
https://ww2.mathworks.cn/help/matlab/ref/quiver.html

**语法**

```
quiver(x,y,u,v)quiver(u,v)quiver(...,scale)quiver(...,LineSpec)quiver(...,LineSpec,'filled')quiver(...,'PropertyName',PropertyValue,...)quiver(ax,...)h = quiver(...)
```

**说明**

箭头图将速度向量显示为箭头，其中分量 `(u,v)` 位于点 `(x,y)` 处。

例如，第一个向量由分量 `u(1)`,`v(1)` 定义并显示在点 `x(1)`,`y(1)` 处。

`quiver(x,y,u,v)` 在 `x` 和 `y` 中每个对应元素对组所指定的坐标处将向量绘制为箭头。矩阵 `x`、`y`、`u` 和 `v` 必须大小相同并包含对应的位置和速度分量。但是，如下节所述，`x` 和 `y` 还可以是向量。默认情况下，箭头缩放到刚好不重叠，但您可以根据需要将箭头缩放的长一些或短一些。

`quiver(u,v)` 在 *x*-*y* 平面的等距点处绘制 `u` 和 `v` 指定的向量。

`quiver(...,scale)` 自动缩放箭头以适合网格大小，然后根据因子 `scale` 拉伸它们。`scale` `=` `2` 使它们的相对长度加倍，`scale` `=` `0.5` 使它们的相对长度减半。使用 `scale = 0` 绘制速度向量，不应用自动缩放。您还可以在绘制箭头后调整其长度，方法就是选择 Plot Edit ![img](MatlabCommand.assets/plotedit_icon_zh_CN.gif) 工具，再选择箭头图对象，然后打开属性编辑器并调整**长度**滑块。

`quiver(...,LineSpec)` 使用任何有效的 `LineSpec` 指定线型、标记符号和颜色。`quiver` 在向量原点处绘制标记。

`quiver(...,LineSpec,'filled')` 填充 `LineSpec` 指定的标记。

`quiver(...,'PropertyName',PropertyValue,...)` 为该函数创建的箭头图对象指定属性名称和属性值对组。

`quiver(ax,...)` 将图形绘制到 `ax` 坐标区中，而不是当前坐标区 ([`gca`](https://ww2.mathworks.cn/help/matlab/ref/gca.html)) 中。

`h = quiver(...)` 返回 `Quiver` 对象。

**展开 x 和 y 坐标**

如果 `x` 和 `y` 不是矩阵，MATLAB® 会将它们展开。该展开与调用 [`meshgrid`](https://ww2.mathworks.cn/help/matlab/ref/meshgrid.html) 以基于向量生成矩阵等效：

```
[x,y] = meshgrid(x,y);
quiver(x,y,u,v)
```

在这种情况下，以下条件必须为 true：

`length(x)``=``n` 和 `length(y)` `=` `m`，其中 `[m,n]` `=` `size(u)` `=` `size(v)`。

向量 `x` 与 `u` 和 `v` 的列相对应，而向量 `y` 与 `u` 和 `v` 的行相对应。

使用 `quiver` 在 `x` 和 `y` 的每个数据点处显示箭头，这样箭头方向和长度分别由 `u` 和 `v` 中的相应值表示。

```matlab
[x,y] = meshgrid(0:0.2:2,0:0.2:2);
u = cos(x).*y;
v = sin(x).*y;

figure
quiver(x,y,u,v)
```





### contour

绘制函数 *z*=*x**e*−*x*2−*y*2 的梯度。

```matlab
[X,Y] = meshgrid(-2:.2:2);
Z = X.*exp(-X.^2 - Y.^2);
[DX,DY] = gradient(Z,.2,.2);

figure
contour(X,Y,Z)
hold on

quiver(X,Y,DX,DY)
hold off
```





### surf



### plot



### pcolor









## Convert Data

### size

size（）：获取矩阵的行数和列数

1、s=size(A),当只有一个输出参数时，返回一个行向量，该行向量的第一个元素是矩阵的行数，第二个元素是矩阵的列数。

2、[r,c]=size(A),当有两个输出参数时，size函数将矩阵的行数返回到第一个输出变量r，将矩阵的列数返回到第二个输出变量c。

3、size(A,n)如果在size函数的输入参数中再添加一项n，并用1或2为n赋值，则 size将返回矩阵的行数或列数。其中r=size(A,1)该语句返回的时矩阵A的行数， c=size(A,2) 该语句返回的时矩阵A的列数。



### mean

**函数功能**

求数组的平均数或者均值

**使用方法**

  ① M = mean(A)
   返回沿数组中不同维的元素的平均值。
   如果A是一个向量，mean(A)返回A中元素的平均值。
   如果A是一个矩阵，mean(A)将其中的各列视为向量，把矩阵中的每列看成一个向量，返回一个包含每一列所有元素的平均值的行向量。
   如果A是一个多元数组，mean(A)将数组中第一个非单一维的值看成一个向量，返回每个向量的平均值。

  ②M = mean(A,dim)
   返回A中沿着标量dim指定的维数上的元素的平均值。对于矩阵，mean(A,2)就是包含每一行的平均值的列向量。

**3、应用举例** 

```matlab
A = [1 2 3; 3 3 6; 4 6 8; 4 7 7];

mean(A)
ans =
    3.0000 4.5000 6.0000

mean(A,2)
ans =
    2.0000
    4.0000
    6.0000
    6.0000

mean(A,3)
ans=
   1   2   3
   3   3   6
   4   6   8
   4   7   7

mean(A)
当A为向量时，那么返回值为该向量所有元素的均值
当A为矩阵时，那么返回值为该矩阵各列向量的均值

mean(A,2)
返回值为该矩阵的各行向量的均值

mean(A,3)
返回矩阵本身（第三维，例如RGB图像三个通道）
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



### rgb2gray

**简介**
    rgb2gray是matlab内部一种处理图像的函数，通过消除图像色调和饱和度信息同时保留亮度实现将将RGB图像或彩色图转换为灰度图像，即灰度化处理的功能，调用这个功能的格式是I = rgb2gray(RGB)，意思是将真彩色图像RGB转换为灰度强度图像I 。

 **调用格式**
	I = rgb2gray(RGB)
	newmap= rgb2gray(map)

**函数算法**
灰度化处理有多种处理方式：分量法 最大法 平均法 加权平均法
Matlab 中采用的是对R、G、B分量进行加权平均的算法：
	0.2989R+ 0.5870G + 0.1140B
（注意，rgb2ntsc函数也使用相同的权重来计算Y分量）

**具体函数**

```matlab
function imgray=rgbimage2gray(imrgb)
[m,n,t]=size(imrgb);
for i=1:m
    for j=1:n
        for k=1:t
            
            imgray(i,j,k)=0.299*imrgb(i,j,1)+0.587*imrgb(i,j,2)+0.11400*imrgb(i,j,3);%加权实现从真彩到灰度的降维转换
           
        end
           
    end
end
```





### openpiv

输入两个图片，输出位移场。

```matlab
[x,y,u,v] = openpiv( im1, im2, ...
    nx, ny, ...
    overlap_px, overlap_py);
```



































