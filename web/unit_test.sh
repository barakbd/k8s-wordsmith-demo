#!/bin/sh
exit_code=$1
if [ $exit_code = 0 ]
then
    echo =========== exit_code - $1 - is success
else
    echo ========== exit_code - $1 - is error
fi
exit $exit_code
