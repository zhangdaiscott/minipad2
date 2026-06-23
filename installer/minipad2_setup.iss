#define MyAppName "minipad2"
#define MyAppPublisher "NebulaSoft"
#define MyAppURL "https://github.com/zhangdaiscott/minipad2"
#define MyAppExeName "minipad2.exe"

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
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "startup";     Description: "Start with Windows";     GroupDescription: "Startup:"

[Files]
; FPC 静态编译：只有单个 exe，不需要 bpl
Source: "..\output\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion

; 帮助文件
Source: "..\minipad2\Chinese.chm"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\minipad2\English.chm"; DestDir: "{app}"; Flags: ignoreversion

; 语言文件
Source: "..\minipad2\LngUpdater\English.lng"; DestDir: "{app}\lang"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}";            Filename: "{app}\{#MyAppExeName}"
Name: "{group}\Uninstall {#MyAppName}";  Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}";      Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Registry]
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Run"; \
  ValueType: string; ValueName: "{#MyAppName}"; \
  ValueData: """{app}\{#MyAppExeName}"""; \
  Flags: uninsdeletevalue; Tasks: startup

[Run]
Filename: "{app}\{#MyAppExeName}"; \
  Description: "{cm:LaunchProgram,{#MyAppName}}"; \
  Flags: nowait postinstall skipifsilent
