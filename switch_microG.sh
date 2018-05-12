#!/bin/bash

switch_branches() {
  TOPDIR=$PWD
  cd $2
  echo "-"
  echo "$PWD"
  git checkout $1
  cd $TOPDIR
}

switch_zpatch() {
  TOPDIR=$PWD
  cd z_patches
  echo "-"
  echo "$PWD"
  case "$2" in 
    R) ./patches_reverse.sh
       git checkout $1
       ;;
    S) ./patches_apply.sh  
       ;;
  esac
  cd $TOPDIR
}

case "$1" in
  microG) BRANCH="cm-13.0-microG"
    ;;
  default) BRANCH="cm-13.0"
    ;;
  *) echo "usage: switch_microg default|microG"
     exit
    ;;   
esac

switch_zpatch $BRANCH R

switch_branches $BRANCH external/sepolicy
switch_branches $BRANCH external/sqlite
switch_branches $BRANCH frameworks/base
switch_branches $BRANCH frameworks/native
switch_branches $BRANCH packages/apps/Settings
switch_branches $BRANCH packages/apps/SetupWizard
switch_branches $BRANCH vendor/cm
switch_branches $BRANCH .repo/local_manifests

switch_zpatch $BRANCH S



