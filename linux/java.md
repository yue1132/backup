1、ubuntu 安装JDK  
    通过ppa安装：
	sudo add-apt-repository ppa:webupd8team/java
	sudo apt-get update
	sudo apt-get install oracle-java7-installer
    设置默认JDK：
	sudo update-java-alternatives -s java-7-oracle
	
2、ubuntu安装eclipse:
 	将ubuntu添加到应用程序的方法：
		sudo vim /usr/share/applications/eclipse.desktop
        在eclipse.desktop中添加如下内容：
		[Desktop Entry]
		Name=Eclipse
		Comment=Eclipse 3.42 IDE
		Exec=/usr/java/eclipse/eclipse #这里改成你的eclipse的安装位置
		Icon=/usr/java/eclipse/icon.xpm
		Terminal=false
		Type=Application
		Categories=Application;Development;		
	实现终端打开eclipse:
	(将eclipse执行文件符号链接到/usr/local/bin)
		cd /usr/local/bin
		sudo ln -s /usr/java/eclispe/eclipse
		
