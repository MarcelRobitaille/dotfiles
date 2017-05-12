graph() {
  if (( $1 <= 12 )); then
    echo "▁"
  elif (( $1 <= 25 )); then
    echo "▂"
  elif (( $1 <= 37 )); then
    echo "▃"
  elif (( $1 <= 50 )); then
    echo "▄"
  elif (( $1 <= 62 )); then
    echo "▅"
  elif (( $1 <= 75 )); then
    echo "▆"
  elif (( $1 <= 87 )); then
    echo "▇"
  else
    echo "█"
  fi
}

while read -r line; do

  CPU_LOAD="$(echo $line | awk '{ print $1 }')"
  CPU_TEMP="$(echo $line | awk '{ print $6 }')"

  RAM="$(echo $line | awk '{ print $7 }')"

  GRAPHS=""

  echo $line | awk '{ print $1, $2, $3, $4 }' | tr ' ' '\n' |

  while read -r cpu; do
    GRAPHS="$GRAPHS $(graph $cpu)"
  done

  echo "CPU $CPU_LOAD% $CPU_TEMP°C $GRAPHS"
  echo "RAM $RAM% $(graph $RAM)"
done
