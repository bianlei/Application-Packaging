代码看一遍
实操一遍demo
准备自我介绍
准备项目介绍
准备相关问题（及提问）

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




提问：
如何做好这个岗位？
这个岗位的难点在哪里？

遇到的问题：
没加-Wait导致程序在没安装完成时就下一步，导致报错


cd D:\Dev\Application-Packaging\application-packaging-automation
.\AutoPack.ps1