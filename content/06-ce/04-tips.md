+++
title = "常用技巧"
description = "CE的相关常用命令"
weight = 10
+++

这个lab的目标：

1. 在硬件受限制的时候调整cvm的规格
2. 调整时区和时间
3. 其它


## 调整时区和日期相关

调整Host或者CVM操作系统的时区、日期和时间等。

参考命令如下：

```
timedatectl set-timezone Asia/Shanghai
timedatectl set-ntp true
ntpq -p

```



## 调整CVM的内存

如果按照CE的机器内存很紧张，可以将CVM的内存降低，登陆到AHV的OS，参考命令如下：

```
virsh shutdown  NTNX-7aa2dd30-A-CVM

virsh setmaxmem  NTNX-7aa2dd30-A-CVM  10G --config

virsh setmem  NTNX-7aa2dd30-A-CVM 10G --config

virsh start  NTNX-7aa2dd30-A-CVM

virsh  dominfo NTNX-7aa2dd30-A-CVM
```


