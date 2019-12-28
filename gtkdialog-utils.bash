#!/bin/bash
#
#shellcheck source=/dev/null

#shellcheck disable=SC2155 # GO HOME SHELLCHECK, YOU'RE DRUNK!!!
[[ -z "${GTKDIALOG}" ]] && export GTKDIALOG="$(type -P gtkdialog)"
[[ -z "${GTKDIALOG}" ]] && echo "You need gtkdialog for this!" >&2 && exit 1

source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/ui/MAIN"
source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/ui/ABOUT"
source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/ui/OPTS"
source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/ui/CALC"
source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/ui/TODOS"
source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/ui/FIND"
source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/ui/CONV"

case "${1}" in
    -h|--help) echo "Usage: $(basename "${BASH_SOURCE[0]}") [-(-c)alc]|[-(-s)earch]|[-(-t)odos]|[-o|--conv]" >&2;;
    -c|--calc) "${GTKDIALOG}" --program=CALC;;
    -s|--search) "${GTKDIALOG}" --program=FIND;;
    -t|--todos) "${GTKDIALOG}" --program=TODOS;;
    -o|--conv) "${GTKDIALOG}" --program=CONV;;
    -d|--dump|--debug) echo "${MAIN} ${ABOUT} ${OPTS} ${CALC} ${TODOS} ${FIND} ${CONV}";;
    *) "${GTKDIALOG}" --program=MAIN;;
esac
