#Source: http://stackoverflow.com/questions/7342597/how-do-you-comment-out-code-in-powershell
#Source: https://social.technet.microsoft.com/Forums/SECURITY/en-US/bf986cda-e3f0-4744-9a1a-b20ba71764a1/how-do-i-create-a-directory-in-powershell?forum=ITCG
$Title = ".:Backup My Registry - Developed by ComputerCrash0:."
Write-Host "========================================================"                                             
Write-Host " ____   ____    __ __  _ __ __ ____  ___ ___ __ __ "
Write-Host "|    \ /    |  /  ]  |/ ]  |  |    \|   |   |  |  |"
Write-Host "|  o  )  o  | /  /|  ' /|  |  |  o  ) _   _ |  |  |"
Write-Host "|     |     |/  / |    \|  |  |   _/|  \_/  |  ~  |"
Write-Host "|  O  |  _  /   \_|     \  :  |  |  |   |   |___, |"
Write-Host "|     |  |  \     |  .  |     |  |  |   |   |     |"
Write-Host "|_____|__|__|\____|__|\_|\__,_|__|  |___|___|____/ "
Write-Host " ____    ___  ____ ____ ___________ ____  __ __    "
Write-Host "|    \  /  _]/    |    / ___/      |    \|  |  |   "
Write-Host "|  D  )/  [_|   __||  (   \_|      |  D  )  |  |   "
Write-Host "|    /|    _]  |  ||  |\__  |_|  |_|    /|  ~  |   "
Write-Host "|    \|   [_|  |_ ||  |/  \ | |  | |    \|___, |   "
Write-Host "|  .  \     |     ||  |\    | |  | |  .  \     |   "
Write-Host "|__|\_|_____|___,_|____|\___| |__| |__|\_|____/    "
Write-Host "========================================================"                                                




function Show-Menu
{
    param(
    [String]$Title = 'My Menu'
    )
    #cls
    #Write-Host "=============$Title=========="
    
    Write-Host "1 - Backup Registry"
    Write-Host "2 - Restore Backup"
    Write-Host "3 - Exit"
}


do
{
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input)
     {
           '1' {
                New-Item -ItemType directory -Path C:\BackupRegistry
                # To back reg file REG EXPORT HKLM HKLM_Bak.reg
                Write-Host "Backing up Local Machine"
                REG EXPORT HKLM HKLM_Backup.reg 
                Write-Host "Local Machine registy backup complete"
                #cls
                Write-Host "Backing up Classes Root"
                REG EXPORT HKCR HKCR_Backup.reg
                Write-Host "Classes Root registy backup complete"
                #cls
                Write-Host "Backing up Current User"
                REG EXPORT HKCU HKCU_Backup.reg
                Write-Host "Current User registry backup complete"
                #cls
                Write-Host "Backing up Users"
                REG EXPORT HKU HKU_Backup.reg
                Write-Host "Users registry backup complete"
                #cls
                Write-Host "Backing up Current Config"
                REG EXPORT HKCC HKCC_Backup.reg
                vWrite-Host "Current Config registry backup complete"
                #cls
                #Below is responsible for moving the backup reg files from C:\Users\"User-Name" to C:\BackupRegistry
                Write-Host "Backup location created C:\BackupRegistry"
                #cls
                Write-Host "Moving local machine to C:\BackupRegistry"
                Move-Item "C:\Users\$env:USERNAME\HKLM_Backup.reg" "C:\BackupRegistry"
                Move-Item "C:\Users\$env:USERNAME\HKCR_Backup.reg" "C:\BackupRegistry"
                Write-Host "Moving classes root to C:\BackupRegistry"
                Move-Item "C:\Users\$env:USERNAME\HKCU_Backup.reg" "C:\BackupRegistry"
                Write-Host "Moving current user to C:\BackupRegistry"
                Move-Item "C:\Users\$env:USERNAME\HHKU_Backup.reg" "C:\BackupRegistry"
                Write-Host "Moving users to C:\BackupRegistry"
                Move-Item "C:\Users\$env:USERNAME\HKCC_Backup.reg" "C:\BackupRegistry"
                Write-Host "Moving Current Config to C:\BackupRegistry"
                cls 
           } '2' {
                cls
                Write-Host "Restoring Local Machine"
                REG IMPORT HKLM_Backup.reg
                Write-Host "Local Machine restored"
                
                Write-Host "Restoring Classes Root"
                REG IMPORT HKCR_Backup.reg
                Write-Host "Classes Root restored"
                
                Write-Host "Restoring Current User"
                REG IMPORT HKCU_Backup.reg
                Write-Host "Current User restored"
                
                Write-Host "Restoring Users"
                REG IMPORT HKU_Backup.reg
                Write-Host "Users restored"
                
                Write-Host "Restoring Current Config"
                REG IMPORT HKCC_Backup.reg
                Write-Host "current Config restored"
                
           } '3' {
                cls
                Exit
           }
     }
}
until ($input -eq 'q')