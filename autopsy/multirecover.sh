IMAGE=/home/amock/usb.img
LIST=/home/amock/autopsy_ws/files.lst
DEST=/home/amock/autopsy_ws/recovered

cat $LIST | while read line; do
   filetype=`echo "$line" | awk {'print $1'}`
   filenode=`echo "$line" | awk {'print $2'}`
   filenode=${filenode%:}
   filename=`echo "$line" | cut -f 2 -d '   '`

   if [ $filetype == "r/r" ]; then
      echo "$filename"
      mkdir -p "`dirname "$DEST/$filename"`"
      icat -f ext2 -r -s $IMAGE "$filenode" > "$DEST/$filename"
   fi
done
