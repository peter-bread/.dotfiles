#!/usr/bin/env bash
# shellcheck shell=bash

# Public variables after detect_platform:
#   PLATFORM_KERNEL
#   PLATFORM_ID
#   PLATFORM_VERSION
#   PLATFORM_MAJOR
#   PLATFORM_FAMILY
#   PLATFORM_PKG_MANAGER

detect_platform() {
  set -euo pipefail

  PLATFORM_KERNEL="$(uname -s)"

  case "$PLATFORM_KERNEL" in
  Linux)
    detect_linux
    ;;
  Darwin)
    detect_macos
    ;;
  *)
    echo "Unsupported kernel: $PLATFORM_KERNEL" >&2
    return 1
    ;;
  esac
}

########################################
# Linux detection
########################################

detect_linux() {
  if [[ ! -f /etc/os-release ]]; then
    echo "Missing /etc/os-release; cannot detect distribution." >&2
    return 1
  fi

  # shellcheck disable=SC1091
  . /etc/os-release

  PLATFORM_ID="$ID"
  PLATFORM_VERSION="${VERSION_ID:-}"
  PLATFORM_MAJOR="${PLATFORM_VERSION%%.*}"
  # PLATFORM_LIKE="${ID_LIKE:-}"

  if [[ -z "$PLATFORM_VERSION" ]]; then
    PLATFORM_VERSION="rolling"
    PLATFORM_MAJOR="rolling"
  fi

  PLATFORM_FAMILY="$(detect_linux_family)"
  PLATFORM_PKG_MANAGER="$(detect_linux_package_manager)"
}

detect_linux_family() {
  case "$ID" in
  debian | ubuntu)
    echo "debian"
    ;;
  fedora)
    echo "fedora"
    ;;
  centos | rhel | rocky | almalinux)
    echo "rhel"
    ;;
  alpine)
    echo "alpine"
    ;;
  arch)
    echo "arch"
    ;;
  *)
    local LIKE="${ID_LIKE:-}"
    if [[ "$LIKE" == *debian* ]]; then
      echo "debian"
    elif [[ "$LIKE" == *rhel* ]] || [[ "$LIKE" == *fedora* ]]; then
      echo "rhel"
    else
      echo "unknown"
    fi
    ;;
  esac
}

detect_linux_package_manager() {
  if command -v apt-get >/dev/null 2>&1; then
    echo "apt"
  elif command -v dnf >/dev/null 2>&1; then
    echo "dnf"
  elif command -v yum >/dev/null 2>&1; then
    echo "yum"
  elif command -v pacman >/dev/null 2>&1; then
    echo "pacman"
  elif command -v apk >/dev/null 2>&1; then
    echo "apk"
  else
    echo "unknown"
  fi
}

########################################
# macOS detection
########################################

detect_macos() {
  PLATFORM_ID="macos"
  PLATFORM_VERSION="$(sw_vers -productVersion)"
  PLATFORM_MAJOR="${PLATFORM_VERSION%%.*}"
  PLATFORM_FAMILY="darwin"

  if command -v brew >/dev/null 2>&1; then
    PLATFORM_PKG_MANAGER="brew"
  else
    PLATFORM_PKG_MANAGER="unknown"
  fi
}

########################################
# Helpers
########################################

require_supported_platform() {
  if [[ "$PLATFORM_PKG_MANAGER" == "unknown" ]]; then
    echo "Unsupported distribution: ${PLATFORM_ID}" >&2
    return 1
  fi
}

platform_summary() {
  cat <<EOF
Kernel        : ${PLATFORM_KERNEL}
ID            : ${PLATFORM_ID}
Version       : ${PLATFORM_VERSION}
Major         : ${PLATFORM_MAJOR}
Family        : ${PLATFORM_FAMILY}
Package mgr   : ${PLATFORM_PKG_MANAGER}
EOF
}

install_packages() {
  case $PLATFORM_PKG_MANAGER in
  apt) sudo apt install -y "$@" ;;
  brew) brew install "$@" ;;
  unknown | *)
    echo "No supported packager found" >&2
    return 1
    ;;
  esac
}

detect_platform
platform_summary
