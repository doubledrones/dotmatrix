alias swap_total="/usr/sbin/sysctl -n vm.swapusage | awk '{print \$3}' | cut -f 1 -d ."
