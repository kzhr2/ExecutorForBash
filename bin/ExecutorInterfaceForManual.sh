#! /bin/bash

_cScriptDir=$(cd $(dirname $BASH_SOURCE)/../; pwd)

ARGUMENT_PROGRAM_ID="${1}"
shift
ARGUMENT_ARGUMENTS="${@}"

source ${_cScriptDir}/bin/CoreExecutor.sh ${_cScriptDir}

function _getProgram() {

 local cSETTINGSFILEPATH="forManual"
 local cWORK_ID=""

 source ${_cScriptDir}/settings/${cSETTINGSFILEPATH}/Configuration_${ARGUMENT_PROGRAM_ID}.conf

  if [[ ! -e "${_cScriptDir}/module/${_PROGRAM}" ]]; then
    #statements
    echo "Program name is empty. [ ${_PROGRAM} ]" >&2 #ERRORMESSAGE
    exit 1
  fi

 #make LogFile
 __Init_LOG_FILE "${ARGUMENT_PROGRAM_ID}"

 __PUTLOG DEBUG "PROGRAM [ ${_PROGRAM} ]"
 __PUTLOG DEBUG "Options [ ${ARGUMENT_ARGUMENTS} ]"

}

_getProgram

__PUTLOG INFO "Start."
__PUTLOG INFO "EXECUTE Program NAME IS [ ${_PROGRAM} ]"

__ExecMain ${_PROGRAM} "${ARGUMENT_ARGUMENTS}"
