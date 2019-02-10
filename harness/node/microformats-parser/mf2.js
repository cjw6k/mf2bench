var fs = require('fs');
var Microformats = require('microformat-node'), options = {};

fs.readFile(process.argv[2], 'utf8', function(err, contents){
	options.html = contents;
	options.baseUrl = process.argv[3];
	
	for(var idx = 0; idx < process.argv[4]; idx++){
		start = process.hrtime();
		Microformats.get(options, function(err, data){
			end = process.hrtime();
			console.log(Math.floor((1000000000 * (end[0] - start[0]) + end[1] - start[1]) / 1000));
		});
	}
});

