#!/bin/bash

plugis_zsh=("sintaxis" "y el otro xd") # Agregar esto

personalizacion=("zsh" "lsd" "bat" "oh-my-zsh" )

programas_steam=("kitty")

function personalizacionKitty(){

	echo "Instalando personalización de la terminal Kitty..."

	cd $HOME/script_autoinstall
	
	cp -r "source/kitty" "$HOME/.config/kitty" 

}

function personalizacionZsh(){

	echo "Instalando personalizacion de Zsh..."

	cd $HOME/script_autoinstall

	cp "source/zsh/cachyos-config.zsh" "/usr/share/cachyos-zsh-config/cachyos-config.zsh"

}

function instalarConPacman(){

	echo "instalando $1..."

	sudo pacman -S --noconfirm --needed $1
		 
}

function instalarConParu(){

	echo "Instalando $1..."

	paru -S --noconfirm --skipreview --needed $1 

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
				instalarConPacman $dep
				fi
		fi 
	done

}

function main(){

	dependencias=("flatpak" "wget" "curl" "git" "jdk21-openjdk" "base-devel" "paru" "node" "snap")

	toilet -f smblock -F crop "Dependencias"

	verificarInstalados "${dependencias[@]}"

	toilet -f smblock -F crop "Personalización"

	personalizacionKitty

}

main