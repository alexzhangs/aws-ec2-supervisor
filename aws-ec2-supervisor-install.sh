#!/bin/bash -e

[[ $DEBUG -gt 0 ]] && set -x || set +x

BASE_DIR="$(cd "$(dirname "$0")"; pwd)"
PROGNAME=${0##*/}

usage () {
    printf "Install supervisor on AWS EC2 instance.\n"
    printf "Run this script under root.\n\n"

    printf "$PROGNAME\n"
    printf "\t[-i]\n"
    printf "\t[-v VERSION]\n"
    printf "\t[-h]\n\n"

    printf "OPTIONS\n"
    printf "\t[-i]\n\n"
    printf "\tGenerate init.d script, to enable service supervisord <start|stop>.\n\n"

    printf "\t[-v VERSION]\n\n"
    printf "\tInstall a specific version, default is the latest version in pip.\n\n"

    printf "\t[-h]\n\n"
    printf "\tThis help.\n\n"
    exit 255
}

package=supervisor

while getopts iv:h opt; do
    case $opt in
        i)
            initd_script=1
            ;;
        v)
            package=$package==$OPTARG
            ;;
        h|*)
            usage
            ;;
    esac
done

pip install "$package"
mkdir -p /etc/supervisor/conf.d

echo_supervisord_conf \
    | sed -e 's/;\[include]/[include]/' \
          -e 's|;files = .*|files = /etc/supervisor/conf.d/*.ini|' \
          > /etc/supervisord.conf

if [[ $initd_script -eq 1 ]]; then
    # reference: https://github.com/alexzhangs/supervisord
    curl -sL https://raw.githubusercontent.com/alexzhangs/supervisord/master/supervisord -o /etc/init.d/supervisord
    chmod 755 /etc/init.d/supervisord
    chkconfig supervisord on
fi

exit
