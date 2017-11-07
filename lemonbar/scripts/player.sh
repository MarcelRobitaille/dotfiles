SOLID_BLOCK="━"
SHADE_BLOCK="╌"

INPUT="$(mpc status | sed '2q;d')"

STATUS="$(echo $INPUT | awk '{ print $1 }')"
STATUS="${STATUS:1:-1}"

PROGRESS="$(echo $INPUT | awk '{ print $4 }')"
PROGRESS="${PROGRESS:1:-2}"

FULL=$((PROGRESS / 2))
SHADE=$((50 - FULL))

if [[ $STATUS == "playing" ]];then
  ICON=''
  BAR="$(for i in `seq $FULL`; do echo -n $SOLID_BLOCK; done)|$(for i in `seq $SHADE`; do echo -n $SHADE_BLOCK; done)"
else
  ICON=''
  BAR=""
fi

TOGGLE="%{A:mpc -q toggle:} $ICON %{A}"
PREV="%{A:mpc -q prev:} %{A}"
NEXT="%{A:mpc -q next:} %{A}"

echo "$PREV$TOGGLE$NEXT $BAR"
