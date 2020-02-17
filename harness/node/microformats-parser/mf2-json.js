var fs = require('fs');
var Microformats = require('microformat-node'), options = {};

fs.readFile(process.argv[2], 'utf8', function(err, contents){
	options.html = contents;
	options.baseUrl = process.argv[3];
	
	Microformats.get(options, function(err, data){
		console.log(JSON.stringify(data));
	});
});

