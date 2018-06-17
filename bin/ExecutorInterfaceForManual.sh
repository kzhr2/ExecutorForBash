#! /bin/bash

_cScriptDir=$(cd $(dirname $BASH_SOURCE)/../; pwd)

ARGUMENT_PROGRAM="${1}"
shift
ARGUMENT_OPTIONS="${@}"

source ${_cScriptDir}/bin/CoreExecutor.sh ${_cScriptDir}

function _getProgram() {

 local cSETTINGSFILEPATH="forManual"
 local cWORK_ID=""

 if [[ -e "${_cScriptDir}/module/${ARGUMENT_PROGRAM}" ]]; then
   #statements
   echo "Program name is empty. [ ${IDNAME} ]" >&2 #ERRORMESSAGE
   exit 1
 fi

 source ${_cScriptDir}/settings/${cSETTINGSFILEPATH}/Configuration_${ARGUMENT_PROGRAM}.conf

 #make LogFile
 __Init_LOG_FILE "${ARGUMENT_PROGRAM}"

 __PUTLOG DEBUG "PROGRAM [ ${ARGUMENT_PROGRAM} ]"
 __PUTLOG DEBUG "Options [ ${ARGUMENT_OPTIONS} ]"

}

_getProgram

__PUTLOG INFO "Start."
__PUTLOG INFO "EXECUTE Program NAME IS [ ${ARGUMENT_PROGRAM} ]"

__ExecMain ${ARGUMENT_PROGRAM} "${ARGUMENT_OPTIONS}"
