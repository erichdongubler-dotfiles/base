export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

.reload_scripts_from_config() {
	local script_type=${1:?no script type specified}
	shift

	echo -e "  \033[1mReloading $script_type shell extensions...\033[0m"
	for shell_type in $@; do
		local scripts_directory="$XDG_CONFIG_HOME/erichdongubler/$shell_type/$script_type"
		if [ -d "$scripts_directory" ]; then
			echo -e "    from \033[1;34m\"$scripts_directory\"\033[00m"
			for file in $(ls "$scripts_directory"/.*."$shell_type" 2> /dev/null); do
				if [ -f "$file" ]; then
					. "$file"
				fi
			done
			for file in $(ls "$scripts_directory"/*."$shell_type" 2> /dev/null); do
				if [ -f "$file" ]; then
					echo -e "      Loading \033[1;34m${file##*/}\033[00m"
					. "$file"
				fi
			done
		fi
	done
}

.reload_login_extensions() {
	.reload_scripts_from_config login "$@"
}

.reload_interactive_extensions() {
	.reload_scripts_from_config interactive "$@"
}

.login() {
	echo -e "\033[1mLogged in as \033[1;32m$(id -un)\033[1m@\033[1;32m$(hostname)\033[00m"
}
