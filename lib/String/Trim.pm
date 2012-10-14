use strict;
use warnings;

package String::Trim;
BEGIN {
  $String::Trim::AUTHORITY = 'cpan:ABHIISNOT';
}
{
  $String::Trim::VERSION = '0.001';
}

# ABSTRACT: A module to experiment with dist zilla
use Carp;

sub new {
    my $class = shift;
    my $self = { string => shift, };
    return bless $self, $class;
}


sub string {
    my $self = shift;
    my $string = shift || $self->{string};
    return $string;
}


sub trim {
    my $self = shift;
    $self->{string} || carp 'No String Specified';
    $self->{string} =~ s/^\s+|\s+$//g;
    return $self->{string};
}

1;

__END__
=pod

=head1 NAME

String::Trim - A module to experiment with dist zilla

=head1 VERSION

version 0.001

=head1 METHODS

=head2 new

Simplistic constructor for this class.

=head2 string

A getter/setter method for our only variable.

=head2 trim

A method to trim a string.

=head1 AUTHOR

Abhishek Shende <abhishekisnot@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Abhishek Shende.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

