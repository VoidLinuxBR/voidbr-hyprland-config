#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Inicia o Hyprland automaticamente no TTY1
if [ -z "$WAYLAND_DISPLAY" ] &&
  [ "${XDG_VTNR:-0}" -eq 1 ]; then

  # Auto-launch Hyprland on TTY1 login
  if [ "$(tty)" = "/dev/tty1" ]; then
    echo
    read -p "Start Hyprland? [y]es or [n]o: " -n 1 -r

    if [[ $REPLY =~ ^[Yy]$ ]]; then
      # Variáveis para garantir que aplicativos GTK/Qt respeitem o tema e o Wayland
      export QT_QPA_PLATFORM=wayland
      export MOZ_ENABLE_WAYLAND=1

      #exec dbus-run-session Hyperland
      exec start-hyprland
    fi
  fi
fi
