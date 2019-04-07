#
# ~/.profile
#

if [ -d "${HOME}/.bin" ]; then
    export PATH="${HOME}/.bin:${PATH}"
fi

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
