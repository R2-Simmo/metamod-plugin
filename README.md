# MetaMod 简易开发环境

## 快速开始

本仓库通过`git soubmodules`管理上游依赖。
当前模板默认为cs2分支，
可通过以下指令快速初始化：

```shell
git clone --recursive https://github.com/R2-Simmo/metamod-plugin.git
```

## 新建插件

您可以通过复制 `example-cpp-cmake` 目录并重新命名来快速创建cs2的插件。

本教程中以 `$PLUGIN` 代指您的插件目录。
要自定义您的插件名称，
请修改以下内容：

- `$PLUGIN/CMakeLists.txt:2`, 将example_cpp修改为您的插件名称
- `$PLUGIN/CMakeLists.txt:8`, 将example_cpp修改为您的插件名称
- `$PLUGIN/library.cpp:24-54`, 修改为您的信息

建议您使用 `clion` 、 `visual studio` 等支持cmake的现代化ide打开 `$PLUGIN` 目录进行开发。

本项目提倡最小侵入式开发模式，
建议您对功能分类，
并为每个功能分类新增代码类，
在所需位置进行调用。

## 从命令行编译

您可以通过以下指令将 `mmenv.bat` 设为当前环境:

```shell
cmd /k mmenv.bat
```

此时，您的命令行环境中将新增`MMSOURCE112`及`HL2SDKCS2`的环境变量。
您也可以参考`mmenv.bat`文件为其他游戏定义命令行环境脚本。

## 为其他游戏开发

本项目允许您快速添加其他游戏的 `hl2sdk`。
例如，您可以通过以下指令新增 csgo 所使用的hl2sdk:

```shell
git submodule add -b csgo https://github.com/alliedmodders/hl2sdk.git hl2sdk-csgo
```

这条指令会在当前目录下新增目录 `hl2sdk-csgo`，
其中存储了[csgo分支的hl2sdk代码](https://github.com/alliedmodders/hl2sdk/tree/csgo)。

您可以在您的插件中使用CMake或其他任何编译系统引用该sdk。