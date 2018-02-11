+++
title = "环境准备"
description = "准备安装CE所需要的硬件和网络环境"
weight = 1
+++

这个lab的目标：

1. 选择兼容的硬件
2. 准备好社区登录账户


## 硬件要求
Nutanix CE版本支持两种平台部署方式，一种是部署在物理服务器上，另外一种可以以虚拟机的形式部署。以下是使用Community Edition已经测试的过硬件配置建议。但是，与其他Community Edition用户一样，您可能会发现其他硬件和推荐的类型一样可以兼容，包含，但不仅限于以下硬件平台：


| 组件 | 推荐配置 | 说明 |
| --- | --- | --- |
| CPU | Intel CPUs 支持 VT-x | 至少配置4核; 2核给 Controller VM 专用 |
| 内存 | 至少16 GB，每个节点的CVM虚拟机，如果开启去重/压缩功能需要额外的内存开消。| 如果想要使用AOS的去重和压缩功能，或者创建更多的虚拟机时，强烈建设配置32 GB  |
| 网卡 | 基于Intel的网卡 | 一些 Community Edition 用户使用Broadcom 网卡也有成功的. |
| HBA卡 |  Community Edition支持(AHCI) SATA, 或 LSI 控制器: * IT 模式 (Nutanix测试显示IT模式的性能优于IR模式) * IR 直通模式 * IR RAID-0模式|  |
| 存储设备 | 每个节点的SSD/HDD数据最多为4块 | 有些Community Edition 用户也有超过4个设备的成功案例 |
| 冷数据层 |不低于500 GB, 最大 18 TB (3 x 6 TB HDDs) | 用于冷数据存储的HDD 或 SSD |
| 热数据层 | 单个不低于200 GB SSD | 将SSD(s)放在HDD之前(通常为0或1) 第一个槽位数字取决于制造商的标签。不支持基于NVMe的驱动器 |
| 引导分区 | 每节点一个8 GB 以上的设备. 可以是内置的，也可以是外置的 |  Nutanix已经成功测试过并使用了外部的USB设备和内部设备，比如SATA DOM 。建议使用USB 3.0 设备. 注意:如果你使用USB驱动器，在任何时候，不要删除USB驱动器。|
| 固件 | 考虑为您将在Community Edition中使用的任何设备或硬件更新固件，以获得硬件供应商推荐的最新版本或建议版本。 |  |

## 硬件兼容型号举例

| 品牌 | 配置 |
| --- | --- |
| Cisco |  Cisco UCS C220 M3 ; CPU: Intel Xeon E5-2609v2 2.5GHz ; RAM: 24GB DDR3 ; SSD: Cisco Enterprise Value SSD - 240 GB; HDD: Cisco - 500 GB - 2.5" SFF - SATA 6Gb/s - 7200 rpm ; NIC: Broadcom NetXtreme II 5709 |
| Dell | Dell PowerEdge R220; CPU: Intel Xeon E3-1220v3 3.1GHz; RAM: 32GB DDR3; SSD: Kingston SSDNow E50 - 480GB; HDD: 7.2k RPM SATA 3Gbps 2.5in - 1TB; NIC: On-Board LOM 1GBE (LAN on Motherboard)|
| HP |HP ProLiant DL320e Gen8 v2； CPU: Intel Xeon E3-1220v3 3.1GHz；RAM: 32GB DDR3；SSD: Kingston SSDNow E50 - SSD - 240 GB；HDD: HP Midline HDD - 500 GB - SATA 6Gb/s - 7200 rpm；NIC: HP Ethernet 1Gb 2-port NC332i Adapter|
| SuperMicro |SuperMicro SuperServer 1018D-73MTF；CPU: Intel Xeon E3-­1220v3 3.1GHz；RAM: 32GB DDR3；SSD: Seagate Pulsar.2 Enterprise SAS SSD - 200GB；HDD: Seagate Constellation.2 SATA 6Gb/s 7.2K RPM 64M - 500GB；NIC: Intel I210AT - Dual Gigabit Ethernet LAN|

如果服务器不在以上的列表中，也可以查看以下链接：

[http://next.nutanix.com/t5/Discussion-Forum/Post-your-hardware-config/m-p/3249#U3249](http://next.nutanix.com/t5/Discussion-Forum/Post-your-hardware-config/m-p/3249#U3249)

查找是否有兼容的型号。
## 软件准备

国外下载链接：

[https://s3.amazonaws.com/ntnx-portal/ce/2017.07.21/ce-2017.07.20-stable.img.gz](https://s3.amazonaws.com/ntnx-portal/ce/2017.07.21/ce-2017.07.20-stable.img.gz)

国内网盘下载链接：

[https://share.weiyun.com/d14f3d74680d553bcad0ab4b9b073614](https://share.weiyun.com/d14f3d74680d553bcad0ab4b9b073614)

百度网盘链接:[ https://pan.baidu.com/s/1hsMpfla ]( https://pan.baidu.com/s/1hsMpfla )密码: f7q4

{{% alert theme="warning" %}}**以上步骤的验收标准：** 准备好可以安装CE的硬件和软件。{{% /alert %}}

