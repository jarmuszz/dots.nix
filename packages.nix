{ environment, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];

  environment.systemPackages = with pkgs; [
    adbfs-rootless
    android-tools
    anki
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.en-science
    aspellDicts.pl
    brightnessctl
    cabal-install
    calc
    clang
    cmake
    coursier
    dconf
    deadbeef
    discord
    docker
    docker-compose
    dwarf-fortress
    elementary-xfce-icon-theme
    ffmpeg
    file
    firefox
    foot
    gammastep
    gcc
    gcc-arm-embedded-10
    ghc
    gimp
    git
    gnumake
    go-font
    greybird
    grim
    helvum
    home-manager
    htop
    hunspell
    hunspellDicts.pl_PL
    inkscape-with-extensions
    jdk
    jetbrains.idea-community
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
    keepassxc
    libnotify
    libreoffice-qt
    lm_sensors
    mpc
    mpdevil
    msgpack-tools
    neofetch
    nixfmt
    nodejs
    obsidian
    pfetch
    pipewire
    plasma5Packages.kdeconnect-kde
    pwvucontrol
    python3
    python312Packages.dbus-python
    qemu
    racket
    rofi
    sbt
    scala-cli
    seatd
    signal-desktop
    slurp
    smartmontools
    soulseekqt
    sshfs
    swappy
    swaybg
    swayidle
    swaylock
    swaynotificationcenter
    sxiv
    syncthing
    texlive.combined.scheme-medium
    unzip
    usbutils
    virtio-win
    visualvm
    vlc
    wayfire
    wayfirePlugins.wayfire-shadows
    wayfirePlugins.wwp-switcher
    wl-clipboard
    xfce.mousepad
    xfce.thunar
    xfce.thunar-volman
    xsane
    xwaylandvideobridge
    zathura
    zip
    zlib
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    (nerdfonts.override { fonts = [ "MPlus" ]; })
  ];
}
