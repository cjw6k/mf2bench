<?php

namespace Benchmark;

require 'vendor/autoload.php';

use Mf2;

for($idx = 0; $idx < $argv[3]; $idx++){
	$start = microtime(true);
	Mf2\parse( file_get_contents( $argv[1] ), $argv[2] );
	$end = microtime(true);
	echo floor(1000000 * ($end - $start)), "\n";
}
