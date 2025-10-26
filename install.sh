#Actualizar el sistema:
echo "Actualizando el sistema:"

sudo pacman -Syu

#Personalizacion
echo "**Instalando personalización**"

sudo pacman -S --noconfirm --needed zsh  lsd batcat kitty

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

##Instalando personalizacion de KItty

sudo cp -r  source/kitty $HOME/.config/kitty 

echo "Instaladas las personalzaciones de Kitty"

echo 'alias ls=lsd' >> $HOME/.zshrc
echo 'alias cat=bat' >> $HOME/.zshrc
source $HOME/.zshrc

##Falta instalar el powerlevel100k

#Instalando programas:

##Instalar snap
    
cd

sudo pacman -S --noconfigrm --needed git curl flatpak base-devel proton-vpn-gtk-app

echo "Instalando paru"

git clone https://aur.archlinux.org/paru.git

cd paru

makepkg -si

cd  

sudo rm -rf paru

curl -fsS https://dl.brave.com/install.sh | sh

flatpak install flathub org.telegram.desktop

flatpak install flathub com.spotify.Client

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

\. "$HOME/.nvm/nvm.sh"

nvm install 22

node -v # Should print "v22.18.0".

cd

# ZSH Y OH-MY-ZSH

echo "Instalando zsh..."


echo "Instalando oh-my-zsh"



echo "RECUERDA INSTALAR POWERLEVEL10K"

echo "Instalando lsd y batcat"

sudo pacman -S --noconfirm --needed lsd bat



# Algunos plugins necesarios para szh

git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Instalando ProtonVpn..."

sudo pacman -S --noconfirm --needed 

echo "Instalando Steam..."

sudo pacman -S steam htop fastfetch 










echo "Instalación finalizada."




