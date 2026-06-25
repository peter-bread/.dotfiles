#!/usr/bin/env bash

print_var() {
  local var_name="$1"
  printf '%s=%s\n' "$var_name" "${!var_name}"
}

export_var() {
  printf 'export '
  print_var "$1"
}

source "$DOTFILES"/_helpers/core

try_package_managers() {
  need_any -p "${@:-}" 2>/dev/null || echo "unknown"
}

detect_darwin() {
  P_OS_NAME=$(sw_vers -productName)
  P_OS_ID=$P_OS_NAME
  P_OS_FAMILY=$P_OS_ID
  P_OS_VERSION=$(sw_vers -productVersion)
  P_PKG_MANAGER=$(try_package_managers brew port)
}
detect_linux() {
  # shellcheck disable=SC1091
  [ -f /etc/os-release ] && . /etc/os-release

  P_OS_NAME="${NAME:-Linux}"
  P_OS_ID="${ID:-linux}"
  P_OS_FAMILY="${ID_LIKE:-unknown}"
  P_OS_VERSION="${VERSION_ID:-unknown}"
  P_PKG_MANAGER=$(try_package_managers apt-get dnf xbps-install apk)
}

P_KERNEL=$(uname -s)
P_KERNEL_VERSION=$(uname -r)
P_ARCH=$(uname -m)

case $P_KERNEL in
Linux) detect_linux ;;
Darwin) detect_darwin ;;
*)
  echo "Unrecognised kernel: $P_KERNEL" >&2
  exit 1
  ;;
esac

P_OS_VERSION_MAJOR=${P_OS_VERSION%%.*}

P_HOSTNAME=$(hostname -s 2>/dev/null)
# Or use `$(uname -n)` instead?

echo "$P_KERNEL"
echo "$P_KERNEL_VERSION"
echo "$P_ARCH"
echo "$P_OS_ID"
echo "$P_OS_FAMILY"
echo "$P_OS_VERSION"
echo "$P_OS_VERSION_MAJOR"
echo "$P_PKG_MANAGER"
echo "$P_HOSTNAME"
