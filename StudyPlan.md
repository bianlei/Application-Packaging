
如何实现静默安装（Silent Installation）？
这是高频问题。需要了解不同安装程序的参数：
MSI: msiexec /i "YourApp.msi" /qn ( /qn 表示完全无界面)。
EXE (InstallShield): setup.exe /s /v"/qn"。
EXE (WiX): 通常也是 setup.exe /qn。
强调需要验证安装是否成功、服务是否启动、快捷方式是否创建。

如何处理打包过程中的冲突（Dependencies & Conflicts）？
考察问题排查能力。可能涉及：
注册表冲突：清理旧版本残留。
文件版本冲突：使用共享 DLL 或确保应用绑定正确版本。
服务冲突：检查服务名称、启动类型是否与现有系统冲突。

你熟悉哪些 PowerShell 核心 cmdlets？
这是基础。至少要掌握：
文件操作: Get-ChildItem (ls), Copy-Item (cp), Remove-Item (rm), New-Item.
系统信息: Get-ComputerInfo, Get-Service, Start-Service, Stop-Service.
进程管理: Get-Process, Start-Process.
注册表: Get-ItemProperty, Set-ItemProperty.
字符串处理: Write-Output, Write-Host, Select-String.

写一个 PowerShell 脚本，实现静默安装一个 MSI 包，并在安装完成后启动该软件的服务。
# 定义安装包路径
$msiPath = "C:\Path\To\Your\App.msi"
# 执行静默安装并等待安装完成
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i $msiPath /qn" -Wait
# 安装完成后，启动服务
Start-Service -Name "YourServiceName"

如何在 SCCM 里部署一个 MSI 包？
如何做检测方法（Detection Method）判断应用是否安装成功？
如何确保应用在多用户环境下正常运行（多实例、权限、注册表隔离）？

打包流程 + 常见问题


GitHub:
你的 GitHub 项目最终结构（超级干净、企业级）

提问：
如何做好这个岗位？
这个岗位的难点在哪里？

Application Packaging Interview Portfolio - Lei Bian
个人简介：精简版简历核心信息（5 + 年 IT 经验、核心技能：系统运维 / 部署 / 自动化 / 虚拟化、AWS 认证）+ 岗位匹配宣言（如：“具备 IT 系统全流程操作经验，已系统学习 MSI/App-V/SCCM/PowerShell 应用打包核心技术，可快速上手企业级应用打包与部署工作”）