# 用docker解决几个问题

### 遇到的问题：

* Grape
	* 安装运行环境繁琐困难，都要找后端帮忙
	* windows上传图片，遇到`Permission Denied`,尚未找到解决方法
	* windows上出现重启后，找不到已经安装的lib包，尚未查明原因
* Nginx
	* 安装繁琐，对windows来说就是噩梦
	* 使用了个新模块，每个人都要重新安装一遍
	* windows平台的同学现在好像都没法使用https功能
	
* 文件路径问题，用户权限问题困扰前端、QA和部分后端同学，windows平台最为严重

### 解决方案:

让软件运行在统一的环境：docker

* 使用docker封装Nginx，在任意平台使用`docker run`启动Nginx，Nginx更新，只要重新编译docker镜像，任意平台`docker run`新的镜像
* 使用docker封装Python运行环境，在任意平台使用镜像启动环境。剩下的就和之前一样，用编辑器修改代码，保存，pytohn自动重启程序，就能看到新效果。


### 开始使用：

#### 安装docker


| 平台 | 地址 |
| --- | --- |
| MAC | https://docs.docker.com/docker-for-mac/install/  |
| WINDOWS | https://docs.docker.com/docker-for-windows/install/  |
| UBUNTU | https://docs.docker.com/engine/installation/linux/ubuntu/#install-using-the-repository  |

#### 用docker跑grape项目

1. 更新源代码，merge主分支`r`
2. 运行`docker-compose up`
3. enjoy it.


#### 用docker跑Nginx


1. 下载解压软件目录：
2. 目录说明

	```
	.
	├── Dockerfile	//docker镜像build文件，使用者忽略
	├── README.md
	├── bin			//运行脚本目录
	│   ├── run-test.sh
	│   ├── run-zaozuo.sh //公司内部使用这个运行
	│   └── run.sh
	├── conf		//nginx配置文件目录
	│   ├── cert 	//ssl相关加密文件
	│   │   ├── zaozuo.cer
	│   │   └── zaozuo.key
	│   ├── conf.d 		//vhost
	│   │   └── zaozuo.conf  //造作网配置文件
	│   └── nginx.conf 	//nginx主配置文件
	├── html 			//nginx默认的根目录
	│   ├── index.html
	│   ├── static
	│   │   ├── j1.js
	│   │   └── j2.js
	│   └── zaozuo 
	└── logs         //nginx日志目录
	```

3. 默认情况下`conf/cert`目录下是不包含`zaozuo.cer`, `zaozuo.key`这两个文件的，需要单申请。申请到了后拷贝到该目录
4. 编辑`conf/conf.d/zaozuo.conf`将`http://192.168.99.1:8080`替换成你主机的IP
5. 编辑`bin/run-zaozuo.sh`，将`WEBROOT`的值替换为`zaozuo-web`工程的`src/main/resources/`绝对路径
6. 类Unix系统执行`chmod u+x bin/run-zaozuo.sh`，并运行 `./bin/run-zaozuo.sh`启动即可。Windows系统直接双击运行`bin/run-zaozuo.bat`


#### 更多

* docker with jenkins
* docker with mysql
* docker with dnsserver(dnsmasq)
* more...


