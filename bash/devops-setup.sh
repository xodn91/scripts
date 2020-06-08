# Install Homebrew
curl -s -L https://raw.githubusercontent.com/alfonsoh/scripts/master/bash/install-brew.sh | bash
# Intall wget
brew install wget
# Install Cask
brew install caskroom/cask/brew-cask
# Install docker toolbox
brew cask install docker-toolbox
#Install Python3
brew install python3
# Pull down pip install script
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
# Install pip
python get-pip.py
# Install kubernates
brew install kubectl
# Cask Install VM
brew cask install virtualbox
# Cask Install metasploit & nmap
brew cask install metasploit

