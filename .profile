
# source helpers (files starting with _)
for f in ~/.profile.d/_*.sh; do [ -f "$f" ] && . "$f"; done

# source functions
[ -f ~/.profile_fn ] && . ~/.profile_fn

if [ "$(uname -s)" = "Darwin" ]; then

    # macOS-only aliases
    alias open='reattach-to-user-namespace open'
    alias github='cd $HOME/github'

    # machine detection
    platform_uuid="$(ioreg -rd1 -c IOPlatformExpertDevice | awk -F'"' '/IOPlatformUUID/ {print $4}')"

    case "$(id -un)" in
        markwang)
            . ~/.profile.d/macos-2015-markwang.sh
            ;;
        peiqiw)
            . ~/.profile.d/macos-2023-peiqiw.sh
            ;;
        pwang470)
            . ~/.profile.d/macos-2025-bloomberg-pwang470.sh
            ;;
        wpq)
            if [ "$platform_uuid" = "68CB70C0-668A-5193-BD0B-A9D6DFFE9BEA" ]; then
                . ~/.profile.d/macos-2025-wpq.sh
            else
                disk_uuid=$(diskutil info / | awk '/Volume UUID/{print $3}')
                if [ "$disk_uuid" = "BC940CD9-82B7-4328-8967-D01A93BBDC2D" ]; then
                    . ~/.profile.d/macos-2024-meta-wpq.sh
                fi
            fi
            ;;
    esac

elif [ "$(uname -s)" = "Linux" ]; then

    # Sandy's machine
    if [ -f /etc/machine-id ] && [ "$(cat /etc/machine-id)" = "c030daf99d5e4a739d8337011982d137" ]; then
        . ~/.profile.d/linux-2024-sandy.sh
    fi

    # Meta submit nodes (only in zsh)
    if [ -n "$ZSH_VERSION" ]; then
        case "$(hostname)" in
            submit-0|a100-st2-p4de24xlarge-*)
                . ~/.profile.d/linux-2024-meta.sh
                ;;
        esac
    fi

    # IBM CCC
    case "$(hostname)" in
        ccc*)
            . ~/.profile.d/linux-2023-ccc.sh
            ;;
    esac

    # Satori
    case "$(hostname)" in
        satori*)
            . ~/.profile.d/linux-2020-satori.sh
            ;;
    esac
    if [[ "$(hostname -f 2>/dev/null)" =~ node[0-9]+\.inband$ ]]; then
        . ~/.profile.d/linux-2020-satori.sh
    fi

    # AiMOS
    _aimos_match=false
    case "$(hostname -f 2>/dev/null)" in
        npl*|blp*.ccni.rpi.edu|dcs*.ccni.rpi.edu)
            _aimos_match=true
            ;;
    esac
    if [ "$_aimos_match" = true ]; then
        . ~/.profile.d/linux-2023-aimos.sh
    fi
    unset _aimos_match

    # CSAIL spice-rack machines
    case "$(uname -n)" in
        *.csail.mit.edu)
            . ~/.profile.d/linux-2020-csail.sh
            ;;
    esac

fi
