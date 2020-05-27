#check arp cache for suspect arp activity

mac='[0-9a-f]{2}:[0-9a-f]{2}:[0-9a-f]{2}:[0-9a-f]{2}:[0-9a-f]{2}:[0-9a-f]{2}'
resultat=$(arp -an | grep -o -E $mac | uniq -d | wc -l)

echo $resultat
if ! [ "$resultat" -eq "0" ]; then
    echo "SUSPICIOUS ARP ACTIVITY : $resultat MAC seem to be spoofed"
else
    echo "ARP CACHE SEEMS OK : $resultat MAC spoofed"
fi
