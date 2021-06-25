#!/bin/bash

# !!!!!!!!!!!!!!!!!!!!
# function with exit code, loop-"while" will exit.
# the functions is for demo usage.

function usage_cat(){
    cat <<EOF
Usage: $0 [OPTION] ...
Use different way to print the shell usage.

Example: $0 -c -s hello_cat

OPTIONS:
-c, --cat           Use usage_cat print the usage content.
-e, --echo1         Use usage_echo1 print the usage content.
-f, --echo2         Use usage_echo2 print the usage content.
-p, --print         Use usage_print print the usage content.

-s, --show=STRING   Print the STRING.
-h, --help          Show this usage document.

EOF

    exit 1
}

# 2. use echo1
function usage_echo1(){
    echo "Usage: $0 [OPTION] ..."
    echo "Use different way to print the shell usage."
    echo "Example: $0 -c -s hello_echo1"
    echo "OPTIONS:"
    echo "-c, --cat           Use usage_cat print the usage content."
    echo "-e, --echo1         Use usage_echo1 print the usage content."
    echo "-s, --show=STRING   Print the STRING."
    echo "-h, --help          Show this usage document."
    exit 1
}
# 3. use print
function usage_print(){
    printf \
"
Usage: $0 [OPTION] ...
Use different way to print the shell usage.

Example: $0 -c -s hello_cat

OPTIONS:
-c, --cat           Use usage_cat print the usage content.
-e, --echo1         Use usage_echo1 print the usage content.
-f, --echo2         Use usage_echo2 print the usage content.
-p, --print         Use usage_print print the usage content.

-s, --show=STRING   Print the STRING.
-h, --help          Show this usage document.
"
    exit 1
}

ARGS=`getopt -o cefps:h --long cat,echo1,echo2,print,show:,help -n "$0" -- "$@"`
[ $? -ne 0 ] && usage
eval set -- "${ARGS}"
echo ${ARGS}
while true
do
    case $1 in
        -c|--cat)
            usage_cat
            shift
            ;;
        -e|--echo1)
            usage_echo1
            shift
            ;;
        -f|--echo2)
            echo "echo2 not implement"
            shift
            ;;
        -p|--print)
            usage_print
            shift
            ;;
        -s|--show)
            str=$2;
            shift 2
            ;;
        -h|--help)
            echo "this is the help option"
            shift
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Invalid options, please check"
            exit 1
            ;;
    esac
done

echo string=$str
