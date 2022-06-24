function rawr --description "A command-line system information tool written in fish"
    read name _ linux_version_string info </proc/version
    set kernel (string split -r -m1 \- $linux_version_string)[1]

    set cros 

    if string match -q "*Chromium OS*" $info
        set -f NAME "Chrome OS"
    else if test -r /etc/os-release
        for row in (read -z < /etc/os-release)
            set -l kv (string split -m 1 \= $row)
            set -f (string trim $kv[1]) (string trim -c " \"" $kv[2])
        end
    end

    echo (set_color -o red)"  os"(set_color normal)" ~ $NAME"
    echo (set_color -o red)"  sh"(set_color normal)" ~ "(string split / $SHELL)[-1]
    echo (set_color -o red)"  de"(set_color normal)" ~ $XDG_CURRENT_DESKTOP"
    echo (set_color -o red)"  kn"(set_color normal)" ~ "(string split -m1 \- $kernel)[1]
    echo ""
    echo "        . "
    echo "   .>   )\;`a__"
    echo "  (  _ _)/ /-.\" "(set_color -o red)"~~"(set_color normal)
    echo "   `( )_ )/"
    echo "    <_  <_     Welcome to "(prompt_hostname)", "(set_color red)"$USER"(set_color normal)
    echo ""
end
