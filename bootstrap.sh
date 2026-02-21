#!/usr/bin/env bash
#
# SPDX-FileCopyrightText: ©2021-2025 franklin <franklin@bitsmasher.net>
#
# SPDX-License-Identifier: MIT

# ChangeLog:
#
# v0.1

#set -euo pipefail

# The special shell variable IFS determines how Bash
# recognizes word boundaries while splitting a sequence of character strings.
IFS=$'\n\t'

#PREFIX="/mnt/storage1/workspace/build"
PREFIX="/home/franklin/workspace/build"

function build_sdl2() {
  sudo apt install -y libxmp-dev
  #git clone https://github.com/libsdl-org/SDL_mixer.git /tmp/SDL_mixer
  #/mnt/storage1/workspace/build/SDL2_mixer-2.8.1.tar.gz
  if [ ! -d "${PREFIX}/SDL2_mixer-2.8.1" ]; then
    wget -O "${PREFIX}"/SDL2_mixer-2.8.1.tar.gz https://github.com/libsdl-org/SDL_mixer/releases/download/release-2.8.1/SDL2_mixer-2.8.1.tar.gz
    gzip -d /mnt/storage1/workspace/build/SDL2_mixer-2.8.1.tar.gz
    tar xvf /mnt/storage1/workspace/build/SDL2_mixer-2.8.1.tar
  fi
  cd  /mnt/storage1/workspace/build/SDL2_mixer-2.8.1 && 
  exit 1
}

function main() {
  # change to working dir
  pushd "${PREFIX}/freeciv-3.1.3" 2>&1 || exit 1

  CONFIG_ARGS="--enable-client=auto --with-missinglist --enable-aimodules=experimental --enable-shared --enable-mapimg=auto"
  # "${PREFIX}/freeciv-3.1.3/autogen.sh ${CONFIG_ARGS}"
  sudo apt install -y gettext libsqlite3-dev libcurl4-openssl-dev libsdl2-dev \
    libmagickwand-dev libgtk-3-dev libxmp-dev qt6-tools-dev liblua5.4-dev \
    libsdl2-mixer-dev
  #build_sdl2
  cd "${PREFIX}/freeciv-3.1.3" && ./configure --enable-client=auto --with-missinglist --enable-aimodules=experimental --enable-shared --enable-mapimg=auto
}

main "$@"
