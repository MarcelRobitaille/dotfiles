STATUS="$(mpc status | sed '2q;d' | awk '{ print $1 }')"
if [[ "$STATUS" == "[playing]" ]]; then
  echo " $(mpc current | trunc 45)"
fi
