#! /bin/bash

_cScriptDir=$(cd $(dirname $BASH_SOURCE); pwd)

source ${_cScriptDir}/../conf/EIFJP1.conf
source ${_cScriptDir}/CoreExecutor.sh ${_cScriptDir}

function _getShell() {

 local cID=""
 eval cID='$'${IDNAME}

 test "${cID}" = "" && __PUTLOG ERROR "Environment variable [ ${IDNAME} ] is empty. " && exit 1

 source ${_cScriptDir}/../settings/IDSettings_${cID}.conf

 __PUTLOG DEBUG "ShellNAME [ ${_SHELLNAME} ]"
 __PUTLOG DEBUG "Options [ ${_OPTIONS} ]"

}

_getShell

__ExecMain ${_SHELLNAME} "${_OPTIONS}"
