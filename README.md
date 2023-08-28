>Author: ming
>Email: 1546274931@qq.com
>Description: Ansible playbook for redis cluster,
>		master-slave and sentinel
>Create Date: 2023/8/27
>Last Modify Date: 2023/8/27

# 0.介绍
  这是一个使用Ansible实现一键部署redis集群、哨兵、主从的脚本程序，并且
  内附Dockerfile，可以使用Docker首先创建镜像，然后进入镜像执行本脚本。
  注意，本脚本实现的集群部署仅仅是将响应的集群节点启动，但是不创建集群，创建
  集群的工作留给用户进行。

  startup.sh脚本是该程序的启动脚本，本地执行该脚本即可启动程序.
  在开始安装部署前，请确认本地机器到目标机器的网络是放通的，并且确定本机到目标机器
  的ssh密钥已经存在。通过修改invenroty文件来增加或者删除目标机器IP地址及端口。


  接下来简单介绍使用Docker镜像运行本程序的步骤

# 1.构建Docker镜像
sudo docker build -t repo:tag .

# 2.运行容器
sudo docker continer run -name container_name -d repo:tag

# 3.进入容器修改相关参数
## 1.修改/src/inventory文件，在文件中加入被管理节点的IP地址及端口
     vim /src/inventory

## 2.使用ssh-keygen命令生成密钥
     ssh-keygen

## 3.使用ssh-copy-id命令将系统公钥上传到刚刚加入到inventory文件的IP
     ssh-copy-id user@xx.xx.xx.xx -p xxx

## 4.执行startup.sh脚本
     ./startup.sh
   执行脚本后，会自动在被管理节点上部署redis集群、哨兵、主从，并且启动实例
   安装目录默认为/data/software/redis
   如需修改安装目录路径，打开/src/vars.yml文件，修改redis_base_dir变量即可

# 4.工具版本
## 1. Dokcer version 24.0.5, build ced0996
## 2. Python3.11
 
