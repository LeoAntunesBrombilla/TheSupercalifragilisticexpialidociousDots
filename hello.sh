#!/bin/bash

echo -e "Doing some complex stuff rigth here..."

sleep 2; noti -b -e -t "Complex stuff" -m "Done! ES: ($?); T:" --telegram
`espeak -p 40 -v en-wi -s 150 "Complex stuff. Done."`
