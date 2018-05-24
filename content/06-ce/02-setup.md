+++
title = " 安装部署"
description = "在服务器上安装CE"
weight = 2
+++

这个lab的目标：

1. 完成安装过程
2. 启动和登录CE的Prism界面


## 物理环境部署

详细的说明参照官方文档：

[https://portal.nutanix.com/#/page/docs/details?targetId=Nutanix-Community-Edition-Getting-Started:Nutanix-Community-Edition-Getting-Started](https://portal.nutanix.com/#/page/docs/details?targetId=Nutanix-Community-Edition-Getting-Started:Nutanix-Community-Edition-Getting-Started)

安装步骤如下所示：

* 使用工具将CE镜像刷到U盘 [https://www.osforensics.com/tools/write-usb-images.html](https://www.osforensics.com/tools/write-usb-images.html)
* 使用U盘启动机器
* 使用install用户进行配置
* 使用cluster create命令创建集群
* 首次访问Prism，必须保持网络连接，必须提前注册my.nutanix.com的账号用于身份验证

使用U盘引导之后的安装开始界面如下：

![image003](/ce/image003.png)

使用Install用户登录，不需要输入密码；输入install按回车。

![image004](/ce/image004.png)

选择键盘布局，使用Tab键选择“Proceed” 这将消除磁盘上的任何现有数据。

![image005](/ce/image005.png)

输入IP地址信息

* Host IP: 10.68.69.101
* CVM IP: 10.68.69.102
* Netmask: 255.255.255.0
* Gateway: 10.68.69.1
* [x] Single controller DNS: 8.8.8.8

注意：安装需要连接Internet；只有一个设备时需要在Create single-mode cluster打勾选择

![image006](/ce/image006.png)

完成安装之后，按回车，重启服务器。

![image007](/ce/image007.png)

## 虚拟机环境部署

这种在虚拟化环境中部署CE属于实验目的，如果已经完成了以上的硬件服务器部署，请忽略下文，进入下一个章节。

安装指南:

* 将CE镜像改为vmdk（如果是ESXi，使用vmkftools；如果是workstation，使用vmx文件）
* 使用install用户进行配置
* 使用cluster create命令创建集群
* 首次访问Prism，必须保持网络连接，必须提前注册my.nutanix.com的账号用于身份验证

以VMWare Workstation部署CE为例:

解压ce-2017.07.20-stable.img.gz文件，你将得到一个名为“ce-2017.07.20-stable.img”的文件，将此文件改成“ce-flat.vmdk”。根据以下内容再创建名为ce.vmdk的描述文件。

[https://www.virtuallifestyle.nl/wp-content/uploads/2014/09/ce.txt](https://www.virtuallifestyle.nl/wp-content/uploads/2014/09/ce.txt)

![image008](/ce/image008.png)

### 新建一个虚拟机
![image009](/ce/image009.png)

### 设置虚拟机配置

![image010](/ce/image010.png)
![image011](/ce/image011.png)
![image012](/ce/image012.png)
![image013](/ce/image013.png)
![image014](/ce/image014.png)
![image015](/ce/image015.png)

### 添加磁盘

这是很关键的一步，对于VM的第一个磁盘，附加一个现有的SATA磁盘。选择上面创建的映像/磁盘描述符文件。
![image016](/ce/image016.png)
![image017](/ce/image017.png)

### 其它磁盘添加

 除了第一个安装引导盘以外，再添加两块磁盘，第二块盘作为热数据层，第三块盘作为冷数据层。
![image018](/ce/image018.png)

### 启动虚拟机-开始安装

启动后，进行安装界面，安装方式跟之前物理环境中的过程一样。
![image019](/ce/image019.png)

## 访问Prism界面

输入CVM的IP地址，使用admin/admin登录Prism，并修改密码
![image020](/ce/image020.png)

按照提示使用my.nutanix.com的账号激活CE，此步骤需要访问Internet
![image021](/ce/image021.png)

激活成功后，开启你的HCI之旅吧！Enjoy it!
![image022](/ce/image022.png)
![image023](/ce/image023.png)




{{% alert theme="warning" %}}**以上步骤的验收标准：** 成功登陆Prism界面。{{% /alert %}}

