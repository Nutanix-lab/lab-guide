+++
title = "常用功能操作"
description = "CE的最基本的操作和使用介绍"
weight = 3
+++

这个lab的目标：

1. 常见功能
2. Prism界面的基本使用

## 显示配置集群管理地址

点击左上角集群名称，可以显示集群详细信息以及配置集群管理地址：
![image024](/ce/image024.png)

## 更新用户信息

用于更新当前用户的联系方式，包括电子邮件地址
![image025](/ce/image025.png)
![image026](/ce/image026.png)

### 更改用户登录口令

![image027](/ce/image027.png)
![image028](/ce/image028.png)

### REST API浏览器

查询所有Rest API接口
![image029](/ce/image029.png)
![image030](/ce/image030.png)

### 下载nCLI

下载命令行工具包nCLI，用于在windows或者其他支持Java平台的系统上可以通过命令行远程管理集群
![image031](/ce/image031.png)

解压之后在命令行中运行，即可连接到远程集群，执行管理命令，如：

查询集群版本：
![image032](/ce/image032.png)
获取主机列表：
![image033](/ce/image033.png)

### 下载并安装windows Cmdlets工具包

下载Windows Cmdlets工具包，可以提供Windows管理员用熟悉的Powershell进行集群管理
![image034](/ce/image034.png)
![image035](/ce/image035.png)
![image036](/ce/image036.png)
![image037](/ce/image037.png)

### 技术支持中心网站

当需要寻求技术支持时，可以直接从Prism界面中打开技术支持中心网站，并登陆即可
![image038](/ce/image038.png)

### 打开文档中心网站

点击帮助时，可以打开在线的文档页面，查找所有Nutanix最新文档资料
![image039](/ce/image039.png)

### 集群健康检查功能演示

点击Health Tutorial即可通过动画方式详细了解Nutanix Health Check功能如何使用
![image040](/ce/image040.png)

### 打开Nutanix社区网站

点击Nutanix Next Community可以打开Nutanix社区网站寻求社区的协助
![image041](/ce/image041.png)

### 添加AD域用户登录验证

添加AD域名和验证的IP地址端口：ldap://10.91.233.78:389，可以使用AD进行用户验证
![image042](/ce/image042.png)
![image043](/ce/image043.png)
![image044](/ce/image044.png)

### 角色映射

可以将域账号中的角色映射为Nutanix的管理员用户或者普通用户
![image045](/ce/image045.png)

### 创建本地用户

可以创建其他管理员用户或者非管理员用户
![image046](/ce/image046.png)

使用域账号登陆
![image047](/ce/image047.png)

### 配置邮件服务器地址

配置邮件服务器地址用于发送告警邮件
![image048](/ce/image048.png)
![image049](/ce/image049.png)

### 配置告警邮件

配置发送告警邮件给管理员或者Nutanix Support
![image050](/ce/image050.png)

### 告警策略配置

针对不同告警，可以配置响应的告警策略通知管理员，避免发生告警风暴
![image051](/ce/image051.png)
![image052](/ce/image052.png)
![image053](/ce/image053.png)

### 网络文件系统白名单

允许特定网段的IP访问Nutanix存储
![image054](/ce/image054.png)

### 软件升级

简单的一键升级功能，可以同时支持升级NOS、Hypervisor、NCC和Firmware，并且实现无人值守升级过程。
![image055](/ce/image055.png)
![image056](/ce/image056.png)
![image057](/ce/image057.png)

字符界面也可以查看升级过程
![image058](/ce/image058.png)

### 自定义欢迎信息或者免责声明等

输入个性化欢迎信息或者免责声明，当用户打开网页即可看到该信息。
![image059](/ce/image059.png)

### 配置Nutanix的DNS服务器地址

输入DNS服务器地址
![image060](/ce/image060.png)

### 配置NTP服务器

输入NTP服务器地址
![image061](/ce/image061.png)

## 小结

1. Nutanix的Prism作为统一的管理接口，不仅可以管理服务器、存储等基础架构，并且可以实时监控Nutanix平台上所有虚拟机状态，用户可以通过一个界面完成日常监控、维护、快速故障定位和诊断、在线升级vSphere和NOS、告警管理、用户管理等日常操作
2. Nutanix更提供命令行接口和预定义Windows Cmdlets脚本，供高级用户开发自动化脚本以实现自动化运维操作
3. Nutanix提供的REST API接口可以方便的与其他监控系统进行整合，简化运维人员日常运维成本。Nutanix也提供SCOM整合的监控管理工具包，便于用户将与现有Microsoft SCOM监控平台进行对接

