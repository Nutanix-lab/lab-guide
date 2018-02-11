+++
title = "模拟AWS EC2蓝图"
description = "创建一个模拟AWS EC2服务的蓝图"
weight = 3
+++

这个lab的目标：

1. 蓝图使用上面的CentOS7的模板镜像
2. 创建模仿AWS EC2虚拟机服务的蓝图
3. 建立两种规格的虚拟机
4. 可以设置虚拟机的其它各种参数


{{% alert theme="info" %}}**参考蓝图** 可以在GitHub下载本文示例蓝图文件，网址：[https://github.com/Nutanix-lab/calm](https://github.com/Nutanix-lab/calm)。{{% /alert %}}

下面是这个蓝图的关键配置讲解。

### 应用基础配置 - Application Profile

![3001516618101_.pic_hd](/images/3001516618101_.pic_hd.jpg)

在变量清单这里增加一个vm_hostname变量，设置初始值为vmhostname

### EC2服务配置 - 规格参数


![3011516618236_.pic_hd](/images/3011516618236_.pic_hd.jpg)


* 配置VM Name，设置两个变量组成的虚拟机名称，用于在Prism里查询
* 配置 martin-centos-t1 为初始化的默认镜像，点亮右侧的小人，这样就可以使蓝图的使用者在运行这个蓝图的时候，选择这个参数的值，而不是预想定死的


![3021516618315_.pic_hd](/images/3021516618315_.pic_hd.jpg)

* 添加一块数据盘，初始8GB，用户可变更
* 配置默认网络为vlan128，用户可变更（右侧小蓝人已经被点亮）

### EC2服务配置 - 软件包安装

![3031516618343_.pic_hd](/images/3031516618343_.pic_hd.jpg)


* 基于martin-centos-t1模板的预装软件包，如果有其它扩展安装和配置的可以把命令写在这里
* 这里使用了一个修改虚拟机主机名的操作


### EC2服务配置 - 虚拟机副本数量

![3041516618358_.pic_hd](/images/3041516618358_.pic_hd.jpg)


* 默认配置为1，用户运行时可变

### 测试EC2蓝图

在蓝图编辑器里点击右上角的Launch按钮。

![3051516618909_.pic_hd](/images/3051516618909_.pic_hd.jpg)

* 配置这次部署的应用名称
* 修改vm_hostname的名称为 xyz-bank
* 点击VM Configuration下面的EC2，在里面可以看到所有运行时可以变更的参数，找到参数：number of replicas ；修改默认的1位3；
* 点击右下角的 Create 按钮

### 观察测试结果

进入Application，点击右侧第三个图标；点击Manager，点击Create的右侧的眼睛的按钮。查看整个部署的过程。点击 Services Tab；观察已经创建的三个虚拟机的IP地址。

进入Explore-> VM 在搜索栏输入 xyz 按回车，应该能看到以下三个虚拟机；

![3061516619519_.pic_hd](/images/3061516619519_.pic_hd.jpg)

点击其中的一个vm

![3071516619548_.pic_hd](/images/3071516619548_.pic_hd.jpg)

点击这个vm上面的console

![3081516619582_.pic_hd](/images/3081516619582_.pic_hd.jpg)

在控制台中登入操作系统，运行 hostname 命令，确认是否是预想的主机名。

### 删除这次部署

回到Nutanix Calm界面，点击右侧的第三个按钮。选中目标要删除的应用部署，选中菜单中的 Delete 命令。

![3091516619726_.pic_hd](/images/3091516619726_.pic_hd.jpg)



{{% alert theme="warning" %}}**以上步骤的验收标准：** 以上新建的三个虚拟机被删除，无法搜索出来。{{% /alert %}}

