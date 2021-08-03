#!/bin/sh

# Copyright (c) 2021 Jesse N. <jesse@keplerdev.com>
# This work is licensed under the terms of the MIT license. For a copy, see <https://opensource.org/licenses/MIT>.

no_ohmyzsh="false";

run() {
    apk update && \
    apk add git && \
    cd /tmp/docker-build && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/${OMZ_VERSION}/tools/install.sh)" "" --unattended \
    apk del git && \
    rm -rf /var/cache/apk/*;
}

main() {
    while [ "$#" -gt 0 ]; do
        case "$1" in 
            --no-ohmyzsh)
                no-ohmyzsh="true";
            ;;
    done
}

main "$@"

if [ "${no_ohmyzsh}" = "false" ];
then
    run
fi