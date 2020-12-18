dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

Download and install https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

wsl --set-default-version 2

Go to the MS Store (https://aka.ms/wslstore) and install Ubuntu

Update the settings in CS Code Integrated Terminal



#INSTALL PYTHON
    #install python 3 along with pip and ipython
    sudo apt update && upgrade
    sudo apt install python3 python3-pip ipython3

    #validate that it is installed by printing the version number
    python3 --version

#SETUP PYTHON MORE FLEXIBLY
    #We are going to use a tool called pyenv to support multiple different versions of Python.
    #Pyenv build Python from source, which means we need build dependencies installed on our machine to actually use pyenv.
    sudo apt-get update; sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

    #install Pyenv with the following command that will also include some additional tools that can be useful
    curl https://pyenv.run | bash

    """
    WARNING: seems you still have not added 'pyenv' to the load path.
    # Load pyenv automatically by adding
    # the following to ~/.bashrc:

    export PATH='/home/n4nite/.pyenv/bin:$PATH'
    eval '$(pyenv init -)'
    eval '$(pyenv virtualenv-init -)'
    """

    #next up we need to setup some bariables in our bashrc file. These allow pyenv to basically intercept
    #and put in the version of Pythoin we want to use at any point in time.
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc


    #On Ubuntu 20.04 there is a slight bug where Pyenv doesn't register the System version of Python. 
    #Run the following to fix this [ref: https://github.com/pyenv/pyenv/issues/1613#issuecomment-640195879]
    sudo ln -s /usr/bin/python3 /usr/bin/python

    #After that we need to restrat our terminal window.
    #validate that it is installed by printing the version number
    pyenv --version

    #We use the list option to see all of the different Python versions that are avalable to us.
    pyenv install --list

    #We can just show the versions between 3.6 and 3.8 as well
    pyenv install --list | grep " 3\.[678]"

    #Lets install an older version (e.g. 3.6.1). This will take a while becaue it is building python from source.
    pyenv install -v 3.6.1

    #Lets look into the directory where different python envirnments are installed
    ls ~/.pyenv/versions/

    #If you need to remove a version then we can just delete the folder for that version 
    rm -rf ~/.pyenv/versions/3.6.1 
        #or
    pyenv uninstall 3.6.1 

    #Lets use the bersion of Python that we installed
    pyenv global 3.6.1

    #Now type the below into the command line to confirm that you are using the expected version
    python -V
    Python 3.6.1 #output

    #Lets switch back to our system version
    pyenv global system

    #Now type the below into the command line to confirm that you are using the expected version
    python -V
    Python 3.8.5 #output

#VIRTUAL ENVIRONMENTS
    #create a virtual envirnment
    pyenv virtualenv 3.6.1 py-hello-world

    #set the local environment to match this
    pyenv local py-hello-world

    #If we had not configure eval "$(pyenv virtualenv-init -)" to run in our shell, we would need to manually activate/deactivate our Python versions with this:
    pyenv activate <environment_name>
    pyenv deactivate

#CREATE A NEW PYTHON HELLO WORLD PROJECT
    #create the project directory and cd into it
    mkdir -p ~/git/py-hello-world; cd ~/git/py-hello-world

    #create a hello world file
    touch hello-world.py

    #add a single line of python code that print out Hello World
    echo "print('Hello World')" > hello-world.py

    #run the file to see the result
    python hello-world.py

    #create a new python repository
    curl -u 'infornite:77940cc02de1e78bf8c8d43d1ce4965bafef6c35' https://api.github.com/user/repos -d '{"name":"py-hello-world"}'

    #Initialize git in our reporitory
    git init
    git add .
    git commit -m "Initial Commit"
    git branch -M main
    git remote add origin git@github.com:infornite/py-hello-world.git
    git push origin main

#INSTALL GIT
    #install git but note that this is likely unnecessary as its part of Ubuntu
    sudo apt update && upgrade
    sudo apt-get install git

    #validate that it is installed by printing the version number
    git --version

    #set some global variables (completely optional)
    git config --global user.name "Michael O'Sullivan"
    git config --global user.email "michael@infornite.com"

    #create an SSH key
    ssh-keygen -t ed25519 -C "michael@infornite.com"
        #--> Enter to create key in default location
        #--> Enter a random hash key or leave it blank

    #copy the key to your clipboard - run the below command and copy the second line e.g. ssh........
    ssh-agent sh -c 'ssh-add; ssh-add -L'

    #add the ssh key to your github profilr
    #Github --> Settings --> SSH & GPG Keys --> New SSH Key --> [Give it any name and paste in your key]


#INSTALL NODEJS
    #install Node Version Manager
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
    nvm -v #note that you need to cose and reopen the terminal for Node to work after the install

    #install a node version
    nvm install 14.15.1

    #clone and run my Node APP
    cd ~/git
    git clone git@github.com:infornite/graphql-api.git
    cd ~/git/graphql-api
    npm install
    ng serve

#INSTALL ANGULAR
    npm install -g @angular/cli

    #Note that when you create an angular project via the CLI you specify the Angular version. This is saved in the
    #package.json file. When you run or build that application it will use that angular specified version instead of
    #the base version that you have installed. For that reason there is no real need to worry about installing or 
    #managing different versions of the angular CLI.

    #clone and run my Angular APP
    cd ~/git
    git clone git@github.com:infornite/n4nite-ui.git
    cd n4nite-ui
    npm install
    ng serve