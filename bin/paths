#!/bin/bash

# vars
relative_classpaths="`pwd`/.classpaths"
project="$1"
lines_sessions=`wc -l $relative_classpaths | awk '{ print $1 }'`
cmd="java -cp <.>"


if [[ -f $relative_classpaths ]]; then
    counter=0
    while read line; do
        # echo $line
        to_append="$line:<.>"
        cmd=${cmd/"<.>"/"$to_append"}
        counter=$((counter+1))

        if [[ $counter = $lines_sessions ]]; then
            # echo "reached..."
            cmd=${cmd/":<.>"/" $project"}
            # cmd example:
                # java -cp target/cats-app-1.0-SNAPSHOT.jar:libs/* com.my-company.app.App
            # echo -e "cmd = $cmd\ncmd2 = $cmd2"
            eval_it=true
            break
        else
            # continue
            :
        fi

    done < $relative_classpaths
    # echo -e "lines ins file = $lines_sessions\nfinal cmd = $cmd"
else
    echo -e "\nIn order to run this script, you will need to have a relative classpath file,\nwhich is used for storing the classpaths of the project in matter.\n(NOTE: must be located at the projects and root dir and should be called '.classpaths')"
fi

if [[ "$eval_it" == "true" ]]; then
    eval $cmd
else
    echo -e "There was an error while trying to execute the command '$cmd'"
fi
