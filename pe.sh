#!/bin/sh
# read -d flag if present for drawing cfp
# $1 - file
# $2 - initial goal

PE="."

draw=0
while getopts "d" flag
do
   case $flag in
   d) draw=1
      shift
   ;;
   *)
   ;;
   esac
done

resultdir=$1_output
f=`basename $1`
f=${f%.pl} # remove .pl extension

if (test ! -d $resultdir) then
        mkdir $resultdir
fi

#k=4
#until [[ $k -eq 0 ]];
#do

k=$3
if [[ $k -eq 0 ]]; then
   echo "assuming k = 1"
   k=1
fi

   # $PE/props -prg "$1" -l $k -o "$resultdir/$f.props"
   # $PE/peunf_smt_2 -prg "$1" -entry "$2" -props "$resultdir/$f.props" -o "$resultdir/$f.pe.pl" 
   #$PE/peunf_smt -prg "$1" -entry "$2" -props "$resultdir/$f.props" -o "$resultdir/$f.pe.pl" 

   $PE/peunf -prg "$1" -entry "$2" -props "$3" -o "$resultdir/$f.pe.pl"


   if [[ $draw -eq 1 ]]; then
     $PE/drawcfg -prg "$resultdir/$f.pe.pl" -o "$resultdir/cfg.txt"
     dot -Tjpg -o "$resultdir/cfg$k.jpg" "$resultdir/cfg.txt"
     rm "$resultdir/cfg.txt"
   fi
   #k=`expr $k \- 1`
#done
