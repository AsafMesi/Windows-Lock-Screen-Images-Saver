# Save Your Windows Spotlight Backgrounds Automatically!

Are you tired of manually saving the stunning images from your Windows lock screen? Want to automate the process and save time? Look no further! With this PowerShell script, you can automatically save your Windows Spotlight backgrounds and never miss out on a beautiful image again.

## How it Works

1. Creates a folder called `temp`.
2. Copies images with a file size greater than 1000 KB from `%LocalAppData%\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets` to `temp`.  
(This folder consists of the images that Windows Spotlight uses and gets updated every few days.)
3. Changes the file types to `.jpg`.
4. Moves each file with a resolution of 1920x1080 to your desired folder.
5. Deletes the `temp` folder.

## How to Use

1. Edit the paths to `$tempPath` and `$destinationPath` in the script to your preferred locations.
2. Open PowerShell as an administrator.
3. Navigate to the directory in which the script is located. For example, if the script is on your desktop, run `cd C:\Users\yourusername\Desktop`.
4. Run the script by typing `.\GetBackgrounds.ps1` and pressing enter.

## Notice

In order to run PowerShell scripts, you'll need to edit your execution policy. By default, your policy will be "Restricted," so you'll need to change it to "RemoteSigned." To check your execution policy, run `Get-ExecutionPolicy`. To change it, run `Set-ExecutionPolicy RemoteSigned`.

Now sit back, relax, and let the script do the hard work for you. No more manually saving your backgrounds and missing out on new images. Enjoy your beautiful Windows Spotlight backgrounds with ease!
