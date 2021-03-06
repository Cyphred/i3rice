# !/bin/sh
_set_custom_dns() {
chattr -i /etc/resolv.conf
	printf "# Generated by set-dns-servers.sh from Cyphred's arch install scripts\nnameserver\t8.8.8.8\nnameserver\t8.8.4.4\n" > /etc/resolv.conf || exit 1
chattr +i /etc/resolv.conf
}

_set_default_dns() {
chattr -i /etc/resolv.conf
	printf "# Generated by set-dns-servers.sh from Cyphred's arch install scripts\nnameserver\t192.168.1.1\n" > /etc/resolv.conf || exit 1
chattr +i /etc/resolv.conf
}

# Set the file attribute to immutable so that it can't be overwritten
[ "$EUID" != 0 ] && echo "Missing root privileges." && exit 1
printf "Choose DNS mode:\n1) default\t2) custom\nSelection: "
read choice
case $choice in
	1) _set_default_dns ;;
	2) _set_custom_dns ;;
	*) exit 1 ;;
esac
