#!/bin/bash

validate_java_home() {
    local java_path="$1"
    [[ -n "$java_path" ]] || return 1
    [[ -d "$java_path" ]] || return 1
    [[ -x "$java_path/bin/java" ]] || return 1
    return 0
}

log_verbose() {
    local message="$1"
    [[ "$verbose" == "-v" || "$verbose" == "--verbose" ]] && echo "$message"
}

setup_java() {
    local verbose="$1"
    local java_home
    
    if [[ -f ".java" ]]; then
        java_home=$(< ".java")
        
        if validate_java_home "$java_home"; then
            export JAVA_HOME="$java_home"
            log_verbose "Using Java from .java: $(basename "$java_home")"
            return 0
        else
            log_verbose "Warning: Invalid Java path in .java file: $java_home"
        fi
    fi
    
    if [[ -d "$XDG_CACHE_HOME/coursier/arc" ]]; then
        java_home=$(find "$XDG_CACHE_HOME/coursier/arc" -name "jdk-21.0.*" -type d | sort -V | tail -1)
        
        if validate_java_home "$java_home"; then
            export JAVA_HOME="$java_home"
            log_verbose "Using latest Java 21: $(basename "$java_home")"
            return 0
        fi
    fi
    
    log_verbose "Error: No valid Java installation found"
    return 1
}

cd() {
    builtin cd "$@"
    [[ -f ".java" ]] && setup_java
}
