if [[ -n $IN_NIX_SHELL ]]; then
    PCOL="%{$fg_no_bold[magenta]%}"
    # "%{$fg[magenta]%}nxsh%{$reset_color%} "
else
    PCOL="%{$fg_no_bold[green]%}"
fi

RPROMPT='[%*]'
PROMPT='${PCOL}%n@%m %{$fg_no_bold[green]%}%~ $(git_prompt_info)%{$reset_color%}
» '

# GIT PROMPT
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ●%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%}"
