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

























