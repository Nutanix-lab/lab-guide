+++
title = "一键安装Docker Swarm群集"
description = "安装和部署Docker Swarm群集，包含高可用性等。"
weight = 1
+++

构建中....

这个lab的目标：

1. 蓝图使用上面的CentOS7的模板镜像
2. 在创建工作流里生成一个包含Hello World字符串的文件/helloworld.txt
3. 这个蓝图可以生成自定义配置的n台虚拟机
4. 运行这个蓝图生成3个虚拟机
5. 使用Stop工作流，poweroff这三个虚拟机
6. 使用Start工作流，poweron这三个虚拟机
7. 使用Delete工作流删除这三个虚拟机实例



{{% alert theme="warning" %}}**以上步骤的验收标准：** 可以登录用户蓝图生成的vm，能看到目标的文件。{{% /alert %}}