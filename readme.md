# Configuration Files

Repositorio de archivos de configuración para no tener que configurar todo desde cero después de un reseteo.

## Estructura

```
configuration-files/
├── windows/          # Configuraciones de Windows
├── linux/            # Configuraciones de Linux
├── backup-configs.ps1
├── restore-configs.ps1
├── backup-configs.sh
└── restore-configs.sh
```

## Uso rápido

### Windows (PowerShell)

```powershell
# Hacer backup de tus configuraciones actuales al repo
.\backup-configs.ps1

# Restaurar configuraciones desde el repo
.\restore-configs.ps1
```

### Linux (Bash)

```bash
# Hacer ejecutables los scripts (solo la primera vez)
chmod +x backup-configs.sh restore-configs.sh

# Hacer backup de tus configuraciones actuales al repo
./backup-configs.sh

# Restaurar configuraciones desde el repo
./restore-configs.sh
```

## Archivos incluidos

### Windows
- PowerShell Profile
- Windows Terminal settings

### Linux
- Bash (.bashrc)
- Zsh (.zshrc)
- Alacritty
- Kitty
- Neovim (init.vim)
- Tmux
- Git config

---

*Nota: ~ es lo mismo que /home/kevin en Linux, o sea la variable $HOME*

### Rutas de configuración de USER:

- I3: ~/.config/i3/config
- Bash: ~/.basrc
- Zsh: ~/.zshrc
- OHMYZSH: ~/.ohmyzsh/oh-my=zsh.sh  ---  PowerLevel10K: .p10k.zsh
- NeoVim: ~/.config/nvim/init.vim
- Vim: ~/.vimrc
- Rofi: ~/.config/rofi/config.rasi
- SSH: ~/.ssh/config
- TMUX: ~/.tmux.conf
- Conky: ~/.conkyrc

#### Terminal
- Kitty: ~/.config/kitty/kitty.conf
- Hyper: ~/.hyper.js
- Alacritty:  ~/.config/alacritty/alacritty.yml
- Terminator: ~/.config/terminator/config

### Archivo de configuracion de ROOT:
...

### Instalacion de NeoVim
1. Instalar neovin
2. Si no existem, crear carpeta en ~/.config/nvim/(aqui clonar el init.vim)
3. instalar Plug (gestor de plugins)
4. luego ejecutar :PlugInstall
