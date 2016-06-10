vim 安装插件：
	安装Vundle管理vim插件,项目托管地址：https://github.com/gmarik/vundle.
特色在于使用git来管理插件，更新方便，支持搜索，意见更新，从此只要一个vimrc走天下。
	在vimrcfenian中添加如下内容来启用vundle管理vim插件的功能: 
	vimrc文件中添加如下的内容来启用vundle管理vim插件的功能：
		set rtp+=$VIM/vimfiles/bundle/vundle/  
		call vundle#rc('$VIM/vimfiles/bundle/')  
		Bundle 'gmarik/vundle'
	如果为linux系统可以如下添加：
	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc()
	Bundle 'gmarik/vundle'
	
安装教程：http://blog.csdn.net/jasonding1354/article/details/45368593
插件推荐：https://linux.cn/article-7424-1.html


vim 安装YouCompleteMe插件报错：
YouCompleteMe unavailable: requires Vim compiled with Python 2.x support

解决办法：查看 vim --version | grep python 中显示 -python -python3
则表示vim不支持python.ubuntu 解项目地址决办法:sudo apt-get install vim-gnome-py2.
