#!/usr/bin/dash

while true; do

	BATTERYSTATE=$( acpi -b | awk '{ split($5,a,":"); print substr($3,0,2), $4, "["a[1]":"a[2]"]" }' | tr -d ',' )
	
	DATETIME=`date`

	xsetroot -name "${BATTERYSTATE} | ${DATETIME}" 
	sleep 10s
done 
