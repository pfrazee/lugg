#!/bin/sh

# revert from previous runs
if [ -n "$LUGG_OLDHOME" ] ; then
    export HOME="$LUGG_OLDHOME"
    unset LUGG_OLDHOME
fi

# stop here if no params
if [ $# -ne 1 ] ; then
    echo "Home reverted to $HOME"
    return 0
fi

# create a temporary home dir
TMP_DIR=`mktemp -d`

# populate the tmp dir with the target repo
git clone $1 $TMP_DIR

# populate the tmp dir with soft links from home
for f in `ls -a $HOME`
do
    if [ $f != "." -a $f != ".." -a ! -f $TMP_DIR/$f ] ; then
        ln -s $HOME/$f $TMP_DIR/$f
    fi
done

# change home
export LUGG_OLDHOME="$HOME"
export HOME="$TMP_DIR"
echo "Home is now set to $HOME"
