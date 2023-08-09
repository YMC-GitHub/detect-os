#!/usr/bin/env bash

ZERO_OS_NAME=
ZERO_OS_TYPE=

function detect_os_on_travis(){
    [ "$ZERO_OS_TYPE"_ != "_" ] && return ; 
    # detect os with uname
    case $(uname | tr '[:upper:]' '[:lower:]') in
      linux*)
        export ZERO_OS_TYPE=linux
        ;;
      darwin*)
        export ZERO_OS_TYPE=osx
        ;;
      msys*)
        export ZERO_OS_TYPE=windows
        ;;
      *)
        export ZERO_OS_TYPE=notset
        ;;
    esac
}

function detect_os_on_base(){
    [ "$ZERO_OS_TYPE"_ != "_" ] && return ; 
case "$OSTYPE" in
  solaris*)  
    export ZERO_OS_TYPE="SOLARIS" ;;
  darwin*)   
    export ZERO_OS_TYPE="OSX" ;; 
  linux*)    
    export ZERO_OS_TYPE="LINUX" ;;
  bsd*)      
    export ZERO_OS_TYPE="BSD" ;;
  msys*)     
    export ZERO_OS_TYPE="WINDOWS" ;;
  *)         
    export ZERO_OS_TYPE="unknown: $OSTYPE" ;;
esac
}

detect_os_on_base
detect_os_on_travis
echo $ZERO_OS_TYPE

# detect-os/index.sh
