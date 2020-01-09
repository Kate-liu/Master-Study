

# Study Background_Oriented_Schlieren

## 介绍

这个文件是我在查看**josh**研究**背景纹影技术的代码、文章、视频**的总结与思路梳理。

josh博客文章网址：http://www.joshtheengineer.com/2019/10/20/how-to-take-pictures-like-nasa-using-background-oriented-schlieren-bos/

josh代码网址：https://github.com/jte0419/Background_Oriented_Schlieren

josh视频网址：https://www.youtube.com/watch?v=VCUN59x0LF4



## 正文

### youtube-dl

下载网址：https://ytdl-org.github.io/youtube-dl/index.html

这个是**下载YouTube网站视频的工具**，当然你也可以直接使用网址：https://en.savefrom.net/ （可以直接帮你下载文件）

下载安装：

- 1）下载版本：[Windows exe](https://yt-dl.org/downloads/2020.01.01/youtube-dl.exe)
- 2）随便创建一个文件夹，将下载的文件`youtube-dl.exe`放置在其中，并配置系统环境变量
- 3）在命令行输入 `youtube-dl`，可以看到下面的内容

```sh
C:\Users\rmliu>youtube-dl
Usage: youtube-dl [OPTIONS] URL [URL...]

youtube-dl: error: You must provide at least one URL.
Type youtube-dl --help to see a list of all options.
```

- 4）在命令行输入`youtube -dl -F Video_URL`查看youtube视频格式信息。

```sh
C:\Users\rmliu>youtube-dl -F https://www.youtube.com/watch?v=VCUN59x0LF4 # 注意：如果没有外网，会显示连接尝试失败
[youtube] VCUN59x0LF4: Downloading webpage
[youtube] VCUN59x0LF4: Downloading video info webpage
[youtube] VCUN59x0LF4: Downloading MPD manifest
[info] Available formats for VCUN59x0LF4:
format code  extension  resolution note
139          m4a        audio only DASH audio   52k , m4a_dash container, mp4a.40.5@ 48k (22050Hz)
251          webm       audio only DASH audio  130k , webm_dash container, opus @160k (48000Hz)
140          m4a        audio only DASH audio  132k , m4a_dash container, mp4a.40.2@128k (44100Hz)
278          webm       256x144    DASH video   95k , webm_dash container, vp9, 30fps, video only
160          mp4        256x144    DASH video  108k , mp4_dash container, avc1.4d400b, 30fps, video only
242          webm       426x240    DASH video  220k , webm_dash container, vp9, 30fps, video only
133          mp4        426x240    DASH video  242k , mp4_dash container, avc1.4d400c, 30fps, video only
243          webm       640x360    DASH video  405k , webm_dash container, vp9, 30fps, video only
134          mp4        640x360    DASH video  725k , mp4_dash container, avc1.4d401e, 30fps, video only
244          webm       854x480    DASH video  752k , webm_dash container, vp9, 30fps, video only
135          mp4        854x480    DASH video 1155k , mp4_dash container, avc1.4d4014, 30fps, video only
247          webm       1280x720   DASH video 1505k , webm_dash container, vp9, 30fps, video only
136          mp4        1280x720   DASH video 2310k , mp4_dash container, avc1.4d4016, 30fps, video only
248          webm       1920x1080  DASH video 2646k , webm_dash container, vp9, 30fps, video only
137          mp4        1920x1080  DASH video 4842k , mp4_dash container, avc1.640028, 30fps, video only
43           webm       640x360    360p , vp8.0, vorbis@128k, 102.18MiB
18           mp4        640x360    360p  275k , avc1.42001E, mp4a.40.2@ 96k (44100Hz), 90.82MiB
22           mp4        1280x720   720p  802k , avc1.64001F, mp4a.40.2@192k (44100Hz) (best)
```

- 5）选择`137+140`组合，下载视频。（137+140这里可以自由搭配，音频选140，是因为选m4a的音频与mp4的视频合成输出就是mp4，否则选择其他音频输出会因为兼容问题，默认是mkv格式输出）

```sh
C:\Users\rmliu>youtube-dl -f 137+140  https://www.youtube.com/watch?v=VCUN59x0LF4
[youtube] VCUN59x0LF4: Downloading webpage
[youtube] VCUN59x0LF4: Downloading video info webpage
[youtube] VCUN59x0LF4: Downloading MPD manifest
[dashsegments] Total fragments: 519
[download] Destination: How To Take Pictures Like NASA - DIY Background Oriented Schlieren-VCUN59x0LF4.f137.mp4
[download]  47.5% of ~285.98MiB at 59.78KiB/s ETA 02:14:
```

- 6）也可以直接使用`youtube -dl Video_URL` 下载视频。







### ffmpeg

下载网址：https://www.ffmpeg.org/

转换视频格式为avi格式。

下载与安装：

- 1）直接解压下载之后的压缩包
- 2）将该文件放到一个位置，配置bin那一目录的环境变量，`D:\ffmpegStatic\bin`
- 3）打开命令行，输入`ffmpeg`，显示下面的内容

```sh
C:\Users\rmliu>ffmpeg
ffmpeg version git-2020-01-06-1e3f4b5 Copyright (c) 2000-2020 the FFmpeg developers
  built with gcc 9.2.1 (GCC) 20191125
  configuration: --enable-gpl --enable-version3 --enable-sdl2 --enable-fontconfig --enable-gnutls --enable-iconv --enable-libass --enable-libdav1d --enable-libbluray --enable-libfreetype --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenjpeg --enable-libopus --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libtheora --enable-libtwolame --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxml2 --enable-libzimg --enable-lzma --enable-zlib --enable-gmp --enable-libvidstab --enable-libvorbis --enable-libvo-amrwbenc --enable-libmysofa --enable-libspeex --enable-libxvid --enable-libaom --enable-libmfx --enable-ffnvcodec --enable-cuvid --enable-d3d11va --enable-nvenc --enable-nvdec --enable-dxva2 --enable-avisynth --enable-libopenmpt --enable-amf
  libavutil      56. 38.100 / 56. 38.100
  libavcodec     58. 65.102 / 58. 65.102
  libavformat    58. 35.101 / 58. 35.101
  libavdevice    58.  9.103 / 58.  9.103
  libavfilter     7. 70.101 /  7. 70.101
  libswscale      5.  6.100 /  5.  6.100
  libswresample   3.  6.100 /  3.  6.100
  libpostproc    55.  6.100 / 55.  6.100
Hyper fast Audio and Video encoder
usage: ffmpeg [options] [[infile options] -i infile]... {[outfile options] outfile}...

Use -h to get full help or, even better, run 'man ffmpeg'
```

- 4）将(NASA Captures First Air-to-Air Images of Supersonic Shockwave Interaction in Flight.mp4)mp4格式视频转为(NASA_BOS.avi)avi格式。（需要了解一下mp4格式与avi格式文件的存储有什么不同？）

```sh
# ffmpeg -i input.mp4 output.avi
# 将mp4格式转为avi格式，从33秒开始，向后10秒，也就是43秒结束
# 注意：执行这个操作的时候，需要自己将命令行切到当前存储mp4文件的目录下
# The option -ss 00:00:33 says that we want to start the conversion at 33 seconds in the video. 
# The option -t 00:00:10says that we want to continue the conversion for 10 seconds (ending at 43 seconds). 
# If we wantthe entire video converted, simply leave out the -ss and -t options. 

# The options -pix fmt nv12 ensure we have the correct format that ImageJ can load. 
# The options -f avi states that we are outputting the video to AVI format. 
# The options -q:v 0 state that we want the highest video quality possible in the conversion process. we want all the pixel information retained from the original video.
# The next options, -vcodec rawvideo , state that we are using the same codec as from the raw video.
# The final option is the file name of the output video.

# Sometimes the above command won’t work, and the error message will tell you to check the “-ss” or “-t” commands. In that case, I’ve had success just moving the “-ss” command in front of the “-i” command, as shown below.
# ffmpeg -ss 00:00:33 -i NASA_BOS.mp4 -t 00:00:10 -pix_fmt nv12 -f avi -q:v 0 -vcodec rawvideo NASA_BOS.avi


ffmpeg -i NASA\ Captures\ First\ Air-to-Air\ Images\ of\ Supersonic\ Shockwave\ Interaction\ in\ Flight.mp4 -ss 00:00:33 -t 00:00:10 -pix_fmt nv12 -f avi -q:v 0 -vcodec rawvideo NASA_BOS.avi


############################# 输出信息 #############################
ffmpeg version git-2020-01-06-1e3f4b5 Copyright (c) 2000-2020 the FFmpeg developers
  built with gcc 9.2.1 (GCC) 20191125
  configuration: --enable-gpl --enable-version3 --enable-sdl2 --enable-fontconfig --enable-gnutls --enable-iconv --enable-libass --enable-libdav1d --enable-libbluray --enable-libfreetype --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenjpeg --enable-libopus --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libtheora --enable-libtwolame --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxml2 --enable-libzimg --enable-lzma --enable-zlib --enable-gmp --enable-libvidstab --enable-libvorbis --enable-libvo-amrwbenc --enable-libmysofa --enable-libspeex --enable-libxvid --enable-libaom --enable-libmfx --enable-ffnvcodec --enable-cuvid --enable-d3d11va --enable-nvenc --enable-nvdec --enable-dxva2 --enable-avisynth --enable-libopenmpt --enable-amf
  libavutil      56. 38.100 / 56. 38.100
  libavcodec     58. 65.102 / 58. 65.102
  libavformat    58. 35.101 / 58. 35.101
  libavdevice    58.  9.103 / 58.  9.103
  libavfilter     7. 70.101 /  7. 70.101
  libswscale      5.  6.100 /  5.  6.100
  libswresample   3.  6.100 /  3.  6.100
  libpostproc    55.  6.100 / 55.  6.100
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'NASA Captures First Air-to-Air Images of Supersonic Shockwave Interaction in Flight.mp4':
  Metadata:
    major_brand     : mp42
    minor_version   : 0
    compatible_brands: isommp42
    creation_time   : 2019-03-11T18:49:09.000000Z
  Duration: 00:01:00.07, start: 0.000000, bitrate: 1073 kb/s
    Stream #0:0(und): Video: h264 (Main) (avc1 / 0x31637661), yuv420p(tv, bt709), 1280x720 [SAR 1:1 DAR 16:9], 941 kb/s, 29.97 fps, 29.97 tbr, 30k tbn, 59.94 tbc (default)
    Metadata:
      creation_time   : 2019-03-11T18:49:09.000000Z
      handler_name    : ISO Media file produced by Google Inc. Created on: 03/11/2019.
    Stream #0:1(eng): Audio: aac (LC) (mp4a / 0x6134706D), 44100 Hz, stereo, fltp, 127 kb/s (default)
    Metadata:
      creation_time   : 2019-03-11T18:49:09.000000Z
      handler_name    : ISO Media file produced by Google Inc. Created on: 03/11/2019.
Stream mapping:
  Stream #0:0 -> #0:0 (h264 (native) -> rawvideo (native))
  Stream #0:1 -> #0:1 (aac (native) -> mp3 (libmp3lame))
Press [q] to stop, [?] for help
Output #0, avi, to 'NASA_BOS.avi':
  Metadata:
    major_brand     : mp42
    minor_version   : 0
    compatible_brands: isommp42
    ISFT            : Lavf58.35.101
    Stream #0:0(und): Video: rawvideo (NV12 / 0x3231564E), nv12, 1280x720 [SAR 1:1 DAR 16:9], q=2-31, 331444 kb/s, 29.97 fps, 29.97 tbn, 29.97 tbc (default)
    Metadata:
      creation_time   : 2019-03-11T18:49:09.000000Z
      handler_name    : ISO Media file produced by Google Inc. Created on: 03/11/2019.
      encoder         : Lavc58.65.102 rawvideo
    Stream #0:1(eng): Audio: mp3 (libmp3lame) (U[0][0][0] / 0x0055), 44100 Hz, stereo, fltp (default)
    Metadata:
      creation_time   : 2019-03-11T18:49:09.000000Z
      handler_name    : ISO Media file produced by Google Inc. Created on: 03/11/2019.
      encoder         : Lavc58.65.102 libmp3lame
frame=    0 fps=0.0 q=0.0 size=      10kB time=00:00:00.00 bitrate=N/A speed=   frame=   92 fps= 92 q=-0.0 size=  121354kB time=00:00:03.10 bitrate=320366.7kbitframe=  299 fps=211 q=-0.0 Lsize=  403833kB time=00:00:10.01 bitrate=330489.2kbits/s speed=7.07x
video:403650kB audio:157kB subtitle:0kB other streams:0kB global headers:0kB muxing overhead: 0.006399%

```

- 扩展知识：

```sh
# MP4
MP4 是一套用于音频、视频信息的压缩编码标准，由国际标准化组织（ISO）和国际电工委员会（IEC）下属的“动态图像专家组”（Moving Picture Experts Group，即MPEG）制定，第一版在1998年10月通过，第二版在1999年12月通过。MPEG-4格式的主要用途在于网上流、光盘、语音发送（视频电话），以及电视广播。
MPEG-4：制定于1998年，MPEG-4是为了播放流式媒体的高质量视频而专门设计的，它可利用很窄的带度，通过帧重建技术，压缩和传输数据，以求使用最少的数据获得最佳的图像质量。MPEG-4最有吸引力的地方在于它能够保存接近于DVD画质的小体积视频文件。

# avi
avi：这种视频格式的优点是图像质量好，可以跨多个平台使用，但是其缺点是体积过于庞大，而且更加糟糕的是压缩标准不统一，因此经常会遇到高版本Windows媒体播放器播放不了采用早期编码编辑的AVI格式视频，而低版本Windows媒体播放器又播放不了采用最新编码编辑的AVI格式视频。
```





### ImageJ/Fiji

打开`avi`格式的视频或者图片。

image stacks  >>> 将avi格式视频截取

save images   >>>保存当前图片

crop images   >>>

perform image registration   >>>

macros   >>>





### Python代码

使用Python的代码，需要保证安装了Python，有两种方式。

注意：打开的文件夹必须同时包含两个文件：`GUI_BOS_v6.py ` 和 `normxcorr2.py`。

1.使用**anaconda全家桶**，这个时候只需要启动就可以实现。

- 1）启动 Anaconda Navigator软件，Launch **Spyder**。
- 2）可以拖拽`GUI_BOS_v6.py `文件，或者Open文件。
- 3）点击`Run File` 就可以，出现`BOS Processing`的GUI面板。



2.使用**PyCharm**，自行安装Python解释器。

- 1）打开命令行，执行下面的`pip` Command.

```python
python -m pip install --upgrade pip  # 更新pip版本

pip3 install scipy  # 安装包
pip3 install matplotlib
pip3 install pillow
pip3 install numpy

'''如果安装过慢，手动更新pip安装，下载的源'''
# 1.打开文件目录：C:\Users\自己的登录名字\AppData\Roaming
# 2.新建文件，文件名字叫：pip
# 3.进入pip文件夹，此时的文件目录：C:\Users\自己的登录名字\AppData\Roaming\pip
# 4.新建文件：pip.ini
# 5.在pip.ini 文件内部书写下面，双引号内部的内容
"""
[global]
timeout = 6000
index-url = http://pypi.douban.com/simple
trusted-host = pypi.douban.com
"""
```

- 2）打开PyCharm，Open `GUI_BOS_v6.py `。
- 3）右键点击 `Run`既可实现运行程序。



### MATLAB代码

1）安装matlab软件

2）拷贝文件：`GUI_BOS_v2.fig` and `GUI_BOS_v2.m` 到MATLAB工作目录：D:\MATLAB\R2016a\bin

3）打开`GUI_BOS_v2.m`  文件，点击`编辑器` >>>  运行`GUI_BOS_v2` 


















































































































































































































