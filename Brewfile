# -*- ruby -*-

# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# install the packages in this brew file:
# `brew bundle install`

# Install applications globally.
cask_args appdir: "/Applications", "no-quarantine": true

# brew taps.
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-drivers"
tap "homebrew/cask-versions"
tap "homebrew/core"
tap "homebrew/services"

# other taps
tap "sass/sass"
tap "timidrobot/tap"

# Applications to install.
cask "atom"
cask "db-browser-for-sqlite"
cask "emacs"
cask "firefox"
cask "forticlient"
cask "github"
cask "go2shell"
cask "google-chrome"
cask "handbrake"
cask "iina"
cask "intellij-idea"
cask "iterm2"
cask "lastpass"
cask "logitech-control-center"
cask "microsoft-remote-desktop-beta"
cask "microsoft-teams"
cask "mpv"
cask "mysqlworkbench"
cask "nvalt"
cask "onedrive"
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
cask "zoomus"

# ordered packages
brew "php@7.4"
brew "deployer", 'ignore-dependencies': true # must be after php.
brew "composer", 'ignore-dependencies': true # must be after php.
brew "php-cs-fixer", 'ignore-dependencies': true # must be after php.

install ant@1.9
install bash-completion
install bat
install clamav
install coreutils
install ffmpeg
install git
install httpd
install httpie
install hub
install imagemagick
install jq
install lnav
install lynx
install mailhog
install mariadb
install maven
install moreutils
install pv
install rename
install ruby
install saxon
install shellcheck
install solr
install ssh-copy-id
install timidrobot/tap/cmc
install tree
install wget
install yarn

# pip3 install Sphinx
# npm install --global bower yarn
# curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
# chmod a+x /usr/local/bin/symfony
