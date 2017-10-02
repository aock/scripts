#for i in $(find -regex '.*/.*\.\(c\|cpp\|h\|hpp\|tcc\|txt\|cu\|cl\)$');
for i in $(git diff --name-only develop..dev-largescale);
do
    echo ${i}
    sed -i -e 's/\t/    /g' ${i}
    sed 's/ *$//' ${i}
    sed 's/[[:blank:]]*$//' ${i}
    sed -i 's/[ \t]*$//' ${i}
    printf %s "$(cat ${i})" > ${i}

    if ! [[ -z "$(tail -c 1 ${i})" ]] ;
    then
        sed -i -e '$a\' ${i}
    fi
done
