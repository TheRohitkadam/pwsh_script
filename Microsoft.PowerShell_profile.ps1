clear
if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }
[ScriptBlock]$Prompt = {
  $realLASTEXITCODE = $global:LASTEXITCODE
  $env:POSH = "hello from Powershell"
  & "C:\tools\oh-my-posh.exe" -config "~/downloadedtheme.json" -error $realLASTEXITCODE -pwd $PWD
  $global:LASTEXITCODE = $realLASTEXITCODE
  Remove-Variable realLASTEXITCODE -Confirm:$false
}

[ScriptBlock]$Prompt = {
    $lastCommandSuccess = $?
    $realLASTEXITCODE = $global:LASTEXITCODE
    $errorCode = 0
    if ($lastCommandSuccess -eq $false) {
        #native app exit code
        if ($realLASTEXITCODE -ne 0) {
            $errorCode = $realLASTEXITCODE
        }
        else {
            $errorCode = 1
        }
    }
    $startInfo = New-Object System.Diagnostics.ProcessStartInfo
    $startInfo.FileName = "C:\tools\oh-my-posh.exe"
    $cleanPWD = $PWD.ProviderPath.TrimEnd("\")
    $startInfo.Arguments = "-config=""C:\Users\R\.poshthemes\jandedobbeleer.json"" -error=$errorCode -pwd=""$cleanPWD"""
    $startInfo.Environment["TERM"] = "xterm-256color"
    $startInfo.CreateNoWindow = $true
    $startInfo.StandardOutputEncoding = [System.Text.Encoding]::UTF8
    $startInfo.RedirectStandardOutput = $true
    $startInfo.UseShellExecute = $false
    if ($PWD.Provider.Name -eq 'FileSystem') {
      $startInfo.WorkingDirectory = $PWD.ProviderPath
    }
    $process = New-Object System.Diagnostics.Process
    $process.StartInfo = $startInfo
    $process.Start() | Out-Null
    $standardOut = $process.StandardOutput.ReadToEnd()
    $process.WaitForExit()
    $standardOut
    $global:LASTEXITCODE = $realLASTEXITCODE
    #remove temp variables
    Remove-Variable realLASTEXITCODE -Confirm:$false
    Remove-Variable lastCommandSuccess -Confirm:$false
}
Set-Item -Path Function:prompt -Value $Prompt -Force

Import-Module posh-git
Import-Module oh-my-posh
# Set-PoshPrompt -Theme agnoster
Set-Theme Paradox;
# Set-PoshPrompt -Theme jandedobbeleer
# Set-PoshPrompt -Theme material

function env { Get-ChildItem -Path Env:\  }

function n8 { nvm use 8.17.0 }

function n10 { nvm use 10.0.0 }

function n12 { nvm use 12.18.4 }

function n14 { nvm use 14.11.0 }

function n15 { nvm use 15.12.0 }

function ra { yarn react-native run-android }

function gcl { cd android && .\gradlew clean && cd.. }

function gb {cd android && .\gradlew assembleRelease }

function emulist { emulator -list-avds }

function pixel { cd F:\Android\Sdk\emulator && .\emulator -avd Pixel_3a }

function react { cd G:\React }

function tg { cd F:\laragon\www }

function mc { cd 'G:\Apps\React-native Apps\MyntraClone'}

function ys { yarn start }

function .. { cd.. }

function .~ { cd ~ }

function lara {cd F:\laragon\www}

function pas { php artisan serve }

function yrw { yarn run watch }

function rn { rimraf node_modules }

function y {yarn install && yarn jetify}

function pro { code $PROFILE}

function sc { cd F:\Scrcpy && .\scrcpy.exe }

function edge { cd G:\EdgeCRM\ }

function gs {git status}

function ga {git add .}

function folder {explorer .}

function theme {Get-PoshThemes}

function cyber {cd G:\Apps\cyber-task}

function xampp {cd G:\xampp\htdocs}

function cc {php artisan cache:clear && php artisan view:clear && php artisan config:cache && php artisan route:cache && php artisan migrate --force}

function cast {adb tcpip 5555 && adb connect 192.168.0.10:5555 && scrcpy -b2M -m800}

function vs {cd G:\visionstack}

function dev {cd D:\}

function nrw {npm run watch}

function rndep (){
  yarn add @react-navigation/native &&
  yarn add react-native-reanimated react-native-gesture-handler react-native-screens react-native-safe-area-context @react-native-community/masked-view &&
  yarn add @react-navigation/bottom-tabs &&
  yarn add @react-navigation/drawer && 
  yarn add @react-navigation/stack && 
  yarn add react-native-vector-icons &&
  yarn add @react-native-firebase/app &&
  yarn add axios &&
  react-native link
}


#<<<< Mitesh File

# clear
# if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }
# Import-Module posh-git
# Import-Module oh-my-posh
# # Set-Theme Paradox;
# Set-Theme Operator;
# function n8 { nvm use 8.17.0 }
# function n10 { nvm use 10.0.0 }
# function n12 { nvm use 12.18.4 }
function ra { yarn react-native run-android }
# function rs { yarn react-native start }
# function gcl { cd android && .\gradlew clean && cd.. }
# function gb {cd android && .\gradlew assembleRelease && cd ..}
# function emulist { emulator -list-avds }
# function apps { cd G:\Apps }
# function ys { yarn start }
# function // { cd.. }
# function pas { php artisan serve }
# function yrw { yarn run watch }
# function rn { rimraf node_modules }
# function y {yarn install && yarn jetify}
# function pro { code $PROFILE}
# function sc { scrcpy }
# function edge { cd E:\Edge-CRM\ }
# function env { .\env\scripts\activate }
# function ic { cd "E:\React native\InstagramClone\" && code . }
# function apps { cd G:\Apps }
# function ws { cd E:\weekend_stuff }
# function re { emulator  -avd Pixel_3a_API_28 }
# function rndep (){
# yarn add @react-navigation/native &&
# yarn add react-native-reanimated react-native-gesture-handler react-native-screens react-native-safe-area-context @react-native-community/masked-view &&
# yarn add @react-navigation/bottom-tabs &&
# yarn add @react-navigation/drawer && 
# yarn add @react-navigation/stack && 
# yarn add react-native-vector-icons &&
# yarn add @react-native-firebase/app &&
# yarn add axios &&
# react-native link
# }
# Function rn($s) {
#  npx react-native init $s && cd $s && rd && code . && ra
# }
Function pnpr($s) {
  npx create-react-app $s --use-pnp
}

Function pnprn($s) {
  npx react-native init $s
  # npx react-native init MyTestApp
}

# Delete Folder / Directory
Function df($s) {
  rmdir $s -force -recurse  
}
# Function edgeProject($s) {
#  npx react-native init $s --version react-native@0.59 && 
#  cd $s &&
#  git init &&
#  git submodule add git@gitlab.com:SalesTantra/edge-base.git 
# }
# Function gitpush($dir,$repo,$comment) {
# cd $dir && 
# git remote add origin $repo &&
# git add . &&
# git commit -m $comment &&
# git push -u origin master && 
# cd .. 
# }
# Function gacp($branch,$comment) {
# git add . &&
# git commit -m $comment &&
# git push -u origin $branch 
# }
# Function gbcm ($s) {
# git branch $s master &&
# git checkout $s
# }