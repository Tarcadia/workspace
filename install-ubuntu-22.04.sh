PSD=$(pwd)"/"$(dirname $0)
if ! [ -d $PSD/bk ]; then
	mkdir $PSD/bk
fi

# install preferred softs.
echo "Installing cowsay, firtune-mod, sl."
sudo apt-get -qq install cowsay fortune-mod sl > /dev/null

# install zsh and theme
echo "Installing zsh, theme and supports."
sudo apt-get -qq install zsh command-not-found > /dev/null
sudo chsh -s $(which zsh)

if [ -d ~/.zsh ]; then
	echo " - Backing up zsh confilg folder."
	cp -r ~/.zsh $PSD/bk/
else
	mkdir ~/.zsh
fi
if [ -e ~/.zsh ]; then
	echo " - Backing up zshrc."
	cp -r ~/.zshrc $PSD/bk/
fi

echo " - Installing theme."
sudo apt-get -qq install lolcat figlet > /dev/null
cp $PSD/zsh/oh-my-zsh/lib/completion.zsh ~/.zsh/completion.zsh
cp $PSD/zsh/oh-my-zsh/lib/git.zsh ~/.zsh/git.zsh
cp $PSD/zsh/theme/tarcadia.zsh-theme ~/.zsh/tarcadia.zsh-theme
cp $PSD/zsh/zshrc ~/.zshrc

# install gitconfig and screenrc
echo "Installing gitconfig."
cp $PSD/git/gitconfig ~/.gitconfig
echo "Installing screenrc."
cp $PSD/screen/screenrc ~/.screenrc

# install MOTD
sudo apt-get -qq install screenfetch > /dev/null
echo "Installing MOTD."
echo " - Disabling unexpected MOTD."
sudo chmod a-x /etc/update-motd.d/10-help-text
sudo chmod a-x /etc/update-motd.d/50-motd-news
sudo chmod a-x /etc/update-motd.d/50-landscape-sysinfo
sudo chmod a-x /etc/update-motd.d/80-livepatch
echo " - Adding MOTD."
sudo cp $PSD/motd/motd /etc/update-motd.d/50-screenfetch-sysinfo
sudo chmod a+x /etc/update-motd.d/50-screenfetch-sysinfo
