#! /bin/bash -ue

__cScriptDir="${1}"
__cLoggePath="${__cScriptDir}/funcs/Logger.func"
__cErrortaPath="${__cScriptDir}/funcs/Errorta.func"
__cExecutorPath="${__cScriptDir}/funcs/Executor.func"

source ${__cLoggePath} ${__cScriptDir}
source ${__cErrortaPath}
source ${__cExecutorPath}
