<#
.SYNOPSIS
  Tạo file.txt với nội dung tùy chỉnh trên máy Windows.

.DESCRIPTION
  Script này sẽ:
    1. Nhận đầu vào đường dẫn file và nội dung (có default).
    2. Tạo thư mục nếu chưa tồn tại.
    3. Ghi nội dung vào file (ghi đè nếu đã có).

.PARAMETER Destination
  Đường dẫn đầy đủ tới file cần tạo, ví dụ: C:\deploy\file.txt

.PARAMETER Content
  Nội dung văn bản ghi vào file.

.EXAMPLE
  # Chạy mặc định (C:\deploy\file.txt chứa "Hello from CodeDeploy")
  .\Create-File.ps1

  # Chạy với tham số tùy chỉnh
  .\Create-File.ps1 -Destination "D:\data\myfile.txt" -Content "Xin chào các máy!"
#>

param(
    [Parameter(Mandatory=$false)]
    [string]$Destination = "C:\deploy\file.txt",

    [Parameter(Mandatory=$false)]
    [string]$Content = "Hello from CodeDeploy"
)

try {
    # Tạo thư mục chứa file nếu chưa có
    $folder = Split-Path $Destination -Parent
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
    }

    # Ghi nội dung vào file (ghi đè nếu đã tồn tại)
    $Content | Out-File -FilePath $Destination -Encoding UTF8 -Force

    Write-Host "✅ File created at $Destination with content:"
    Write-Host "   $Content"
} catch {
    Write-Error "❌ Đã có lỗi khi tạo file: $_"
    exit 1
}
