#!/bin/bash

# $1 - file
# $2 - initial goal

# -d flag if present for drawing cfg
# -p flag if present for print cfg in fc format
# -l N option to select the level of props (default. 4)
# -r PATH option to select destination folder (default. $1_output/)
# -u no unfold option

PEPATH=$(dirname $0)
export LD_LIBRARY_PATH=$PATH":"$PEPATH":"$LD_LIBRARY_PATH

OPTS=`getopt -o sdr:u:p: --long no-unfold:result-dir:props:,draw -n "$0" -- "$@"`
if [ $? != 0 ] ; then echo "Failed parsing options." >&2; exit 1; fi

eval set -- "$OPTS"

draw=false
level=4
print=false
nounfold=none
while true; do
   case "$1" in
       -d) draw=true; shift
	   ;;
       -p | --props) props=$2; shift 2;
	   ;;
       -r|--result-dir) resultdir=$2; shift 2;
	   ;;
       -u|--no-unfold) nounfold=$2; shift 2;
	   ;;

       -s) print=true; shift;
	   ;;
       -- ) shift; break ;;
       * ) break ;;
   esac
done

if [ $# -gt 2 ]; then echo "Too many arguments." >&2; exit 1; fi
if [ $# -eq 1 ]; then echo "Missing entry point or file." >&2; exit 1; fi
if [ ! -f "$1" ]; then echo 'File "'$1'" not found.' >&2; exit 1; fi
if [ ! -f "$props" ]; then echo "Missing file of properties: '$props'." >&2; exit 1; fi
if [[ -z ${resultdir+x} ]]; then resultdir=$(dirname $1); fi



f=`basename $1`
f=${f%.pl} # remove .pl extension
resultdir=$resultdir/${f}_output

if [ ! -d $resultdir ]; then
    mkdir -p $resultdir
    if [ $? != 0 ]; then echo "Error when creating $resultdir folder" >&2; exit 1; fi
fi

cp $1 "$resultdir/$f.pl"
if [ $? != 0 ]; then echo "Error: no source file or destination folder." >&2; exit 1; fi

$PEPATH/peunf_smt_2 -prg "$1" -entry "$2" -props "$props" -o "$resultdir/$f.pe.pl" -nounfold "$nounfold"
if [ $? != 0 ]; then echo "Error: error doing partial evaluation." >&2; exit 1; fi

$PEPATH/chc2cfg -prg "$resultdir/$f.pe.pl" -cfg "$1" -init "$2" -o "$resultdir/$f.pe.fc"
if [ $? != 0 ]; then echo "Error: error converting into cfg." >&2; exit 1; fi

if $draw; then
  $PEPATH/drawcfg -prg "$resultdir/$f.pe.pl" -o "$resultdir/cfg.dot" &&
  dot -Tpng -o "$resultdir/cfg.png" "$resultdir/cfg.dot" || echo "Warning: error drawing the graph" >&2;
fi

if $print; then
    cat "$resultdir/$f.pe.fc" || echo "Warning: error printing the source" >&2;
fi
