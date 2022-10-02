PSD=$(pwd)"/"$(dirname $0)

sudo apt install zsh command-not-found
sudo chsh -s $(which zsh)

sudo apt install screenfetch lolcat figlet cowsay fortune-mod sl

mkdir ~/.zsh
cp $PSD/zsh/oh-my-zsh/lib/completion.zsh ~/.zsh/completion.zsh
cp $PSD/zsh/oh-my-zsh/lib/git.zsh ~/.zsh/git.zsh
cp $PSD/zsh/theme/tarcadia.zsh-theme ~/.zsh/tarcadia.zsh-theme
cp $PSD/zsh/zshrc ~/.zshrc

cp $PSD/git/gitconfig ~/.gitconfig
