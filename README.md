# Selenium Login Automation Test

## Project Structure - Application Packaging Demo
```plaintext
application-packaging-demo/
├── Install.ps1
├── Detect.ps1
└── Uninstall.ps1
```

安装：会用msiexec的静默参数/qn，懂加日志/l*v；
检测：会写 SCCM 标准的检测脚本（Test-Path+ 退出码0/1），知道 SCCM 靠退出码判断安装结果；
卸载：会用 MSI 的产品码GUID做静默卸载，懂企业里「干净卸载」的要求。

我先做了Application Packaging Demo，把企业应用打包的核心步骤（安装、检测、卸载）落地，验证自己掌握了 MSI 和 SCCM 的基础逻辑；之后考虑到企业里需要打包大量应用，重复写脚本效率太低，就做了企业级自动化打包工具，通过配置文件解耦、日志自动化、异常处理，实现了「一键批量打包」，提升了打包的标准化和效率。

## Project Structure - Application Packaging Automation
```plaintext
application-packaging-demo/
├── AutoPack.ps1
├── config.json
└── logs/
```


## Project Structure - SCCM Detection Suite
```plaintext
sccm-detection-suite/
├── Detect-File.ps1
├── Detect-Registry.ps1
├── Detect-Version.ps1
└── Detect-Service.ps1
```