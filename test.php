<?php
require 'vendor/autoload.php';
// code which uses things declared in the "lib/Foo.php" or "lib/Bar.php" file
use rannmann\PhpIpfsApi\IPFS;
// connect to ipfs daemon API server
$ipfs = new IPFS("localhost", 8080, 5001); // leaving out the arguments will de$
$hash = $ipfs->add("Hello world");
echo $hash;
$str=$ipfs->get($hash);

echo "<BR>=======<BR>";
echo $str;

echo "<BR>=======<BR>";
?>
