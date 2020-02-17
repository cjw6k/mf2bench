<?php

namespace Benchmark;

require 'vendor/autoload.php';

use Mf2;

echo json_encode( Mf2\parse( file_get_contents( $argv[1] ), $argv[2] ) );
