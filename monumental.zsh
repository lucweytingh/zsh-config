export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export SDKROOT=$(xcrun --show-sdk-path)

alias yy="cd ~/Documents/mech/portico && yarn && yarn dev"
alias gp="git pull"
alias gpo="git push origin HEAD"
alias gpf="git push --force-with-lease origin HEAD"
alias gcm="git commit -m"
alias gc="git checkout"
