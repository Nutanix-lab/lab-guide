+++
title = "创建虚拟机模板"
description = "创建自定义的虚拟机模板"
weight = 4
+++

### 通过ISO光盘安装虚拟机

这个步骤是为测试Calm的蓝图做准备，安装一个CentOS 7 的虚拟机，并且把它转化成模板镜像。

点击 Create VM 按钮，创建一个虚拟机。

![1571514292268_.pic_hd](/media/15142875527032/1571514292268_.pic_hd.jpg)

点击 Next 
![1581514292581_.pic_hd](/media/15142875527032/1581514292581_.pic_hd.jpg)

下面输入磁盘信息和CPU内存的配置信息。点 Save 按钮。
![1591514292805_.pic_hd](/media/15142875527032/1591514292805_.pic_hd.jpg)

进入新创建虚拟机的控制台。

![1601514292926_.pic_hd](/media/15142875527032/1601514292926_.pic_hd.jpg)


在安装完的模板虚拟机里运行一下命令，方便后面的蓝图测试，把这些包装好，后面能更快速一些。

```
yum install httpd mariadb-server mariadb php php-mysql  php-gd nano wget bind-utils net-tools
reboot
```

编辑 /etc/ssh/sshd_config 文件， 取消这一行的注释： PasswordAuthentication yes


再次登录以后用 sys-unconfig 关机。 以下文档内容参考了 [http://lab.digitalformula.net/](http://lab.digitalformula.net/)；



### 将测虚拟机磁盘转成模板镜像

ssh登录到AHV Cluster中的一个CVM。登录后执行` acli `命令，然后输入一下命令 


```
<acropolis> vm.get centos-tmp include_vmdisk_paths=1
centos-tmp {
  config {
    allow_live_migrate: True
    disk_list {
      addr {
        bus: "ide"
        index: 0
      }
      cdrom: True
      device_uuid: "1fd10d29-0ac1-425d-99cc-ecffd6593fb2"
      empty: True
    }
    disk_list {
      addr {
        bus: "scsi"
        index: 0
      }
      container_id: 418
      container_uuid: "08e01b3e-1bfa-45e0-ba11-5155380e0b1f"
      device_uuid: "afe6d35e-97a1-4f16-976a-87fd4c702c2e"
      vmdisk_nfs_path: "/SelfServiceContainer/.acropolis/vmdisk/35ae574b-725f-4ea8-977c-b5c9c42857ca"
      vmdisk_size: 8589934592
      vmdisk_uuid: "35ae574b-725f-4ea8-977c-b5c9c42857ca"
    }
    hwclock_timezone: "UTC"
    machine_type: "pc"
    max_hotplug_memory_mb: 262144
    memory_mb: 2048
    name: "centos-tmp"
    nic_list {
      mac_addr: "50:6b:8d:79:1d:40"
      network_name: "Rx-Automation-Network"
      network_uuid: "ae60a809-d865-4a86-a925-efe062de8084"
      type: "kNormalNic"
      uuid: "4b57273d-fc5a-44a6-9791-4bed549c6ae3"
      vlan_mode: "kAccess"
    }
    num_cores_per_vcpu: 1
    num_vcpus: 1
    power_state_mechanism: "kHard"
    vga_console: True
    vm_type: "kGuestVM"
  }
  logical_timestamp: 3
  state: "kOff"
  uuid: "336672c6-e4b9-4cfa-b8b3-392e66257fd8"
}
<acropolis>


```

使用以上命令得到测试模板机的磁盘文件的路径： `vmdisk_nfs_path: "/SelfServiceContainer/.acropolis/vmdisk/35ae574b-725f-4ea8-977c-b5c9c42857ca"`

用 exit 命令退出 acli 命令行。退出 CVM 的SSH会话。

使用SSH登录PC虚拟机 `ssh nutanix@<pc_vm_ip_address> `，之后运行` nuclei `命令行。


```
image.create name=CentOS7-Template1 image_type=DISK_IMAGE source_uri=nfs://10.21.11.37/SelfServiceContainer/.acropolis/vmdisk/35ae574b-725f-4ea8-977c-b5c9c42857ca

```

* Image name: CentOS7-Template 这是自己起的镜像名称
* CVM IP address: 10.21.11.37 这是AHV群集的Cluster IP
* vmdisk_nfs_path: /NTNX-Container/.acropolis/vmdisk/295b45d0-b8ba–4d52–97ef–54cc5b885af7  这个是acli的输出结果。


以上命令执行成功以后，在命令行里确认一下：


```
<nuclei> image.list
Name                          UUID                                  State
CentOS-7-1406-x86_64-DVD.iso  9236e75f-72f4-4e31-be29-a305159a8ac5  COMPLETE
CentOS7-Template              679178b9-c482-4c30-933b-ed50ab03cb48  COMPLETE
CentOSv2                      eae6627d-1d34-4d30-9c8a-13ca546c444a  COMPLETE
Virt IO                       8bfa2ebe-6c3b-4a4f-a024-6655f05625fd  COMPLETE
Windows2012-disk1             829ec164-ff39-4b79-a901-541e19fc3e2b  COMPLETE
server_2012_r2                fa95afb2-4f67-4748-a595-b3e8e4260fb5  COMPLETE
<nuclei>

```

然后登陆到PC里面在网页上确认一下。如下图所示。


![1611514299352_.pic_hd](/media/15142875527032/1611514299352_.pic_hd.jpg)





{{% alert theme="warning" %}}**以上步骤的验收标准：** PC中可以看到这个镜像，可以将这个镜像加入服务目录中。{{% /alert %}}