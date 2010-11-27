use strict;
use warnings;

package String::Trim;
BEGIN {
  $String::Trim::VERSION = '0.001';
}
# ABSTRACT: trim whitespace from your strings


use Exporter qw(import);
our @EXPORT = qw(trim trim2);


sub trim { # Startin point: http://www.perlmonks.org/?node_id=36684
    if (defined wantarray) {
        @_ = (@_ ? @_ : $_);
        if (ref $_[0] eq 'ARRAY') {
            @_ = @{ $_[0] };
            for (@_) { s{^\s+|\s+$}{}g if defined $_ }
            return \@_;
        }
        else {
            for (@_ ? @_ : $_) { s{^\s+|\s+$}{}g if defined $_ }
        }
        return wantarray ? @_ : $_[0];
    }
    else {
        if (ref $_[0] eq 'ARRAY') {
            for (@{ $_[0] }) { s{^\s+|\s+$}{}g if defined $_ }
        }
        else {
            for (@_ ? @_ : $_) { s{^\s+|\s+$}{}g if defined $_ }
        }
    }
}


1;



=pod

=encoding utf-8

=head1 NAME

String::Trim - trim whitespace from your strings

=head1 VERSION

version 0.001

=head1 SYNOPSIS

    use String::Trim;

    print "Do it? ";
    trim(my $response = <>);
    print "'$response'\n";

=head1 DESCRIPTION

C<String::Trim> trims whitespace off your strings. L<chomp> trims only C<$/> (typically,
that's newline), but C<trim> will trim all leading and trailing whitespace.

=head1 FUNCTIONS

=head2 trim

Returns the string with all leading and trailing whitespace removed. Trimming
undef gives you undef. Alternatively, you can trim in-place.

    my $var     = ' my string  ';
    my $trimmed = trim($var);
    # OR
    trim($var);

C<trim> also knows how to trim an array or arrayref:

    my @to_trim = (' one ', ' two ', ' three ');
    my @trimmed = trim(@to_trim);
    # OR
    trim(@to_trim);
    # OR
    my $trimmed = trim(\@to_trim);
    # OR
    trim(\@to_trim);

=head1 RATIONALE

C<trim> is often used by beginners, who may not understand how to spin their own. While
L<String::Util> does have a C<trim> function, it depends on L<Debug::ShowStuff>, which
depends on L<Taint>, which fails the test suite, and doesn't appear to be maintained.
This module installs, is actively maintained, and has no non-core dependencies.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit L<http://www.perl.com/CPAN/> to find a CPAN
site near you, or see L<http://search.cpan.org/dist/String-Trim/>.

The development version lives at L<http://github.com/doherty/String-Trim.git>
and may be cloned from L<git://github.com/doherty/String-Trim.git>.
Instead of sending patches, please fork this project using the standard
git and github infrastructure.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests through the web interface at
L<http://github.com/doherty/String-Trim/issues>.

=head1 CREDITS

This module was inspired by code at L<http://www.perlmonks.org/?node_id=36684> written
by japhy (Jeff Pinyan), dragonchild, and Aristotle. This Perl module was written by Mike
Doherty.

=head1 AUTHORS

=over 4

=item *

Mike Doherty <doherty@cpan.org>

=item *

Jeff Pinyan <pinyan@cpan.org>

=item *

Rob Kinyon <rkinyon@cpan.org>

=item *

Αριστοτέλης Παγκαλτζής (Aristotle Pagaltzis) <aristotle@cpan.org>

=back

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2010 by Mike Doherty.

This is free software, licensed under:

  The GNU General Public License, Version 3, June 2007

=cut


__END__
