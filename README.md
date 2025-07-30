<<<<<<< HEAD
# Instalador-DEV-para-termux
=======
# 🛠️ Instalador DEV para Termux
Este script instala herramientas de desarrollo en Termux sin necesidad de sudo ni root.

## Requisitos previos
pkg update && pkg upgrade -y
pkg install git curl -y

## Clonar el repositorio
git clone git@github.com:AJCG13121981/Instalador-DEV-para-termux.git
cd Instalador-DEV-para-termux/instalador_dev_termux

## Dar permisos y ejecutar el instalador
chmod +x instalador_dev_termux.sh
./instalador_dev_termux.sh

## Verificar herramientas instaladas
chmod +x verificar_instalacion.sh
./verificar_instalacion.sh

## Estructura recomendada
TERMUXPROYECT/
└── instalador_dev_termux/
    ├── instalador_dev_termux.sh
    └── verificar_instalacion.sh

## Herramientas instaladas
Git, Java (openjdk), Python3, pip, curl, wget, clang, Node.js, npm, unzip, tar, net-tools, htop, lsof, tmux, zsh, jq, gnupg, bat (batcat), neofetch, nmap

## Notas
Edita en Acode si usas carpeta compartida. Ideal para Termux sin root. Usa claves SSH para git push sin errores.

## Autor
Ángel Cumbreño – @AJCG13121981

## Licencia
MIT
>>>>>>> ad85fd8 (README.md)
