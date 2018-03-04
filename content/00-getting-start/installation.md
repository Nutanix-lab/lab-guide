+++
title = "安装AHV群集"
description = "AHV群集产品安装说明和指导"
weight = 1
+++

{{% alert theme="warning" %}} AHV **20170830.58** 需要最小的版本，这个版本是Nutanix Calm内置于PC中的起始版本。{{%/alert%}}

安装配置好AHV Cluster，配置好两个服务IP，如下图所示。

![1551514288199_.pic_hd](/media/15142875527032/1551514288199_.pic_hd.jpg)

如果以上的数据服务IP不设置，在将AHV群集注册到PC里的时候会报错，而无法完成注册。

{{% alert theme="warning" %}}**以上步骤的验收标准：** 能使用AHV群集默认的初始化密码登陆PE。{{% /alert %}}

