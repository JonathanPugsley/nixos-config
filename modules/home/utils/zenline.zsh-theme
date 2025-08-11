RPROMPT='[%*]'
PROMPT='%{$fg_no_bold[default]%}%n@%m %{$fg_no_bold[green]%}%6~ $(git_prompt_info)%{$reset_color%} 
» '


# GIT PROMPT
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}●%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%}"
