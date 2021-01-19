# Dotfiles

## Instalación de yay

```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

## Utilidades básicas

| Software               | Utilidad                        |
| ---------------------- | ------------------------------- |
| pulseaudio             | audio                           |
| pavucontrol            | GUI para audio                  |
| unzip                  | descomprimir archivos zip       |
| volumeicon             | icono para controlar el volumen |
| cbatticon              | icono para controlar el volumen |
| udiskie & ntfs-3g      | montar usb                      |
| libnotify              | notificaciones                  |
| notification-daemon    | tema para notificaciones        |
| network-manager-applet | GUI para el network             |

```
sudo pacman -S pulseaudio pavucontrol unzip volumeicon udiskie ntfs-3g libnotify notification-daemon

#si tienes una laptop
sudo pacman -S cbatticon network-manager-applet
```

```
# Notificaciones
sudo nvim /usr/share/dbus-1/services/org.freedesktop.Notifications.service
# Pegar estas líneas
[D-BUS Service]
Name=org.freedesktop.Notifications
Exec=/usr/lib/notification-daemon-1.0/notification-daemon

# Prueba con:

notify-send "Hola mundo"
```

```
# Crear archivo ~/.xprofile para ejecutar antes de iniciar el qtile
touch ~/.xprofile

setxkbmap latam &
nm-applet &
udiskie -t &
volumeicon &
cbatticon &
```

## Fuentes, temas y GTK

| Software                    | Utilidad                               |
| --------------------------- | -------------------------------------- |
| picom                       | transparencia                          |
| ubuntu mono nerd font       | nerd font para iconos                  |
| lxappearance                | GUI para cambiar temas                 |
| feh                         | establecer fondos de pantalla          |
| nitrogen                    | GUI para establecer fondos de pantalla |
| Material-Black-Plum-Suru    | tema de iconos                         |
| xcb-util-cursor             | tema del cursor                        |
| lightdm-webkit2-greeter     | login screen                           |
| lightdm-webkit-theme-aether | tema para el login screen              |

```
sudo pacman -S picom lxappearance feh nitrogen xcb-util-cursor lightdm-webkit2-greeter
yay -S nerd-fonts-ubuntu-mono lightdm-webkit-theme-aether
```

```
# si deseas ejecutar picom antes de de iniciar qtile
agregar picom al .xprofile

~/.xprofile
picom &
```

### Instalar tema de iconos

```
cd Descargas/
unzip Material-Black-Plum-Suru.zip
rm Material-Black*.zip

sudo mv Material-Black-Blueberry-Suru /usr/share/icons
```

### Instalar tema del cursor

```
cd Descargas/
tar -xf Breeze.tar.gz
sudo mv Breeze /usr/share/icons
```

- [Iconos](https://www.gnome-look.org/p/1333360/)
- [Cursor](https://www.gnome-look.org/p/999927/)

### Instalar tema del lightdm

```
# /etc/lightdm/lightdm.conf
[Seat:*]
# ...
# Descomenta esta línea y pon este valor
greeter-session = lightdm-webkit2-greeter
# ...

# /etc/lightdm/lightdm-webkit2-greeter.conf
[greeter]
# ...
webkit_theme = lightdm-webkit-theme-aether
```

## Aplicaciones

| Software  | Utilidad                        |
| --------- | ------------------------------- |
| alacritty | terminal                        |
| firefox   | navegador                       |
| neovim    | editor de texto                 |
| thunar    | gestor de archivos              |
| ranger    | gestor de archivos por terminal |
| scrot     | tomar captura de pantalla       |
| redshift  | luz nocturna                    |
| rofi      | menú y navegación               |
| caprine   | messenger                       |
| playerctl | control de media-players        |
| vlc       | reproductor multimedia          |

```
sudo pacman -S alacritty firefox neovim thunar ranger scrot redshift rofi caprine playerctl vlc
```

## Terminal

| Software |     |
| -------- | --- |
| ccat     |     |
| tree     |     |
| htop     |     |

```
sudo pacman -S ccat tree htop
```
