dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

Download and install https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

wsl --set-default-version 2

Go to the MS Store (https://aka.ms/wslstore) and install Ubuntu

Update the settings in CS Code Integrated Terminal


PYTHON
sudo apt update && upgrade
sudo apt install python3 python3-pip ipython3


git config --global user.name "Michae O'Sullivan"
git config --global user.email "michael@infornite.com"








mkdir -p ~/git/laptop-setup ; cd ~/git/laptop-setup

touch commands.bash

ssh-keygen -t ed25519 -C "michael@infornite.com"
 --> Enter to create key in default location
 --> Enter a random hash key or leave it blank

Remember the part thats says >> Your public key has been saved in /home/n4nite/.ssh/id_ed25519.pub

ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICg2TVl1a3pfC3eRBU4fpmvFLK3kKDbkea1rsWM9f8Mn michael@infornite.com


git config --global credential.helper store
git init
git add .
git commit -m "Initial Commit"
git branch -M main
curl -u 'infornite:977a58ebb8cea00646bc95c57ba8935111db8c7c' https://api.github.com/user/repos -d '{"name":"laptop-setup"}'
git remote add origin git@github.com:infornite/laptop-setup.git

curl -u 'infornite' https://api.github.com/user/repos -d '{"name":"laptop-setup"}'


977a58ebb8cea00646bc95c57ba8935111db8c7c