function cols {
  awk -v col=$1 '{print $col}'
}

function mcd() {
    mkdir $1 && cd $1
}
