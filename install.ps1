# ============================================
# Everforest Theme Installer for Windows 11
# ============================================

Write-Host "🌲 Starting Everforest Windows 11 Installation..." -ForegroundColor Green

# -------------------------------
# Create Required Directories
# -------------------------------
$EverforestRoot = "$env:USERPROFILE\Everforest"
$WallpapersDir = "$env:USERPROFILE\Pictures\Everforest"

New-Item -ItemType Directory -Force -Path $EverforestRoot | Out-Null
New-Item -ItemType Directory -Force -Path $WallpapersDir | Out-Null

# -------------------------------
# Download Wallpapers
# -------------------------------
Write-Host "📥 Downloading wallpapers..."
Invoke-WebRequest "https://raw.githubusercontent.com/1245ym/Everforest-theme-for-windows11/main/assets/wallpapers/everforest1.jpg" -OutFile "$WallpapersDir\everforest1.jpg"
Invoke-WebRequest "https://raw.githubusercontent.com/1245ym/Everforest-theme-for-windows11/main/assets/wallpapers/everforest2.jpg" -OutFile "$WallpapersDir\everforest2.jpg"

# -------------------------------
# Install Windows Terminal
# -------------------------------
Write-Host "🖥️ Installing Windows Terminal..."
winget install --id Microsoft.WindowsTerminal -e --accept-source-agreements --accept-package-agreements

# -------------------------------
# Install Oh-My-Posh
# -------------------------------
Write-Host "🎨 Installing Oh-My-Posh..."
winget install JanDeDobbeleer.OhMyPosh -s winget --accept-source-agreements --accept-package-agreements

# -------------------------------
# Download Everforest Terminal Theme
# -------------------------------
Write-Host "📥 Downloading terminal theme..."
Invoke-WebRequest "https://raw.githubusercontent.com/1245ym/Everforest-theme-for-windows11/main/terminal/everforest.omp.json" -OutFile "$EverforestRoot\everforest.omp.json"

# -------------------------------
# Apply PowerShell Profile
# -------------------------------
Write-Host "⚙️ Applying PowerShell theme..."
$ProfilePath = "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
New-Item -ItemType File -Force -Path $ProfilePath | Out-Null

Add-Content $ProfilePath 'oh-my-posh init pwsh --config "$env:USERPROFILE\Everforest\everforest.omp.json" | Invoke-Expression'

# -------------------------------
# Install VS Code Everforest Theme
# -------------------------------
Write-Host "🧩 Installing VS Code Everforest theme..."
code --install-extension sainnhe.everforest

# -------------------------------
# Install 7TSP (Icon Patcher)
# -------------------------------
Write-Host "📦 Installing 7TSP..."
Invoke-WebRequest "https://github.com/niivu/7TSP/releases/download/1.0/7TSP_GUI_v0.6(2021).zip" -OutFile "$EverforestRoot\7tsp.zip"
Expand-Archive "$EverforestRoot\7tsp.zip" -DestinationPath "$EverforestRoot\7tsp" -Force

# -------------------------------
# Download Everforest Icon Pack
# -------------------------------
Write-Host "📥 Downloading Everforest icon pack..."
Invoke-WebRequest "https://raw.githubusercontent.com/1245ym/Everforest-theme-for-windows11/main/icons/everforest.7z" -OutFile "$EverforestRoot\everforest.7z"

# -------------------------------
# Apply Windows Accent Colors
# -------------------------------
Write-Host "🎨 Applying accent colors..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "AccentColor" -Value 0x80C0A7
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "ColorizationColor" -Value 0x80C0A7

# -------------------------------
# Enable Dark Mode
# -------------------------------
Write-Host "🌙 Enabling dark mode..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0

# -------------------------------
# Done
# -------------------------------
Write-Host ""
Write-Host "🌲 Everforest Theme Installed Successfully!" -ForegroundColor Green
Write-Host "🔄 Restart Windows Terminal to apply the new theme."
Write-Host ""
