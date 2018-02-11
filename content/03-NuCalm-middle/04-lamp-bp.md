+++
title = "LAMP技术堆栈蓝图"
description = "创建带有负载均衡能力的LAMP(/images/服务的蓝图"
weight = 4
+++

这个lab的目标：

1. 蓝图使用上面的CentOS7的模板镜像
2. 创建数据库、app、LB服务
3. 设置服务的各种安装包
4. 设置用于应用部署的变量参数



{{% alert theme="info" %}}**参考蓝图** 可以在GitHub下载本文示例蓝图文件，网址：[https://github.com/Nutanix-lab/calm](https://github.com/Nutanix-lab/calm)，蓝图文件名：LAMP_colo.json。{{% /alert %}}

下面是这个蓝图的关键配置讲解。

下载上传本蓝图的步骤省略，参考本章前两篇文章。

## 蓝图中的重点配置


![3101516620310_.pic_hd](/images/3101516620310_.pic_hd.jpg)

设置量变量参数，用于参数化这个LAMP模板
* 配置MySQL数据库密码
* 变量 DEMO_COMP 用于初始化 Apache的默认首页的内容，扩展开去，你也可以设置为在Apache/Php服务器上部署的应用的代码的参数，如：下载网址等，这样就可以让这个蓝图自动化的部署目标运行的应用代码。

![3111516620357_.pic_hd](/images/3111516620357_.pic_hd.jpg)


* 数据库服务器的基础模板选择 martin-centos-t1 这里设定的是不可变
* 其它的虚拟机规格参数配置如EC2 Demo蓝图，参考上文。

![3121516620399_.pic_hd](/images/3121516620399_.pic_hd.jpg)


* 这段脚本是数据库服务的数据安装命令
* 使用了应用级别的变量初始化MySQL数据库root口令

![3131516620437_.pic_hd](/images/3131516620437_.pic_hd.jpg)

* 这段脚本是Apache服务的安装命令
* 使用了应用级别的变量初始化网站首页的内容，本例中及用于演示的目的
* 真实场景中，可以是一段动态的拉取应用代码吧的脚本，参数可以是应用的名称、版本和位置等。

![3141516620459_.pic_hd](/images/3141516620459_.pic_hd.jpg)


* Apache服务器在LB负载均衡器的后面，默认两个副本
* 副本数在部署的时候可选

### 蓝图的代码

#### 数据库

```
#!/bin/bash
set -ex

# -*- Mysql installation 
#sudo yum install -y "http://repo.mysql.com/mysql-community-release-el7.rpm"
sudo yum update -y
sudo yum install -y mariadb-server mariadb
sudo systemctl start mariadb
sudo systemctl enable mariadb

# -*- Mysql secure installation
mysql -u root<<-EOF
UPDATE mysql.user SET Password=PASSWORD('@@{MYSQL_PASSWORD}@@') WHERE User='root';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';
FLUSH PRIVILEGES;
EOF
```

#### 应用服务器

```
#!/bin/bash
set -ex

# -*- Install httpd and php
sudo yum update -y
sudo yum install -y httpd php php-mysql

echo "<IfModule mod_dir.c>
        DirectoryIndex index.php index.html index.cgi index.pl index.php index.xhtml index.htm
</IfModule>" | sudo tee /etc/httpd/conf.modules.d/dir.conf

echo "<?php
phpinfo();
?>" | sudo tee /var/www/html/info.php 

echo "<h1> @@{DEMO_COMP}@@ </h1>  <?php echo gethostname(); ?>" | sudo tee /var/www/html/index.html

sudo systemctl restart httpd
sudo systemctl enable httpd
```

#### 负载均衡

```
#!/bin/bash
set -ex


port=80
sudo yum update -y
sudo yum install -y haproxy

echo "global
  log 127.0.0.1 local0
  log 127.0.0.1 local1 notice
  maxconn 4096
  quiet
  user haproxy
  group haproxy
defaults
  log     global
  mode    http
  retries 3
  timeout client 50s
  timeout connect 5s
  timeout server 50s
  option dontlognull
  option httplog
  option redispatch
  balance  roundrobin
# Set up application listeners here.
listen stats 0.0.0.0:8080
  mode http
  log global
  stats enable
  stats hide-version
  stats refresh 30s
  stats show-node
  stats uri /stats
listen admin
  bind 127.0.0.1:22002
  mode http
  stats uri /
frontend http
  maxconn 2000
  bind 0.0.0.0:80
  default_backend servers-http
backend servers-http" | sudo tee /etc/haproxy/haproxy.cfg

sudo sed -i 's/server host-/#server host-/g' /etc/haproxy/haproxy.cfg

hosts=$(echo "@@{APACHE_PHP.address}@@" | sed 's/^,//' | sed 's/,$//' | tr "," "\n")


for host in $hosts
do
   echo "  server host-${host} ${host}:${port} weight 1 maxconn 100 check" | sudo tee -a /etc/haproxy/haproxy.cfg
done

sudo systemctl daemon-reload
sudo systemctl enable haproxy
sudo systemctl restart haproxy

```

### 测试和验证

如前文所述Launch这个蓝图，在Service菜单中找到负载均衡HAPROXY服务，点击该服务，找到它的IP地址。

![3151516621097_.pic_hd](/images/3151516621097_.pic_hd.jpg)

在Chrome浏览器里转到这个ip地址的访问。

![3161516621227_.pi](/images/3161516621227_.pic.jpg)

* 这个页面显示的是启动应用是设置的变量 DEMO_COMP


{{% alert theme="warning" %}}**以上步骤的验收标准：** 通负载均衡进入的Apache服务器的默认网页上显示的是启动自定义的字段。{{% /alert %}}


