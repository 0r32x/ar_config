export XKB_DEFAULT_LAYOUT=us
export XKB_DEFAULT_OPTIONS=grp:alt_shift_toggle,ctrl:swapcaps

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  export GDK_BACKEND=wayland
  export CLUTTER_BACKEND=wayland
  export QT_QPA_PLATFORM=wayland-egl
  export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
  export ECORE_EVAS_ENGINE=wayland_egl
  export ELM_ENGINE=wayland_egl
  export SDL_VIDEODRIVER=wayland
  export _JAVA_AWT_WM_NONREPARENTING=1
  export GTK_IM_MODULE=fcitx
  export QT_IM_MODULE=fcitx
  export XMODIFIERS=@im=fcitx
  exec sway
fi

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty2 ]]; then
  exec startx
fi
