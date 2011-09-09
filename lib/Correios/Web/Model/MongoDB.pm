package Correios::Web::Model::MongoDB;

use Moose;
BEGIN { extends 'Catalyst::Model::MongoDB' }

__PACKAGE__->config(
    host           => '127.0.0.1',
    port           => '27017',
    dbname         => 'correios',
    collectionname => 'registro',
    gridfs         => '',
);

=head2 existe_cadastro 

Verifica se existe o cadastro

=cut

sub existe_cadastro {
    my ( $self, $email, $pedido ) = @_;
    return $self->c->find_one( { email => $email, pedido => $pedido } );
}

=head2 cadastrar

Cadastra os itens

=cut

sub cadastrar {
    my ( $self, $email, $pedido ) = @_;
    if ( !$self->existe_cadastro( $email, $pedido ) ) {
        $self->c->insert(
            { email => $email, pedido => $pedido, data => time } );
        return 1;
    }
    else { return }
}

=head1 NAME

Correios::Web::Model::MongoDB - MongoDB Catalyst model component

=head1 SYNOPSIS

See L<Correios::Web>.

=head1 DESCRIPTION

MongoDB Catalyst model component.

=head1 AUTHOR

Daniel Mantovani,,,,

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

no Moose;
__PACKAGE__->meta->make_immutable;

1;
