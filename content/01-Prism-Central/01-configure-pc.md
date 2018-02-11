+++
title = "配置Prism Central"
description = "完成PC的基础配置"

+++

用新修改的admin密码登录之后，点击右上角的问号按钮。点击下面的Self Service & Apps链接，进入SSP的初始化配置界面。

![1341514212269_.pic_hd](/media/15142875527032/1341514212269_.pic_hd.jpg)

点击界面上的New Directory 按钮，配置和AD的集成。

![1351514212341_.pic_hd](/media/15142875527032/1351514212341_.pic_hd.jpg)

在配置页面里输入AD的项目信息，下面的AD的域名为zenlab.local；点击Next按钮。
![1361514212420_.pic_hd](/media/15142875527032/1361514212420_.pic_hd.jpg)

进入SSP管理员配置页面，点击 Add Admins 按钮。

![1371514212451_.pic_hd](/media/15142875527032/1371514212451_.pic_hd.jpg)

在输入框里输入 ssp_a 即可自动搜索出之前创建的SSP管理员组。也可以使用已经由的AD用户和组，点击 Save。

![1381514212512_.pic_hd](/media/15142875527032/1381514212512_.pic_hd.jpg)

在网络配置里勾选默认群集中供SSP用户使用的网络。之后点击 Next 。

![1391514212536_.pic_hd](/media/15142875527032/1391514212536_.pic_hd.jpg)

在最后一个页面中勾选 Enable App Management ，点击 Finish 完成SSP的配置和App功能的启用。
![1401514212572_.pic_hd](/media/15142875527032/1401514212572_.pic_hd.jpg)

以上配置的生效需要一个过程，大约需要十分钟左右的时间，可以在任务里观察这个任务的状态。 

![1411514212685_.pic_hd](/media/15142875527032/1411514212685_.pic_hd.jpg)

{{% alert theme="warning" %}}**以上步骤的验收标准：** 上图中Enable App Management的100%成功完成。{{% /alert %}}