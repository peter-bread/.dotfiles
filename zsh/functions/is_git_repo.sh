# checks if current directory is in a git repo

is_git_repo() {
	git rev-parse --is-inside-work-tree >/dev/null 2>&1
}
