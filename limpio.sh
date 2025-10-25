#!/bin/bash



personalizacion=("")

programas=("")

function verificarInstaldos(){

	local dependencias=("$@")

	echo "Esto es lo que contiene el array $dependencias"

	echo "Entre a la funcion"

	for dep in "${dependencias[@]}"; do
		if which "$dep" >/dev/null 2>&1; then
			echo "$dep ya está instalado"
		else
			echo "$dep valio madres"
		fi 
	done


}

#function dependencias(){



#}


function main(){

	dependencias=("flatpak", "wget", "curl", "git")

	verificarInstaldos "${dependencias[@]}"

}


main