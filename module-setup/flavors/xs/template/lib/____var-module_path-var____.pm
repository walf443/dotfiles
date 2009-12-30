package [% module %];
use strict;
use warnings;
our $VERSION = '0.01';
our @ISA;

eval {
    require XSLoader;
    XSLoader::load(__PACKAGE__, $VERSION);
    1;
} or do {
    require DynaLoader;
    push @ISA, 'DynaLoader';
    __PACKAGE__->bootstrap($VERSION);
};

1;
__END__

=head1 NAME

[% module %] -

=head1 SYNOPSIS

  use [% module %];

=head1 DESCRIPTION

[% module %] is

=head1 AUTHOR

[% config.author %] E<lt>[% config.email %]E<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
