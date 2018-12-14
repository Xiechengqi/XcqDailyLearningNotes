# [FFmpeg](https://github.com/FFmpeg/FFmpeg)


* FFmpeg 是处理多媒体内容（ 如音频，视频，字幕和相关元数据 ）的库和工具的集合

## 库

* libavcodec 提供更广泛的编解码器的实现。
* libavformat 实现流协议，容器格式和基本 I / O 访问。
* libavutil 包括垫圈，解压缩器和其他实用功能。
* libavfilter 提供通过过滤器链改变解码的音频和视频的方法。
* libavdevice 提供访问捕获和回放设备的抽象。
* libswresample 实现音频混合和重采样例程。
* libswscale 实现颜色转换和缩放例程

## 工具

* ffmpeg
* ffplay
* ffprobe

## ffmpeg

* ffmpeg 是一个非常强大的工具，它可以转换任何格式的媒体文件，并且还可以用自己的 AudioFilter 以及 VideoFilter 进行处理和编辑。有了它，我们就可以对媒体文件做很多我们想做的事情了
## ffplay

* ffplay 是以 FFmpeg 框架为基础，外加渲染音视频的库 libSDL 构建的媒体文件播放器

### 格式 - `ffplay [选项] ['输入文件']`

### 主要选项

```
'-x width'        强制以 "width" 宽度显示
'-y height'       强制以 "height" 高度显示
'-an'             禁止音频
'-vn'             禁止视频
'-ss pos'         跳转到指定的位置(秒)
'-t duration'     播放 "duration" 秒音/视频
'-bytes'          按字节跳转
'-nodisp'         禁止图像显示(只输出音频)
'-f fmt'          强制使用 "fmt" 格式
'-window_title title'  设置窗口标题(默认为输入文件名)
'-loop number'    循环播放 "number" 次(0将一直循环)
'-showmode mode'  设置显示模式

可选的 mode
'0, video'    显示视频
'1, waves'    显示音频波形
'2, rdft'     显示音频频带
默认值为 'video'，你可以在播放进行时，按 "w" 键在这几种模式间切换
'-i input_file'   指定输入文件
```

### 一些高级选项
```
'-sync type'          设置主时钟为音频、视频、或者外部。默认为音频。主时钟用来进行音视频同步
'-threads count'      设置线程个数
'-autoexit'           播放完成后自动退出
'-exitonkeydown'      任意键按下时退出
'-exitonmousedown'    任意鼠标按键按下时退出
'-acodec codec_name'  强制指定音频解码器为 "codec_name"
'-vcodec codec_name'  强制指定视频解码器为 "codec_name"
'-scodec codec_name'  强制指定字幕解码器为 "codec_name"
```

### 一些快捷键
```
'q, ESC'            退出
'f'                 全屏
'p, SPC'            暂停
'w'                 切换显示模式(视频/音频波形/音频频带)
's'                 步进到下一帧
'left/right'        快退/快进 10 秒
'down/up'           快退/快进 1 分钟
'page down/page up' 跳转到前一章/下一章(如果没有章节，快退/快进 10 分钟)
'mouse click'       跳转到鼠标点击的位置(根据鼠标在显示窗口点击的位置计算百分比)
```

## ffprobe

* ffprobe 是 ffmpeg 命令行工具中是用来查看媒体文件格式的工具

``` shell
xcq@xcq-HP-Pavilion-Notebook:~/桌面$ ffprobe test.mp4
ffprobe version 3.4.4-0ubuntu0.18.04.1 Copyright (c) 2007-2018 the FFmpeg developers
  built with gcc 7 (Ubuntu 7.3.0-16ubuntu3)
  configuration: --prefix=/usr --extra-version=0ubuntu0.18.04.1 --toolchain=hardened --libdir=/usr/lib/x86_64-linux-gnu --incdir=/usr/include/x86_64-linux-gnu --enable-gpl --disable-stripping --enable-avresample --enable-avisynth --enable-gnutls --enable-ladspa --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librubberband --enable-librsvg --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-omx --enable-openal --enable-opengl --enable-sdl2 --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libopencv --enable-libx264 --enable-shared
  libavutil      55. 78.100 / 55. 78.100
  libavcodec     57.107.100 / 57.107.100
  libavformat    57. 83.100 / 57. 83.100
  libavdevice    57. 10.100 / 57. 10.100
  libavfilter     6.107.100 /  6.107.100
  libavresample   3.  7.  0 /  3.  7.  0
  libswscale      4.  8.100 /  4.  8.100
  libswresample   2.  9.100 /  2.  9.100
  libpostproc    54.  7.100 / 54.  7.100
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'test.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 1
    compatible_brands: isomavc1
    creation_time   : 2018-07-16T15:13:16.000000Z
  Duration: 00:08:46.07, start: 0.000000, bitrate: 2577 kb/s
  # 该视频文件的时长是 8 分 46 秒 7 毫秒，开始播放时间是 0，整个文件的比特率是 2577 Kbit/s
    Stream #0:0(und): Video: h264 (High) (avc1 / 0x31637661), yuv420p, 1920x1080 [SAR 1:1 DAR 16:9], 2446 kb/s, 23.98 fps, 23.98 tbr, 24k tbn, 47.95 tbc (default)
    # 第一个流是视频流，编码格式是 h264 格式( 封装格式为 AVC1 )，每一帧的数据表示为 yuv420p，分辨率为 1920 × 1080，这路流的比特率为2466 Kbit/s，帧率为每秒钟 24 帧
    Metadata:
      creation_time   : 2018-07-16T15:13:16.000000Z
    Stream #0:1(und): Audio: aac (LC) (mp4a / 0x6134706D), 44100 Hz, stereo, fltp, 127 kb/s (default)
    # 第二个流是音频流，编码方式为 ACC（ 封装格式为 MP4A ），并且采用的 Profile（ 配置文件 ）是 LC 规格，采样率是 44.1 KHz，声道是立体声，这路流的比特率 92 Kbit/s
    Metadata:
      creation_time   : 2018-07-16T14:53:06.000000Z
```

颜色编码：其中YUV420是视频中通常采用的颜色编码方式，Y表示亮度，而U，V则与颜色相关，而420则分别对应着存储相应分量所占用的比特数之比。其实采用这种编码方式就是为了早期彩色电视与黑白电视能更好的相容

tbn is the time base in AVStream that has come from the container, I
think. It is used for all AVStream time stamps.

tbc is the time base in AVCodecContext for the codec used for a
particular stream. It is used for all AVCodecContext and related time
stamps.

tbr is guessed from the video stream and is the value users want to see
when they look for the video frame rate, except sometimes it is twice
what one would expect because of field rate versus frame rate.

fps 自然的是 frame per second，就是帧率了。

所以tbn和tbc应该都是在相应层上的时间单元，比如tbn=2997就相当于在视频流层把1s的时间分成了2997个时间单元，如此精细可以更好的与其他流比如音频流同步，对应着fps=29.97就表示每100个时间单元中有一帧。

时间同步方式：
问题来了：fps=29.97这是一个小数啊，我如果直接利用公式 frame number = time * fps 得到了也不是一个整数啊，而帧号应该是一个整数才对。

首先，29.97f/s这个变态的数是如何得到的？这起源于早期的NTSC电视制式，而现代的数字编码只是为了兼容而沿用了它的标准。其实在标准制定 时，NTSC采用的是30f/s的帧率，只是后来為了消除由彩色信号及伴音信号所產生的圖像干擾，每秒幀幅由30幀稍微下調至29.97幀，同時線頻由 15750Hz稍微下降至15734.26Hz

然后，带小数点的帧率如何实现呢，显然每一秒不可能显示相同个数的帧。实际上存在着叫做SMPTE Non-Drop-Frame和SMPTE Drop-Frame的时间同步标准，也就是说在某些时候，会通过丢掉一些帧的方式来将时间同步上。

比如刚才提到的29.97帧率，我们可以计算：29.97 f/sec = 1798.2 f/min = 107892 f/hour;
对于30f/s的帧率我们可以计算： 30 f/s = 1800 f/s = 108000 f/hour;

这样，如果利用每秒30帧的速度来采集视频，而用29.97f/s的速率来播放视频，每个小时就少播放了108帧，这样播放时间会比真实时间变慢。为了解决这个问题，SMPTE 30 Drop-Frame就采取了丢掉这108帧的方式，具体策略是每1分钟丢两帧，如果是第10分钟则不丢，所以每小时丢掉的帧数是：2×60 – 2×6 = 108 帧。更具体的信息，

25 tbr代表帧率；1200k tbn代表文件层（st）的时间精度，即1S=1200k，和duration相关；50 tbc代表视频层（st->codec）的时间精度，即1S=50，和strem->duration和时间戳相关。

25 tbr代表帧率；
90k tbn代表文件层（st）的时间精度，即1S=1200k，和duration相关；
50   tbc代表视频层（st->codec）的时间精度，即1S=50，和strem->duration和时间戳相关。

https://www.jianshu.com/p/bfec3e6d3ec8

https://www.jianshu.com/p/5b78a91f1091

显示帧信息
``` shell
ffprobe -show_frames test.mp4
```

查看包信息
``` shell
ffprobe -show_packets test.mp4
```

## 参考
[20 篇 ffmpeg 学习](https://www.cnblogs.com/renhui/category/1165051.html)
[ 系统学习 ](https://blog.csdn.net/leixiaohua1020/article/details/15811977)

