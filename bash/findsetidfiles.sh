#!/bin/bash
#
# this script generates a report of the files on the system that have the setuid permission bit turned on
# it is for the lab1 exercise
# it uses the find command to find files of the right type and with the right permissions, and an error redirect to
# /dev/null so we do not get errors for inaccessible directories and files
# the identified files are sorted by their owner

# Task 1 for the exercise is to modify it to also display the 12 largest regular files in the system, sorted by their sizes
# The listing should
#    only have the file name, owner, and size of the 12 largest files
#    show the size in human friendly format
#    be displayed after the listing of setuid files
#   should have its own title, similar to how the setuid files listing has a title
# use the find command to generate the list of files with their sizes, with an error redirect to /dev/null
# use cut or awk to display only the output desired

#Task 1 - Initially I had used the following commands:
#find / -type f -ls 2>/dev/null | sort -hk 5 -r | head -12 | awk '{print $5, $7, $11}'

#find / -type f 2>/dev/null | ls -lh | sort -hk 5 -r | head -12 | awk '{print $3, $5, $9}'

#However niether of these commands acheived their desired effect. In the case of the first, it did not convert to human readable
#in the case of the second, it was only parsing local directory.

#switching the find command to include -exec allows ls to be adjusted to convert the root search to the proper format


echo "File Sizes:"
echo "============="
find / -type f -exec ls -lh {} + 2>/dev/null | sort -hk 5 -r | head -12 | awk '{print $3, $5, $9}'
echo ""
# for the task, add
# commands to display a title
# commands to make a list of the 12 biggest files
# sort/format whatever to display the list properly
