#!/bin/bash

# Verificar si Homebrew está instalado
if ! command -v brew &>/dev/null; then
    echo "Homebrew no está instalado. Instalándolo ahora..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew ya está instalado. Actualizando..."
    brew update
fi

# Función para instalar paquetes si no están instalados
install_package() {
    if brew list "$1" &>/dev/null; then
        echo "✅ $1 ya está instalado"
    else
        echo "🔹 Instalando $1..."
        brew install "$1"
    fi
}

# Función para instalar paquetes cask (apps con GUI)
install_cask() {
    if brew list --cask "$1" &>/dev/null; then
        echo "✅ $1 ya está instalado"
    else
        echo "🔹 Instalando $1..."
        brew install --cask "$1"
    fi
}

echo "⚙️ Instalando paquetes CLI..."
install_package azure-cli
#az extension add --name datafactory
install_package git
install_package gh
install_package jq
install_package wget
install_package curl
install_package fzf
install_package tree
install_package htop
install_package neovim
install_package tmux

echo "⚙️ Instalando herramientas de Azure y DevOps..."
install_package terraform
#install_package bicep Warning: No available formula with the name "bicep". Did you mean bic or ice?
install_package kubectl
brew install azure/kubelogin/kubelogin
install_package k9s
install_package helm
#install_package azure-functions-core-tools Warning: No available formula with the name "azure-functions-core-tools". Did you mean azure-storage-common-cpp?
#install_package packer Error: packer has been disabled because it will change its license to BUSL on the next release! It was disabled on 2024-09-27.
install_cask docker
install_package dive
install_package podman
install_package kubectx
install_package stern

echo "⚙️ Instalando Python y Ciencia de Datos..."
install_package python
install_package pyenv
install_package poetry

echo "⚙️ Instalando Node..."
install_package node

echo "⚙️ Instalando Editores..."
install_cask zed
install_cask visual-studio-code
install_cask lapce
install_cask sublime-text
Install_package helix
install_cask azure-data-studio

echo "⚙️ Instalando Tools..."
install_package  p7zip
install_cask kdiff3
install_cask warp
install_cask drawio
install_cask obsidian
install_cask postman
install_cask powershell

echo "⚙️ Instalando Dev Tools..."
install_package unixodbc

echo "⚙️ Instalando aplicaciones GUI..."
install_cask microsoft-edge
install_cask microsoft-teams
install_cask citrix-workspace



echo "✅ Instalación completada."
