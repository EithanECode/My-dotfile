#!/bin/bash

personalizacion=("")

programas=("")

function instalarPacman(){

	echo "instalando $1..."

	sudo pacman -S --noconfirm --needed $1
		 
}

function InstalarParu(){

	echo "Instalando Paru..."
	
	cd #/

	git clone https://github.com/Morganamilo/paru.git

	cd paru

	makepkg -si

	cd

	rm -rf paru


}

function InstalarNode(){

	echo "Instalando node..."

	cd

	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

	\. "$HOME/.nvm/nvm.sh"

	nvm install 22

}

function instalarSnap(){

	echo "Instalando snap..."

	cd

	git clone https://aur.archlinux.org/snapd.git
	
	cd snapd
	
	makepkg -si
	
	sudo systemctl enable --now snapd.socket
    
	sudo systemctl enable --now snapd.apparmor.service	

	cd 

	rm -rf snapd

}

function verificarInstalados(){

	local verificar=("$@")

	for dep in "${verificar[@]}"; do
		if which "$dep" >/dev/null 2>&1 || pacman -Q "$dep" >/dev/null 2>&1 ; then
			echo "[✔] $dep ya está instalado"
		else
			echo "[✘] $dep no instalado"
			if [ "$dep" = "paru" ]; then
				InstalarParu
			elif [ "$dep" = "node" ]; then
				instalarNode
			elif [ "$dep" = "snap" ]; then
				instalarSnap
			else
				instalarPacman $dep
				fi
		fi 
	done

}

function main(){

	toilet -f smblock -F crop "Dependencias"

	dependencias=("flatpak" "wget" "curl" "git" "jdk21-openjdk" "base-devel" "paru" "node" "snap")

	verificarInstalados "${dependencias[@]}"

}

main