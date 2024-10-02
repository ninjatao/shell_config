# export PATH="$PATH"
export JFROG_TOKEN="AKCp8nH4XebZ3mZiBQjaFV3v1NPDvT93ybXayYdR8JBGb6iv4vkPAjfk74chbjz77FwPqce6K"
# workaround curl problem for CopilotChat
export XDG_RUNTIME_DIR=/data/data/com.termux/files/home/.tmp
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"
zstyle ':omz:update' mode auto      # update automatically without asking
HIST_STAMPS="mm/dd/yyyy"
plugins=(
    colored-man-pages
    extract
    fzf
    safe-paste
    z
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
alias vim=nvim

# switch color scheme based on time
COLOR_FILE_CURRENT=~/.termux/colors.properties
HOUR=$(date +%H)
if [ $HOUR -ge 6 ] && [ $HOUR -lt 18 ]; then
    COLOR_FILE=~/.termux/colors_day.properties
else
    COLOR_FILE=~/.termux/colors_night.properties
fi
if [ -f $COLOR_FILE ] && { [ ! -f "$COLOR_FILE_CURRENT" ] || ! cmp -s "$COLOR_FILE" "$COLOR_FILE_CURRENT"; } ; then
    cp $COLOR_FILE ~/.termux/colors.properties
    termux-reload-settings
fi
