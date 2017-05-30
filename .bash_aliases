# matlab
alias matlab='matlab -nodesktop'

#rviz
alias rviz='rosrun rviz rviz'

#targz
targz() {
        if [[ $1 == *".tar.gz"* ]]; then
            #entpacken
            a_dir=$2
            #check if second param exist
            if [[ -z "$2" ]]; then
                a_dir=`expr $1 : '\(.*\)\.tar\.gz'`
            fi
            #check if directory exist 
            if [[ ! -d "$a_dir" ]]; then
                mkdir "$a_dir"
            fi
            tar -xzf "$1" -C "$a_dir"
        elif [[ $2 == *".tar.gz"* ]]; then
            #verpacken
            
            tar -zcvf "$2" "$1"
        elif [[ ! -z "$1" ]]; then
            #verpacken 
            a_dir="${1%%.*}"
            if [[ ! -e "$a_dir.tar.gz" ]]; then
                tar -zcvf "$a_dir.tar.gz" "$1"
            else
                echo "Target targz already exists"
            fi
        fi
}

fzip() {
    if [[ $1 != *".zip"* ]]; then
        #verpacken zu 2
        d_dir=$2
        if [[ -z "$2" ]]; then
            d_dir="${1%%.*}"
        else 
            d_dir="${2%%.*}"
        fi
        if [[ ! -e "$d_dir.zip" ]]; then
            zip -r "$d_dir.zip" $1
        else
            echo "$d_dir.zip already exists"
        fi
    else 
        #entpacken zu 2
        d_dir=$2
        if [[ -z "$2" ]]; then
            unzip $1
        else
            if [[ ! -d "$d_dir" ]]; then
                unzip $1 -d "$d_dir"
            else
                echo "$d_dir already exists"
            fi
        fi
    fi
}
