# Application Packaging Demo Page (4 Projects)

## 1. Application Packaging Demo
A foundational demo that implements the core enterprise application packaging workflow: silent installation, SCCM-compatible detection, and clean uninstallation. It validates the essential skills for Windows application deployment using MSI and PowerShell.

```plaintext
Project Structure - Application Packaging Demo
application-packaging-demo/
├── Install.ps1
├── Detect.ps1
└── Uninstall.ps1
```

## 2. Application Packaging Automation
An enterprise-level automation tool that streamlines the packaging process through configuration-driven deployment. It decouples application settings from script logic, enables automated logging, and supports post-install configuration—ideal for scaling to multiple application packages.

```plaintext
Project Structure - Application Packaging Automation
application-packaging-automation/
├── AutoPack.ps1
├── config.json
└── logs/
```

## 3. SCCM Detection Suite
A comprehensive set of detection scripts that align with Microsoft SCCM’s application deployment standards. It validates application presence through file existence, registry entries, version checks, and service status—critical for reliable enterprise deployments.

```plaintext
Project Structure - SCCM Detection Suite
sccm-detection-suite/
├── Detect-File.ps1
├── Detect-Registry.ps1
├── Detect-Version.ps1
└── Detect-Service.ps1
```

## 4. App Install Doctor
A troubleshooting tool built to solve the most common pain point in enterprise packaging: silent installation failures. It automates MSI log analysis, detects standard Windows Installer error codes, validates SCCM detection logic, checks admin privileges, and generates actionable diagnostic reports.

```plaintext
Project Structure - App Install Doctor
app-install-doctor/
├── App-Install-Doctor.ps1
├── test-log.msi.log
└── outputs/
```