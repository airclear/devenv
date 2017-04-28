# Getting Start

## 安装

1. 安装docker.
2. 拷贝https相关文件`zaozuo.cer`, `zaozuo.key` 到`conf/cert/`目录下
3. 编辑`run-zaozuo.sh`, 修改`WEBROOT`为自己的路径，运行run-zaozuo.sh.


## 测试

* [x] 测试nginx-http-concat
* [x] 测试ssl
* [x] 测试zaozuo-web


## 目录说明

```
.
├── Dockerfile	//docker build文件
├── README.md
├── bin			//运行脚本目录
│   ├── run-test.sh
│   ├── run-zaozuo.sh
│   └── run.sh
├── conf		//nginx配置文件目录
│   ├── cert 	//ssl相关文件
│   │   ├── zaozuo.cer
│   │   └── zaozuo.key
│   ├── conf.d 		//vhost
│   │   └── zaozuo.conf
│   └── nginx.conf 	//nginx主配置文件
├── html 			//nginx root
│   ├── index.html
│   ├── static
│   │   ├── j1.js
│   │   └── j2.js
│   └── zaozuo
└── logs
```