# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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

