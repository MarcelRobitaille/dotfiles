while read -r line; do
  event="${line:0:22}"
  case "$event" in
    "Event 'change' on sink" | "Event 'remove' on sink")
      echo "V$(zsh $(dirname $0)/volume.sh)"
      ;;
  esac
done
