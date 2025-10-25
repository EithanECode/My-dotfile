#!/bin/bash



personalizacion=("")

programas=("")

function instalarPacman(){

	local instalacion=("$@")

	for prog in "${instalacion[@]}";do

		sudo pacman -S --noconfirm --needed $prog
		 
}

function verificarInstaldos(){

	local verificar=("$@")

	for dep in "${verificar[@]}"; do
		if which "$dep" >/dev/null 2>&1; then
			echo "[✔] $dep ya está instalado"
		else
			echo "[✘] $dep no instalado "
		fi 
	done

}

#functionInstalar(){




#}

#function dependencias(){



#}


function main(){

	toilet -f smblock -F crop "Dependencias"

	dependencias=("flatpak" "wget" "curl" "git")

	verificarInstaldos "${dependencias[@]}"

}

main