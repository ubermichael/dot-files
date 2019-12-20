# -*- ruby -*-

# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# install the packages in this brew file:
# `brew bundle install`

# Install applications globally.
cask_args appdir: "/Applications", "no-quarantine": true

# brew taps.
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-versions"
tap "homebrew/core"
tap "homebrew/services"

# other taps
tap "TimidRobot/tap"

# Applications to install.
cask "atom"
cask "db-browser-for-sqlite"
cask "emacs"
cask "firefox"
cask "gephi"
cask "github"
cask "go2shell"
cask "google-backup-and-sync"
cask "google-chrome"
cask "handbrake"
cask "intellij-idea"
cask "iterm2"
cask "java6"
cask "java"
cask "libreoffice"
cask "microsoft-remote-desktop-beta"
cask "mpv"
cask "mysqlworkbench"
cask "nvalt"
cask "openrefine"
cask "oxygen-xml-editor"
cask "phpstorm"
cask "postman"
cask "pycharm"
cask "shiftit"
cask "skype"
cask "slack"
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
cask "webstorm"
cask "whatsapp"
cask "xscreensaver"

# ordered packages
brew "php@7.2"
brew "deployer", 'ignore-dependencies': true # must be after php.
brew "composer", 'ignore-dependencies': true # must be after php.
brew "php-cs-fixer"

brew "ant@1.9", link: true
brew "autoconf"
brew "bagit"
brew "bash-completion"
brew "bat"
brew "cmc"
brew "colordiff"
brew "diff-so-fancy"
brew "ffmpeg"
brew "gawk"
brew "gettext", link: true
brew "git"
brew "graphviz"
brew "httpd"
brew "hub"
brew "icu4c"
brew "imagemagick"
brew "lame"
brew "lynx"
brew "maven"
brew "mysql", restart_service: true
brew "ncftp"
brew "node"
brew "npm"
brew "openssl"
brew "pcre"
brew "pipenv"
brew "pkg-config"
brew "pv"
brew "python"
brew "readline"
brew "rename"
brew "ruby"
brew "saxon"
brew "sqlite"
brew "ssh-copy-id"
brew "telnet"
brew "tidy-html5"
brew "unixodbc"
brew "wget"
brew "yarn"

# pip3 install Sphinx
# npm install --global bower yarn
# curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
# chmod a+x /usr/local/bin/symfony
