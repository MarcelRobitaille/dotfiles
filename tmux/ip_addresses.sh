for iface in $(ip addr list | awk -F': ' '/^[0-9]/ {print $2}'); do
	short=${iface:0:3}
	if [ $short = eth ] || [ $short = enp ] || [ $short = eno ] || [ $short = wlp ]; then
		ip=$(ip addr show dev $iface 2>/dev/null | awk '$1 == "inet" {split($2, a, "/"); print a[1]}' | xargs | tr ' ' '/')
		echo -n "#[bg=blue, fg=colour232, bold] $iface #[bg=default, fg=default, none]"
		[ "$ip" = "" ] && echo -n " down " || echo -n " $ip "
	fi
done
