#! /bin/bash

_cScriptDir=$(cd $(dirname $BASH_SOURCE); pwd)

source ${_cScriptDir}/../conf/EIFJP1.conf
source ${_cScriptDir}/CoreExecutor.sh ${_cScriptDir}

function _getShell() {

 local cSETTINGSFILEPATH="forJP1"
 local cID=""
 eval cID='$'${IDNAME}

 if [[ "${cID}" = "" ]]; then
   #statements
   echo "Environment variable [ ${IDNAME} ] is empty. " >&2 #ERRORMESSAGE
   exit 1
 fi

 source ${_cScriptDir}/../settings/${cSETTINGSFILEPATH}/IDSettings_${cID}.conf

 __PUTLOG DEBUG "ShellNAME [ ${_SHELLNAME} ]"
 __PUTLOG DEBUG "Options [ ${_OPTIONS} ]"

}

_getShell

__ExecMain ${_SHELLNAME} "${_OPTIONS}"
