#define MyAppName "minipad2"
#define MyAppPublisher "NebulaSoft"
#define MyAppURL "https://github.com/zhangdaiscott/minipad2"
#define MyAppExeName "minipad2.exe"

; Version 由命令行传入：ISCC.exe ... /DMyAppVersion=v3.2.1
#ifndef MyAppVersion
  #define MyAppVersion "v3.2.0"
#endif

[Setup]
AppId={{8A1F2C3D-4B5E-6F7A-8B9C-0D1E2F3A4B5C}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputDir=Output
OutputBaseFilename=minipad2_setup_{#MyAppVersion}
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
; 不需要管理员权限（HKCU 写入）
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
ArchitecturesInstallIn64BitMode=

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "startup"; Description: "Start with Windows"; GroupDescription: "Startup:"

[Files]
; 主程序
Source: "..\output\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion

; 运行时包（BPL）
Source: "..\output\XCL.bpl";         DestDir: "{app}"; Flags: ignoreversion
Source: "..\output\options.bpl";      DestDir: "{app}"; Flags: ignoreversion
Source: "..\output\pages.bpl";        DestDir: "{app}"; Flags: ignoreversion
Source: "..\output\workspace.bpl";    DestDir: "{app}"; Flags: ignoreversion
Source: "..\output\plugins.bpl";      DestDir: "{app}"; Flags: ignoreversion
Source: "..\output\dataupdater.bpl";  DestDir: "{app}"; Flags: ignoreversion

; 帮助文件
Source: "..\minipad2\Chinese.chm"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\minipad2\English.chm"; DestDir: "{app}"; Flags: ignoreversion

; 语言文件
Source: "..\minipad2\LngUpdater\English.lng"; DestDir: "{app}\lang"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}";         Filename: "{app}\{#MyAppExeName}"
Name: "{group}\Uninstall {#MyAppName}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}";   Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Registry]
; 开机自启（可选，由用户在程序设置里控制，这里只在安装时按任务写）
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Run"; \
  ValueType: string; ValueName: "{#MyAppName}"; \
  ValueData: """{app}\{#MyAppExeName}"""; \
  Flags: uninsdeletevalue; Tasks: startup

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#MyAppName}}"; \
  Flags: nowait postinstall skipifsilent
