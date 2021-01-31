#!/usr/bin/expect -f
set force_conservative 0  ;# set to 1 to force conservative mode even if
			  ;# script wasn't run conservatively originally
if {$force_conservative} {
	set send_slow {1 .1}
	proc send {ignore arg} {
		sleep .1
		exp_send -s -- $arg
	}
}
set timeout -1
spawn composer require rannmann/php-ipfs-api dev-master -d /var/www/html/ipfs-php
match_max 100000
expect "Continue as root/super user"
send -- "\r"
expect eof
