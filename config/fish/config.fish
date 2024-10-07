zoxide init fish | source
fzf --fish | source
source (/sbin/starship init fish --print-full-init | psub)

set -x FZF_DEFAULT_OPTS "
    --color=fg:-1,fg+:#ffe1e5,bg:-1,bg+:#171e19
    --color=hl:#53ee87,hl+:#fe1010,info:#afaf87,marker:#53ee87
    --color=prompt:#fe1010,spinner:#53ee87,pointer:#fe1010,header:#3b704c
    --color=border:#d9ffeb,gutter:#dcdcdc,label:#aeaeae,query:#d9d9d9
    --border=sharp --border-label= --preview-window=border-bold --padding=1
    --margin=1 --prompt='➞ ' --marker='✧ ' --pointer='✈'
    --separator='─' --scrollbar='⣿' --info=right"

function yy
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
