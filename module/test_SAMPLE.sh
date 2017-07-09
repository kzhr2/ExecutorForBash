function main() {

local arg="${1}"
local shell="${0}"
local PID="${$}"
local iPPID="${PPID}"

echo "\$0 [ ${shell} ]"

echo "\$1 [ ${arg} ]"

echo "\$PID [ ${PID} ]"

echo "\$PPID [ ${iPPID} ]"

echo ${shell} is end

}

main ${1}

