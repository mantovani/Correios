package Correios::Web::Controller::Rastreamento;
use Moose;
use namespace::autoclean;
use Data::Validate::Email qw/is_email/;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Correios::Web::Controller::Rastreamento - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

sub base : Chained('/') : PathPart('rastreamento') : CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub cadastro : Chained('base') : PathPart('cadastro') : Args(0) {
    my ( $self, $c ) = @_;
    if ( $c->req->body_params->{pedido} && $c->req->body_params->{'email'} ) {
        my $params = $c->req->body_params;
        if (   length( $params->{email} ) > 500
            || length( $params->{pedido} ) > 500 )
        {
            $c->stash->{error} =
              'O m&aacute;ximo de catecteres permitido &eacute; de 500 =/';
            $c->stash->{template} = 'index.tt';
            return;
        }
        unless ( is_email( $params->{email} ) ) {
            $c->stash->{error}    = 'O Email n&atilde;o parece um email =/';
            $c->stash->{template} = 'index.tt';
            return;
        }

        my $pedido = $params->{pedidos};
        $pedido =~ s/\s//g;
        if ( $pedido =~ /,/ ) {
            my @pedidos = split /,/, $pedido;
        }

    }
    else {
        $c->stash->{error}    = 'Email ou Pedido inv&aacute;lido.';
        $c->stash->{template} = 'index.tt';
        return;
    }
}

=head1 AUTHOR

Daniel Mantovani,,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
