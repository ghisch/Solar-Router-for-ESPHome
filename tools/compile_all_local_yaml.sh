for iloop in $(ls *.yaml | grep -v secrets | grep -v work_in_progress | grep -v proof-of-concept); do
   echo
   echo "#########################################"
   echo Compiling $iloop
   ./tools/convert_to_local_source_for_dev.sh $iloop && esphome compile work_in_progress.yaml || exit 1
done