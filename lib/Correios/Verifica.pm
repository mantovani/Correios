package Correios::Verifica;

use Moose;

use Correios::Store;
use Correios::Send::Mail;
use WWW::Correios::SRO 'sro';

has 'correios_store' => (
    is      => 'ro',
    isa     => 'Object',
    default => sub { Correios::Store->new }
);

has 'csm' => (
    is      => 'ro',
    isa     => 'Object',
    default => sub { Correios::Send::Mail->new }
);

sub pegar_status {
    my $self   = shift;
    my $cursor = $self->correios_store->todos_elementos;
    while ( my $pedido = $cursor->next ) {
        my $ultimo;
        eval { $ultimo = sro( $pedido->{pedido} ) };
        next if $@ || !$ultimo;
        if ( $self->correios_store->incluir_infos( $ultimo, $pedido->{_id} ) ) {
            print "Enviar Email\n";
            $self->csm->enviar( $pedido->{email}, $ultimo, $pedido->{pedido} );
        }
    }
    return 1;
}

1;
