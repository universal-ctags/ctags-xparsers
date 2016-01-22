#!/bin/sh
# Copyright: 2015 Masatake YAMATO
# License: GPL-2 or later

help ()
{
    echo "$0 CTAGS-EXECUTABLE UNITS-SCRIPT"
}

case "$1" in
    -h|--help|help|-?)
    help
    exit 0
    ;;
esac


if [ $# -lt 2 ]; then
    echo "### Too few arguments" 1>&2
    help 1>&2
    exit 2
fi

if [ $# -gt 2 ]; then
    echo "### Too many arguments" 1>&2
    help 1>&2
    exit 2
fi

if [ ! -e "$1" ]; then
    echo "cannot find dentry for ctags executable: $1" 1>&2
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "cannot find file for ctags executable: $1" 1>&2
    exit 1
fi

if [ ! -x "$1" ]; then
    echo "not an executable: $1" 1>&2
    exit 1
fi
CTAGS=$1

if [ ! -e "$2" ]; then
    echo "cannot find dentry for units test-harness script: $2" 1>&2
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "cannot find file for units test-harness script: $2" 1>&2
    exit 1
fi
UNITS=$2

echo -n Making symlink for ctags...
if ! ln -f -s $CTAGS ./ctags; then
    echo "failed to make a symlink for ctags executable" 1>&2
    exit 1
else
    echo done
fi

echo -n Making misc directory...
if ! mkdir -p ./misc; then
    echo "failed to make misc directory" 1>&2
    exit 1
else
    echo done
fi

echo -n Making symlink for units...
if ! ln -r -f -s $UNITS ./misc/units; then
    echo "failed to make a symlink for units test harness script" 1>&2
    exit 1
else
    echo done
fi

echo -n libexec...
if ! mkdir -p ./libexec; then
    echo "failed to make libexec directory" 1>&2
    exit 1
else
    echo done
fi

echo -n datadir...
for d in Units/*.d; do
    (cd $d; ln -f -s ../../optlib ./optlib)
done
echo done
