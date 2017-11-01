#/bin/bash

argc=$#
apend="false"
tag_file="tags"
base_dir="."
exclude_dir=""

set -- `getopt ae: $*` 
 
if [ $? -ne 0 ]; then 
    echo "ftags.sh [-a] [-e exclude_dir] [base_dir]"
  exit 2 
fi 

while [ $# -gt 0 ]; do 
    case $1 in 
        -a) 
            apend="true"
            shift 
            ;; 
        -e) 
            exclude_dir=$2 
            shift 2 
            ;; 
        *)
            base_dir=$2
            shift 2
            break
            ;; 
    esac 
done 


if [ 'uname' == SunOS ] ; then
    if [ "$exclude_dir" != "" ]; then
        file_chs=`find $base_dir -name "*.[chs]" -or -name "*.cpp" \
                 | grep -v $exclude_dir`
    else
        file_chs=`find $base_dir -name "*.[chs]" -or -name "*.cpp"`
    fi
else
    if [ "$exclude_dir" != "" ]; then
        file_chs=`find $base_dir -name "*.[chs]" -or -name "*.cpp" \
                 | grep -v $exclude_dir`
    else
        file_chs=`find $base_dir -name "*.[chs]" -or -name "*.cpp"`
    fi
fi

if [ "$apend" == "false" ]; then
    /bin/rm -rf $tag_file
fi

for full_pass in $file_chs
do
    file=`echo $full_pass | sed 's/^.*\///'`
    echo "$file	$full_pass	1;\"	d" >> $tag_file
done

sort --output=$tag_file $tag_file
