# Changes
该仓库使用Github Actions编译并上传原版Openwrt固件，固件在Actions中即可下载。

该仓库编译了如下设备的固件:

- x86_64
- 斐讯K2P
- Newifi D2


# AutoBuild-OpenWrt-Orig
[![LICENSE](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat&logo=github&label=LICENSE)](https://github.com/esirplayground/AutoBuild-OpenWrt/blob/master/LICENSE)
![GitHub Stars](https://img.shields.io/github/stars/esirplayground/AutoBuild-OpenWrt.svg?style=flat&logo=appveyor&label=Stars&logo=github)
![GitHub Forks](https://img.shields.io/github/forks/esirplayground/AutoBuild-OpenWrt.svg?style=flat&logo=appveyor&label=Forks&logo=github)
![GitHub last commit](https://img.shields.io/github/last-commit/esirplayground/AutoBuild-OpenWrt?label=Latest%20Commit&logo=github)

Build OpenWrt firware [OpenWrt](https://github.com/openwrt/openwrt) using GitHub Actions  
Hereby thank P3TERX for his amazing job: https://github.com/P3TERX/Actions-OpenWrt/  

Hereby thank KFERMercer for his amazing job: https://github.com/KFERMercer/OpenWrt-CI  
You could edit and enable "Sync Code" YAML file to let your forked repo keep updated.

**1. Prerequisite**

  - Sign up for [GitHub Actions](https://github.com/features/actions/signup)
  - Fork [this GitHub repository](https://github.com/esirplayground/AutoBuild-OpenWrt)
    

**2. Compile Firmware**

  - Click `[.github/workflows]` folder on the top of repo and you could see few workflow files, Each for one particular architecture(device).
  - Edit the workflow file you desire，uncomment push section 3 lines together and submit the commit.(Other 2 methods wait you to discover)
  - The build starts automatically. Progress can be viewed on the Actions page.
  - When the build is complete, click the `Artifacts` button in the upper right corner of the Actions page to download the binaries.
  - Default Web Admin IP: `192.168.1.1`, username `root`, no login password
