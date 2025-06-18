# Cài IIS nếu chưa có
if (-not (Get-WindowsFeature Web-Server).Installed) {
  Install-WindowsFeature -Name Web-Server -IncludeManagementTools
}
# Đảm bảo thư mục web root tồn tại
New-Item -Path C:\inetpub\wwwroot -ItemType Directory -Force
