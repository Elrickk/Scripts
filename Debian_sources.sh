 #!/bin/bash

    deblist="/var/cache/deblist"
    temp_file="/tmp/policy"

    update() {
    if [ `id -u` -ne 0 ]; then echo "Vous devez être ROOT"; exit 1; fi
    rm -f "$deblist" > /dev/null;
    for i in `dpkg -l | grep ^ii | awk '{print $2}'` ; do
        apt-cache policy $i  > "$temp_file"
        let j=`cat -n $temp_file | grep 100\ \/var\/lib\/dpkg\/status | awk '{print $1}'`-1;
        echo "$i: `cat -n $temp_file | sed -n "$j"p | awk '{print $3" "$4" "$5" "$6}'`" >> "$deblist";
    done
    rm -f "$temp_file" > /dev/null;
    }

    if [ ! -f $deblist ] && [ "$1" != "-u" ]; then
        echo "Veuillez faire '`basename $0` -u' SVP";
        exit 1;
    fi

    case $1 in
        -h)
            echo "Usage: `basename $0` -u   : met à jour la base de donnée (root)"
            echo "       `basename $0`  : affiche la base de donnée"
            exit 0;
            ;;
        -u)
            update
            exit 0
            ;;
        *)
            cat "$deblist"
            ;;
    esac

