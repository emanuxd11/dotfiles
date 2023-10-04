#Upper connector
connectorUp() {
   echo "%{$FG[224]%}%B╭─%b%{$reset_color%}"
}

#Dolla dolla bill
dollaSign() {
   echo "(?:%{$fg_bold[green]%}$ %{$reset_color%}:%{$fg_bold[red]%}$ %{$reset_color%}"
}

#Lower connector and $ sign
connectorLow() {
   echo "%{$FG[224]%}%B╰─%b%"
}

#Host name
hostName() {
   echo "%B%{$FG[069]%}%m%b"
}

#Print username
username() {
   OPEN_BRACKET="%B%{$FG[224]%}("
   CLOSE_BRACKET="%B%{$FG[224]%})"
   AT="%B%{$FG[224]%}@"
   UNAME="%B%{$FG[069]%}%n%b"
   echo "$OPEN_BRACKET$UNAME$AT$(hostName)$CLOSE_BRACKET"
}

#Get path to cwd
currDirPath() {
   PATH="%{$fg_bold[green]%}%B%6c% %b"
   echo "$PATH%{$reset_color%}"
}
 
#Set the actual prompt
PROMPT='$(connectorUp)$(username) $(currDirPath) $(git_prompt_info)
$(connectorLow)$(dollaSign)'

#Git prompt
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
