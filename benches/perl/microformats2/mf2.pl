use Web::Microformats2;
use v5.10;
use Time::HiRes qw( clock_gettime CLOCK_REALTIME );

use Data::Dumper qw(Dumper);

my $html = do {
    local $/ = undef;
    open my $fh, "<", @ARGV[0]
        or die "could not open $file: $!";
    <$fh>;
};

my %options = (
	"url_context" => @ARGV[1]
);

for(my $idx = 0; $idx < @ARGV[2]; $idx++) {
	my $start = clock_gettime(CLOCK_REALTIME);
	my $mf2_parser = Web::Microformats2::Parser->new;
	my $mf2_doc    = $mf2_parser->parse( $html, %options );
	my $end = clock_gettime(CLOCK_REALTIME);
	printf("%u\n", ($end - $start) * 1000000);
}
