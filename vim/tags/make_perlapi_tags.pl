use strict;
use warnings;
use Path::Class;

my $perlapi = `perldoc -ml perlapi`;
chomp $perlapi;

my $io = file($perlapi)->openr;
my $line_number = 1;
my @lines;
while ( my $line = <$io> ) {
    if ( $line =~ /=item (.+)/ ) {
        my $keyword = $1;
        push @lines, "$keyword\t$perlapi\t$line_number\n";
    }
    $line_number++;
}

for my $line ( sort @lines ) {
    print $line;
}

