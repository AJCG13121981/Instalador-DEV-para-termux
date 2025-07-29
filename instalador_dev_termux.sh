#!/data/data/com.termux/files/usr/bin/bash

echo "=== COMPROBANDO ESTADO DEL SISTEMA ==="

# Verificar existencia de archivos de bloqueo (aunque en Termux no se usan dpkg locks típicos)
if [ -f /var/lib/dpkg/lock ] || [ -f /var/lib/dpkg/lock-frontend ] || [ -f /var/cache/apt/archives/lock ]; then
  echo "❌ Se detectó bloqueo de dpkg o apt."
  read -p "¿Quieres intentar eliminar los bloqueos automáticamente? (s/n): " respuesta
  if [[ "$respuesta" == "s" || "$respuesta" == "S" ]]; then
    echo "🔓 Eliminando locks..."
    rm -f /var/lib/dpkg/lock
    rm -f /var/lib/dpkg/lock-frontend
    rm -f /var/cache/apt/archives/lock
    dpkg --configure -a
    echo "✅ Locks eliminados. Continuando..."
  else
    echo "🛑 Abortando instalación. Ejecuta manualmente: dpkg --configure -a"
    exit 1
  fi
fi

echo "=== ACTUALIZANDO SISTEMA ==="
pkg update -y && pkg upgrade -y

echo "=== INSTALANDO HERRAMIENTAS BÁSICAS DE DESARROLLO ==="
pkg install -y git openjdk python python-pip curl wget clang nodejs npm

echo "=== INSTALANDO HERRAMIENTAS COMPLEMENTARIAS ==="
pkg install -y unzip tar net-tools lsof htop tmux zsh jq gnupg bat neofetch nmap

echo "=== MOSTRANDO VERSIONES DE LAS HERRAMIENTAS INSTALADAS ==="
git --version
java -version
python --version
pip --version
curl --version
wget --version
clang --version
node -v
npm -v
unzip -v
tar --version
ifconfig --version 2>/dev/null || echo "ifconfig no disponible"
lsof -v
htop --version
tmux -V
zsh --version
jq --version
gpg --version
batcat --version
neofetch --version
nmap --version

echo "=== INSTALACIÓN COMPLETADA ==="
echo "✅ Script cargado correctamente"