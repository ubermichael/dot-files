# -*- ruby -*-

# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# install the packages in this brew file:
# `brew bundle install`

# Install applications globally.
cask_args appdir: "/Applications", "no-quarantine": true

# Useful taps.
tap "caskroom/cask"
tap "homebrew/core"
tap "homebrew/services"

# Applications to install.
cask "atom"
cask "bbedit"
cask "db-browser-for-sqlite"
cask "clamxav"
cask "emacs"
cask "firefox"
cask "gephi"
cask "go2shell"
cask "google-chrome"
cask "handbrake"
# cask "iterm2"
cask "libreoffice"
cask "mpv"
cask "mysqlworkbench"
cask "netbeans"
cask "oxygen-xml-editor"
cask "phpstorm"
cask "postman"
cask "shiftit"
cask "sizzlingkeys"
cask "skype"
cask "smcfancontrol"
cask "sourcetree"
cask "spotify"
cask "transmission"
cask "transmission-remote-gui"
cask "vagrant"
cask "vienna"
cask "virtualbox"
cask "virtualbox-extension-pack"
cask "vlc"
cask "sqlitebrowser"

# packages.
brew "ant@1.9", link: true
brew "autoconf"
brew "bash-completion"
brew "bat"
brew "bagit"
brew "bfg"
brew "composer"
brew "diff-so-fancy"
brew "ffmpeg"
brew "gawk"
brew "gettext", link: true
brew "git"
brew "httpd"
brew "icu4c"
brew "imagemagick"
# jing-trang never works.
# brew "jing-trang"
brew "lame"
brew "lynx"
brew "maven"
brew "mysql@5.7", restart_service: true, link: true, conflicts_with: ["mysql"]
brew "ncftp"
brew "node"
brew "npm"
brew "openssl"
brew "pandoc"
brew "pcre"

brew "php@7.2", restart_service: false, link: true
brew "php@5.6", restart_service: false, link: false
brew "deployer" # must be after php.

brew "pkg-config"
brew "pv"
brew "python"
brew "readline"
brew "saxon"
brew "sqlite"
brew "ssh-copy-id"
brew "tidy-html5"
brew "wget"

# pip3 install Sphinx
# npm install --global bower yarn
# curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
# chmod a+x /usr/local/bin/symfony
