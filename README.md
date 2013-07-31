#dotfilesを設定  
    git clone https://github.com/petitviolet/dotfiles.git
    cd dotfiles
    sh _install.sh
    git clone http://github.com/gmarik/vundle.git ~/.vim/vundle
    vimで:BundleInstall、:NeoBundleInstall
これで、$HOMEディレクトリに.vimrc, .zshrc, .zshrc.alias, .tmux.confが作成される。  
それぞれdotfiles/の\_vimrc, \_zshrc, \_zshrc.alias, \_tmux.confのシンボリックリンクとなっている。

  

