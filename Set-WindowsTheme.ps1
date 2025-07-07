param(
    [ValidateSet("Light", "Dark")]
    [string]$Mode = "Dark"
)

# Registry path for personalization settings
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"

# Set values based on the mode
switch ($Mode) {
    "Dark" {
        Set-ItemProperty -Path $registryPath -Name "AppsUseLightTheme" -Value 0
        Set-ItemProperty -Path $registryPath -Name "SystemUsesLightTheme" -Value 0
        Write-Host "Switched to Dark Mode"
    }
    "Light" {
        Set-ItemProperty -Path $registryPath -Name "AppsUseLightTheme" -Value 1
        Set-ItemProperty -Path $registryPath -Name "SystemUsesLightTheme" -Value 1
        Write-Host "Switched to Light Mode"
    }
}

# Refresh the system theme
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
