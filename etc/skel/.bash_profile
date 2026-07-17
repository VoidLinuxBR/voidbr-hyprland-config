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
    read -rp "Start Hyprland? [Y/n]: " REPLY
    [[ ${REPLY:-Y} =~ ^[Yy]$ ]] && {
      export QT_QPA_PLATFORM=wayland
      export MOZ_ENABLE_WAYLAND=1

      start-hyprland
    }
  fi
fi


