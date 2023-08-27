##########################################################
#Author: ming
#Email: 1546274931@qq.com
#Description: Ansible playbook for redis cluster,
#		master-slave and sentinel
##########################################################

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
