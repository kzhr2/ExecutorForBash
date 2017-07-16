#! /bin/bash

_cScriptDir=$(cd $(dirname $BASH_SOURCE)/../; pwd)

_ID=""
source ${_cScriptDir}/conf/EIFJP1.conf
source ${_cScriptDir}/bin/CoreExecutor.sh ${_cScriptDir}

function _getShell() {

 local cSETTINGSFILEPATH="forJP1"
 local cJOBNAME=""
 local cWORK_ID=""
 eval cJOBNAME='$'${IDNAME}

 if [[ "${cJOBNAME}" = "" ]]; then
   #statements
   echo "Environment variable [ ${IDNAME} ] is empty. " >&2 #ERRORMESSAGE
   exit 1
 fi

ls -l ${_cScriptDir}/settings/${cSETTINGSFILEPATH}/IDMapping.conf
 cWORK_ID=`grep "${_JOBNAME}" ${_cScriptDir}/settings/${cSETTINGSFILEPATH}/IDMapping.conf || :`

 _ID=${cWORK_ID%%:*}

 source ${_cScriptDir}/settings/${cSETTINGSFILEPATH}/IDSettings_${_ID}.conf

 __Init_LOG_FILE "${_ID}"

 __PUTLOG DEBUG "ShellNAME [ ${_SHELLNAME} ]"
 __PUTLOG DEBUG "Options [ ${_OPTIONS} ]"

}

_getShell

__PUTLOG INFO "Start."
__PUTLOG INFO "EXECUTE SHELL NAME IS [ ${_SHELLNAME} ]"

__ExecMain ${_SHELLNAME} "${_OPTIONS}"
