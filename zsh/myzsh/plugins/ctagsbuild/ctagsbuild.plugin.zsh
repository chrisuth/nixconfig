



function ctagsAddOnePath() {
  if (( $# < 2 )); then
      echo "ctagsAddOnePath path"
      return
  fi

  echo "create tags : ctags --append -f $1 $2"
  ctags --append -f $1 $2
}

function ctagsex() {
    local CTAGSPATH=$HOME/.ctags_tags
    local alltags="$CTAGSPATH/alltags"
    local liblist="$CTAGSPATH/liblist.txt"

    if (( $# == 0 )); then
        echo "Usage: ctagsex [option]"
        echo
        echo Options:
        echo "      build   :   rebuild $alltags"
        echo "      add     :   add \`pwd\` to $liblist and rebuild"
        echo "      clear   :   clear [ $liblist ]"
        echo "      show    :   show [ $liblist ]"
        echo
    fi


    if [ -f $CTAGSPATH ];then
        echo "$CTAGSPATH not a path"
    fi

    mkdir -p $CTAGSPATH

    if [ -f $alltags ];then
        rm $alltags
    fi

    case $1 in
        build)
            if [ ! -f $liblist ];then
                echo "No Lib List File [$liblist]"
                return
            fi

            cat $liblist | while read line;do
                ctagsAddOnePath $alltags $line
            done
            ;;
        add)
            local tmpfile="/tmp/ctagsex_$$"
            (echo `pwd` && cat $liblist) | sort | uniq > $tmpfile
            mv $tmpfile $liblist
            ctagsex build
            ;;
        clear)
            echo > $liblist
            ;;
        show)
            cat $liblist
            ;;
        *)
            echo "ctagex [build|add|clear|show] ... "
            ;;
    esac
}

