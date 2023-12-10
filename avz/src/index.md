<!--
 * @Coding: utf-8
 * @Author: vector-wlc
 * @Date: 2021-02-11 16:52:23
 * @Description: 
-->
# Assembly vs. Zombies

#####                                                                                                                                                                                                       --------windows

High-Precision PvZ TAS Frameworks

高精度植物大战僵尸键控框架

> 适用于 AvZ1 版本: 221001

## 简介

AvZ (Assembly vs. Zombies - windows )是一套使用 C++ 语言编写的高精度植物大战僵尸键控框架，理论由 yuchenxi0_0 提出，框架底层由 yuchenxi0_0 实现，和其他框架相似的接口由 vector-wlc 编写。

AvZ 操作精度为理论上的100%绝对精准，使用这套框架将再也不用担心精度的问题，可在一定程度上减少录制视频次数，有效的完成视频制作。

本项目使用 [VSCode](https://code.visualstudio.com/) + MinGW 进行代码编辑、编译和注入。 

## 安装

[【新人友好】3分钟教你写出第一个AvZ键控脚本！](https://www.bilibili.com/video/BV1pC4y1U7WL)

## 使用教程

**👉 [开始阅读](./basic/start.md) 👈**

> **🔗站外链接**
> 
> 在 [GitLab](https://gitlab.com/vector-wlc/AsmVsZombies/-/blob/4d02c035f85fe511fd90869a3d450ea0360d9587/tutorial/catalogue.md) 上阅读
>
> 在 [GitHub](https://github.com/vector-wlc/AsmVsZombies/blob/4d02c035f85fe511fd90869a3d450ea0360d9587/tutorial/catalogue.md) 上阅读


> **📺其它教程**
> 
> [聪明的 AvZ](https://www.bilibili.com/video/BV1cw411R7mZ)
> 
> [AvZ 视频录制](https://www.bilibili.com/video/BV1C7411o7mx)

## 友情链接

**注意以下存储库的作者不是AsmVsZombies的作者，因此出现任何问题请咨询存储库中的相关作者**

AvZ 扩展功能库 : [AvZLib](https://github.com/qrmd0/AvZLib)（[GitLab 镜像](https://gitlab.com/avzlib/AvZLib)）

AvZ 脚本库 : [AvZScript](https://github.com/qrmd0/AvZScript)

## 原理

在游戏主循环函数前面注入键控代码，使得键控脚本在每一帧都被调用，从而实现真正意义上100%精确的键控。

## 对比

从原理可以明显看出此套框架在理论实现上与传统框架截然不同，传统框架使用一个程序向 PvZ 窗口发送点击消息，而此套框架使用代码注入，直接入侵到程序内部，让游戏程序运行我们编写的脚本！其优缺点大致如下：

> 缺点 
>
> * 编写不慎可能会导致游戏崩溃

> 优点
>
> * 精度极高
> * 脚本出现错误时提示更加人性化
> * 对硬件配置 (CPU) 的要求低
> * 对操作时间顺序不做严格要求

## 致谢
[yuchenxi2000/AssemblyVsZombies](https://github.com/yuchenxi2000/AssemblyVsZombies)<br>
[lmintlcx/pvzscript](https://github.com/lmintlcx/pvzscripts)<br>
[失控的指令(bilibili)](https://space.bilibili.com/147204150/)<br>
[Power_tile(bilibili)](https://space.bilibili.com/367385512)<br>
[六三enjoy(bilibili)](https://space.bilibili.com/660622963)<br>
[Reisen-レイセン(bilibili)](https://space.bilibili.com/323002513)<br>
<strong>以及所有对此项目提出建议的使用者和开发人员</strong>
