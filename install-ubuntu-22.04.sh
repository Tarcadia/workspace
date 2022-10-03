PSD=$(pwd)"/"$(dirname $0)

sudo apt install zsh command-not-found
sudo chsh -s $(which zsh)

sudo apt install screenfetch lolcat figlet cowsay fortune-mod sl

if [ -d ~/.zsh ]; then
	mkdir ~/.zsh
fi
cp $PSD/zsh/oh-my-zsh/lib/completion.zsh ~/.zsh/completion.zsh
cp $PSD/zsh/oh-my-zsh/lib/git.zsh ~/.zsh/git.zsh
cp $PSD/zsh/theme/tarcadia.zsh-theme ~/.zsh/tarcadia.zsh-theme
cp $PSD/zsh/zshrc ~/.zshrc

cp $PSD/git/gitconfig ~/.gitconfig
cp $PSD/screen/screenrc ~/.screenrc

sudo chmod a-x /etc/update-motd.d/10-help-text
sudo chmod a-x /etc/update-motd.d/50-motd-news
sudo chmod a-x /etc/update-motd.d/50-landscape-sysinfo
sudo chmod a-x /etc/update-motd.d/80-livepatch
sudo cp $PSD/motd/motd /etc/update-motd.d/50-screenfetch-sysinfo
