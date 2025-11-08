#!/bin/bash
# Script para restaurar archivos de configuración desde el repositorio a sus ubicaciones originales
# Uso: ./restore-configs.sh
# ADVERTENCIA: Este script sobreescribirá los archivos existentes

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
RESTORED=0
NOT_FOUND=0

echo "=== Restauración de archivos de configuración ==="
echo "Repositorio: $REPO_ROOT"
echo ""

# Array de archivos: "archivo_en_repo:destino_original"
CONFIG_FILES=(
    # Bash/Zsh
    "linux/bashrc:$HOME/.bashrc"
    "linux/zshrc:$HOME/.zshrc"
    "linux/profile:$HOME/.profile"
    
    # Alacritty
    "linux/alacritty.yml:$HOME/.config/alacritty/alacritty.yml"
    
    # Kitty
    "linux/kitty.conf:$HOME/.config/kitty/kitty.conf"
    
    # Neovim
    "linux/init.vim:$HOME/.config/nvim/init.vim"
    
    # Tmux
    "linux/tmux.conf:$HOME/.tmux.conf"
    
    # Git
    "linux/gitconfig:$HOME/.gitconfig"
)

for entry in "${CONFIG_FILES[@]}"; do
    SOURCE="${entry%%:*}"
    DEST="${entry##*:}"
    SOURCE_PATH="$REPO_ROOT/$SOURCE"
    
    if [ -f "$SOURCE_PATH" ]; then
        # Crear directorio destino si no existe
        DEST_DIR=$(dirname "$DEST")
        mkdir -p "$DEST_DIR"
        
        cp "$SOURCE_PATH" "$DEST"
        echo "[✓] Restaurado: $SOURCE"
        echo "    -> $DEST"
        ((RESTORED++))
    else
        echo "[✗] No encontrado en repo: $SOURCE"
        ((NOT_FOUND++))
    fi
done

echo ""
echo "=== Resumen ==="
echo "Archivos restaurados: $RESTORED"
echo "Archivos no encontrados: $NOT_FOUND"
echo ""
echo "Restauración completada."
