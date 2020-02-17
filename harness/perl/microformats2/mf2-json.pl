use Web::Microformats2;
use v5.10;

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

my $mf2_parser = Web::Microformats2::Parser->new;
my $mf2_doc    = $mf2_parser->parse( $html, %options );
printf("%s\n", $mf2_doc->as_json);
