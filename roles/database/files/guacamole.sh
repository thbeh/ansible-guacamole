#!/bin/bash

echo "SELECT connection_name FROM guacamole_connection" | mysql -u root salsa | grep -v connection_name | grep -v SSH > /tmp/ADDRESSES.txt

while read addr; do
	/bin/ping -c1 -w1 $addr
	if [ $? -ne 0 ]; then
		echo "DELETE FROM guacamole_connection where connection_name='$addr'" | mysql -u root salsa
		echo "DELETE FROM guacamole_connection where connection_name='$addr-SSH'" | mysql -u root salsa
	fi
done </tmp/ADDRESSES.txt

rm /tmp/ADDRESSES.txt
