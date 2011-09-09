package Correios::Web::View::TT;

use strict;
use warnings;

use base 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die         => 1,
    INCLUDE_PATH       => [
        Correios::Web->path_to( 'root', 'src' ),
        Correios::Web->path_to( 'root', 'lib' )
    ],
    WRAPPER  => 'site/wrapper',
    ENCODING => 'utf8',
);

=head1 NAME

Correios::Web::View::TT - TT View for Correios::Web

=head1 DESCRIPTION

TT View for Correios::Web.

=head1 SEE ALSO

L<Correios::Web>

=head1 AUTHOR

Daniel Mantovani,,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
