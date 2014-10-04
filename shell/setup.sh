#set -e 
set -x

# neobundle
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc

ln -s ~/dotfiles/vim/.vimrc ~/.vimrc

mkdir ~/.vim/colors
ln -s ~/dotfiles/vim/molokai.vim ~/.vim/colors/molokai.vim


mkdir -p ~/.vim/dictionary
php dict.php | sort > ~/.vim/dictionary/php.dict

source ~/.vimrc 


# link
ln -s ~/dotfile/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# zsh
zsh --version
if [ $? -gt 0 ]; then
    sudo yum -y install zsh
    sudo chsh
fi
