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

2、使用swift的[Swift Package Manager](https://www.perfect.org/docs/buildingWithSPM_zh_CN.html)创建和管理我们的工程。（[SPM官方文档](https://swift.org/package-manager/)）

```
$ swift package init  
//执行后会生成下列文件
Creating library package: PerfectProject
Creating Package.swift
Creating README.md
Creating .gitignore
Creating Sources/
Creating Sources/PerfectProject/PerfectProject.swift
Creating Tests/
Creating Tests/LinuxMain.swift
Creating Tests/PerfectProjectTests/
Creating Tests/PerfectProjectTests/PerfectProjectTests.swift
Creating Tests/PerfectProjectTests/XCTestManifests.swift
$ 
```

3、打开 Package.swift ，在 dependencies 列表中添加依赖
> 我当前的版本 swift-tools-version:4.0		

###### 要修改的地方：		
* products[] 改成 生成可执行文件		
* dependencies[] 中添加依赖		
* targets[] 中的 .target 中添加 要依赖的名称。

```
// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PerfectProject",
    products: [
        .executable(name: "PerfectProject", targets: ["PerfectProject"]),
    ],
    dependencies: [
        .package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", from: "3.0.0")
    ],
    targets: [
        .target(
            name: "PerfectProject",
            dependencies: ["PerfectHTTPServer"]),
        .testTarget(
            name: "PerfectProjectTests",
            dependencies: ["PerfectProject"]),
    ]
)
```

4、在 Sources/PerfectProject 下新建 main.swift

```
echo 'print("Hello Perfect!")' >> Sources/PerfectProject/main.swift
```

5、编译运行		
首次 build 会从 github 下载相关依赖，过程会比较久。
> 有新增依赖项，修改了 package.swift 后，要重新 build，这将会将新的依赖链接编译进工程。

```
swift build
$ .build/debug/PerfectProject
```

终端打印出 `Hello Perfect!` 就说明成功了


> 注意：如果没创建 main.swift, build 会提示下面错误
```
error: terminated(1): /Library/Developer/CommandLineTools/usr/bin/swift-build-tool -f /Users/xiaomk/Projects/PerfectProject/.build/debug.yaml main output:
```


6、创建xcodeproj,这样就可以用Xcode来编译调试了

```
$ swift package generate-xcodeproj  
//下面是执行后打印的内容
generated: ./PerfectProject.xcodeproj
```






