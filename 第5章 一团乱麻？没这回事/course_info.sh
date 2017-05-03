#/bin/bash -xv

: '
提取慕课网的课程信息，获取的链接的文本如下:

   [1]慕课网
   [BUTTON]
     * [2]登录 / [3]注册
     * [4]课程
     * [5]职业路径
     * [6]实战
     * [7]猿问
     * [8]手记

     * [9]0 购物车
     * [10]登录
     * [11]注册

   [12]前端小白 [13]PHP入门
   ____________________

   为了账号安全，请及时绑定邮箱和手机[14]立即绑定 [BUTTON]

   [15]课程 \[16]移动开发 \[17]Android \[18]Android面试常客Handler详解

Android面试常客Handler详解

   [19]开始学习
   学习人数
   难度级别 高级
   课程时长 2小时 0分
   综合评分 9.3
   [20]139人评价 [21]查看评价
   9.7 内容实用
   9.2 简洁易懂
   8.9 逻辑清晰
   分享即可 +1积分

   简介：本课程将深入理解Android的Handler机制，并结合源码实例，讲解Looper、MessageqQueue、Handler之间的关
   系，同时介绍HandlerThread的原理和使用，并分析Handler在开发中遇到的异常的原因，最后从源码的角度分析一下Handler更新U
   I的流程
     * [22]章节
     * [23]评论
     * [24]问答
     * [25]笔记

第1章 课程内容简介

   本章主要介绍本课程即将讲解的内容

     * [26]1-1 课程内容介绍 (07:00) [BUTTON] 开始学习

第2章 什么是Handler

   本章将介绍什么是Handler以及Handler的作用

     * [27]2-1 Handler是什么 (04:20) [BUTTON] 开始学习

第3章 Handler的用法

   本章将讲解Handler在日常工作中的几种常见用法

     * [28]3-1 Handler用法（一） (13:48) [BUTTON] 开始学习
     * [29]3-2 Handler用法（二） (18:21) [BUTTON] 开始学习

第4章 Handler原理

   本章将从源码角度分析Handler、Looper，MessageQueue三者之间的关系，让大家真正的了解Handler

     * [30]4-1 与Looper、MessageQueue的关系 (16:21) [BUTTON] 开始学习
     * [31]4-2 Handler原理-图解原理与关系 (03:54) [BUTTON] 开始学习

第5章 Handler与子线程

     * [32]5-1 自定义与线程相关的Handler (06:40) [BUTTON] 开始学习
     * [33]5-2 HanlderThread是什么 (11:51) [BUTTON] 开始学习

第6章 主线程与子线程之间的信息交互

   本章将讲解主线程与子线程之间通过Handler实现信息交互

     * [34]6-1 Handler-主线程与子线程之间的信息交互 (10:33) [BUTTON] 开始学习

第7章 解析Android中更新UI的几种方式

   本章将详细分析几种更新UI方式的内在联系

     * [35]7-1 解析Android中更新UI的几种方式 (11:08) [BUTTON] 开始学习

第8章 非UI线程真的不能更新UI吗

   本章将讲解非UI线程不能更新UI的原因

     * [36]8-1 非UI线程真的不能更新UI吗 (11:23) [BUTTON] 开始学习

第9章 终章：使用Handler时候遇到的问题

   本章将描述使用Handler时常见的问两个问题

     * [37]9-1 使用Handler时候遇到的问题 (03:01) [BUTTON] 开始学习

讲师提示

   [38][547697d10001e0b110240679-80-80.jpg] [39]nate 移动开发工程师

   老师告诉你能学到什么？
          通过本课程，你将学到： 1、什么是Handler 2、如何使用Handler 3、Handler的原理是什么
          4、如何定义一个与线程相关的Handler 5、Android更新UI的几种方式 6、非UI线程真的不能更新UI吗
          7、Handler使用过程中遇到的问题

     * [40]网站首页
     * [41]企业合作
     * [42]人才招聘
     * [43]联系我们
     * [44]讲师招募
     * [45]常见问题
     * [46]意见反馈
     * [47]慕课大学
     * [48]友情链接

   Copyright © 2017 imooc.com All Rights Reserved | 京ICP备 13046642号-2

   [49]意见反馈 [50]常见问题 [51]APP下载
   [52]官方微信
   [53]返回顶部

References

   Visible links
   1. http://www.imooc.com/
   2. http://www.imooc.com/user/newlogin
'
# 显示课程章节和时长信息
lynx -dump http://www.imooc.com/learn/267 | grep -Es "(第[0-9]章)|([0-9]-[0-9].*[BUTTON])" | sed 's/\*.*[0-9]]//g' | sed 's/\[BUTTON\].*//g'