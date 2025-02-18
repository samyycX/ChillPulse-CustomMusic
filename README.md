# ChillPulse-CustomMusic
一个向 ChillPulse 添加本地音乐的临时解决方案。
![da92325c33cb5dacd9018f9aa81f6c35](https://github.com/user-attachments/assets/d6c3bc25-88a6-4daf-8324-6a63c7e72a08)

## ⚠用前须知
-  本项目为游戏插件，不保证游戏稳定性，建议在使用前备份存档（游戏目录下的 `save.txt` 和 `save_backup.txt` ）
-  目前只支持添加 `.ogg` 格式音乐文件，请在使用前先使用其他工具（如ffmpeg或在线工具）将您的音乐转换为 `.ogg` 格式

## 🛠️安装&使用教程
### 1. (依赖) .NET 8.0 环境
如果您没有 .NET 8.0 环境，请自行安装

### 2. 下载
前往 Release 界面，下载 `custommusic_with_gs2ml.zip`。

### 3. 安装
打开 Steam，右键 ChillPulse 心流小筑，点击 `属性 -> 已安装文件 -> 浏览...` 进入游戏目录，并将刚才下载的压缩包解压至此处。

### 4. 添加您自己的音乐
进入 `gs2ml/mods/custommusic/musics` 文件夹，新建一个文件夹，此文件夹的名称即是游戏内显示的音乐分类名称（可以创建多个）

将您的 `.ogg` 音乐文件放至您新建的文件夹下，此文件的命名即为游戏内显示的名称。

例：`gs2ml/mods/custommusic/musics/EXAMPLE/MYMUSIC.ogg`
则会在游戏内的音乐菜单添加一栏 `EXAMPLE` 选项，其中有一个名为 `MYMUSIC` 的音乐。

