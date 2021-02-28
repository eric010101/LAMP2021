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
spawn sudo /usr/pgadmin4/bin/setup-web.sh
match_max 100000
expect "address:"
send -- "pengyauwang@hotmail.com\r"
expect "Password:"
send -- "Eric010101)!)!)!\r"
expect "Retype password:"
send -- "Eric010101)!)!)!\r"
expect "/pgadmin4. Do you wish to continue (y/n)?"
send -- "Y\r"
expect "pgAdmin 4 installation to complete. Continue (y/n)?"
send -- "Y\r"
expect eof
