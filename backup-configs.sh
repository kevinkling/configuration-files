#!/bin/bash
# Script para copiar archivos de configuración desde sus ubicaciones originales al repositorio
# Uso: ./backup-configs.sh

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
BACKED_UP=0
NOT_FOUND=0

echo "=== Backup de archivos de configuración ==="
echo "Repositorio: $REPO_ROOT"
echo ""

# Array de archivos: "origen:destino"
CONFIG_FILES=(
    # Bash/Zsh
    "$HOME/.bashrc:linux/bashrc"
    "$HOME/.zshrc:linux/zshrc"
    "$HOME/.profile:linux/profile"
    
    # Alacritty
    "$HOME/.config/alacritty/alacritty.yml:linux/alacritty.yml"
    
    # Kitty
    "$HOME/.config/kitty/kitty.conf:linux/kitty.conf"
    
    # Neovim
    "$HOME/.config/nvim/init.vim:linux/init.vim"
    
    # Tmux
    "$HOME/.tmux.conf:linux/tmux.conf"
    
    # Git
    "$HOME/.gitconfig:linux/gitconfig"
)

for entry in "${CONFIG_FILES[@]}"; do
    SOURCE="${entry%%:*}"
    DEST="${entry##*:}"
    DEST_PATH="$REPO_ROOT/$DEST"
    
    if [ -f "$SOURCE" ]; then
        # Crear directorio destino si no existe
        DEST_DIR=$(dirname "$DEST_PATH")
        mkdir -p "$DEST_DIR"
        
        cp "$SOURCE" "$DEST_PATH"
        echo "[✓] Copiado: $SOURCE"
        echo "    -> $DEST_PATH"
        ((BACKED_UP++))
    else
        echo "[✗] No encontrado: $SOURCE"
        ((NOT_FOUND++))
    fi
done

echo ""
echo "=== Resumen ==="
echo "Archivos respaldados: $BACKED_UP"
echo "Archivos no encontrados: $NOT_FOUND"
echo ""
echo "Backup completado."
