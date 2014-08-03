#!/bin/bash

main() {
	if [[ "$1" = "" ]]; then
		procfsd -p 8000
	else
		procfs $1
	fi
}

main "$@"