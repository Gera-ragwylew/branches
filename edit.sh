#!bin/bash
read path

if [ -z "$path" ];then
    echo "Вы ввели пустую строку"
    exit 1
fi

read define_stroke
if [ -z "$define_stroke" ];then
    echo "Вы ввели пустую строку"
    exit 1
fi

read set_stroke
if [ "$define_stroke" == "" ];then
    echo "Вы ввели пустую строку"
    exit 1
fi
if [ -e $path ]
then
    sed -i "s/$define_stroke/$set_stroke/g" $path
    echo "branchquest/$path - $(ls -l $path | awk '{print $5}') - $(date +%d-%m-%Y' '%H:%M) - $(shasum -a 256 $path | awk '{print $1}') - sha256" >> log.txt
else
    echo "ошибка"
fi