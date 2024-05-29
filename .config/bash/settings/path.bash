# ~  Path

[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"

[[ -d "$HOME/.local/bin/scripts" ]] && export PATH="$HOME/.local/bin/scripts:$PATH"

[[ -d "$HOME/linuxbrew/" ]] && export PATH="$HOME/linuxbrew/.linuxbrew/bin/" && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

[[ -d $ANDROID_HOME ]] && export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"

[[ -d $JAVA_HOME ]] && export PATH="$JAVA_HOME:$PATH"
