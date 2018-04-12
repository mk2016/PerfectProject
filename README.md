# PerfectProject

## Perfect (Swift 服务端)

###### 相关链接

[Git](https://github.com/PerfectlySoft/Perfect)
			
[中文官方文档](https://www.perfect.org/docs/index_zh_CN.html)	

[几个Swift服务端框架介绍](http://geek.csdn.net/news/detail/191056) 

[性能对比](https://github.com/xitu/gold-miner/blob/master/TODO/benchmarks-for-the-top-server-side-swift-frameworks-vs-node-js.md)

### 搭建Perfect

1、打开终端，新建一个 PerfectProject 文件夹。    

```
mkdir PerfectProject
cd PerfectProject
```

2、使用swift的[Swift Package Manager](https://www.perfect.org/docs/buildingWithSPM_zh_CN.html)（[SPM官方文档](https://swift.org/package-manager/)）创建和管理我们的工程。
创建一个 可执行的包.
```
$ swift package init --type executable 
//执行后会生成下列文件
Creating executable package: PerfectProject
Creating Package.swift
Creating README.md
Creating Sources/
Creating Sources/PerfectProject/main.swift
Creating Tests/
```

3、打开 Package.swift ，在 dependencies 列表中添加依赖

```
// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PerfectProject",
    dependencies: [
        .package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", from: "3.0.0")
    ],
    targets: [
        .target(
            name: "PerfectProject",
            dependencies: ["PerfectHTTPServer"]),
    ]
)
```

4、编译运行		
首次 build 会从 github 下载相关依赖，过程会比较久。
> 有新增依赖项，修改了 package.swift 后，需要重新 build，这会把新的依赖编译链接进工程。

```
swift build
```
这会编译包并在 .build/debug/ 创建一个可执行文件 PerfectProject。运行它

```
$ .build/debug/PerfectProject
```
终端打印出 `Hello, world!` 就说明成功了


6、创建xcodeproj,这样就可以用Xcode来编译调试了

```
$ swift package generate-xcodeproj  
//下面是执行后打印的内容
generated: ./PerfectProject.xcodeproj
```

## to be continue......










---
## 附 SPM 常用命令
创建新包 `swift package init `

创建可执行包 `swift package init --type executable `

创建库 `swift package init --type library `

更新一个包的依赖 `swift package update`

生产Xcode 项目 `swift package generate-xcodeproj`

下载依赖编译链接 `swift build`





