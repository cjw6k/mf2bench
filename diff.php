#!/usr/bin/env php
<?php

foreach(glob('var/sources/*/') as $source){
	foreach(glob($source . '*/*/json') as $json){
		$parses[substr($source, 12, -1)][substr($json, strlen($source), -5)] = json_decode(file_get_contents($json), true);
	}
}

$invalid_mf2_json = array();
foreach($parses as $url => $parse_set){
	
	// if($url != 'microformats.org') continue;
	
	$rels_anonymous = array();
	
	foreach($parse_set as $parser => $result){
		
		// Collecting Common Rels		
		if(!isset($result['rels'])){
			$invalid_mf2_json[$url][$parser] = true;
			continue;
		}
		
		if($parser == 'haskell/microformats2-parser'){
			$invalid_mf2_json[$url][$parser] = true;
			continue;
		}

		$serial = array();
		foreach($result['rels'] as $rel => $rel_url){
			$serial[$rel] = serialize($rel_url);
		}
		$rels_anonymous[] = $serial;
		
		$rels_serial[$parser] = $serial;		
		$rels[$parser] = $result['rels'];		
	}
	
	echo $url, PHP_EOL;
	$rels_common = array_intersect(...$rels_anonymous);
	// var_dump($rels_common);
	// foreach($rels_anonymous as $anon){
		// var_dump($anon['stylesheet']);
	// }
	
	foreach($parse_set as $parser => $result){
		if($parser == 'haskell/microformats2-parser'){
			continue;
		}		
		echo $parser, PHP_EOL;
		var_dump(array_diff($rels_serial[$parser], $rels_common));		
	}
}

if(!empty($invalid_mf2_json)){
	echo "Invalid MF2 JSON output found:", PHP_EOL;
	var_dump($invalid_mf2_json);
}