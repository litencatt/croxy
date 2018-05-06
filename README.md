## Usage

### Setup
```rb
$ setup
#=> copy croxy to /usr/loca/bin
```

### Run
```
$ croxy http://localhost:3000

#=> create ~/.croxy_history and save executed curl commands
```

### Use with peco
```
# ~/.zshrc
function curl-peco () {
    local selected_command=$(croxy -l | peco)
    if [ -n "$selected_command" ]; then
        BUFFER="croxy ${selected_command}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N curl-peco
bindkey "^@" curl-peco
```
