package Correios::Store;

use Moose;
use MongoDB;
use MongoDB::OID;

has 'db' => (
    is      => 'ro',
    isa     => 'Object',
    default => sub {
        MongoDB::Connection->new( host => '127.0.0.1', port => 27017 );
    },
    lazy => 1
);

sub todos_elementos {
    shift->db->correios->registro->find( { enviado => 0 } );
}

sub procura_infos {
    my ( $self, $infs, $oid ) = @_;
    return $self->db->correios->infs->find_one(
        {
            data     => $infs->date,
            location => $infs->location,
            status   => $infs->status,
            extra    => $infs->extra,
            owner_id => $oid,
        }
    );
}

sub incluir_infos {
    my ( $self, $infs, $oid ) = @_;
    if ( !$self->procura_infos($infs) ) {
        $self->db->correios->infs->insert(
            {
                data      => $infs->date,
                location  => $infs->location,
                status    => $infs->status,
                extra     => $infs->extra,
                owner_oid => $oid,
            }
        );
        return 1;
    }
    else {
        return;
    }
}

sub update_infos {
    my ( $self, $oid ) = @_;
    print "OID => {$oid}\n";
    return $self->db->correios->registro->update(
        { _id    => MongoDB::OID->new( value => "$oid" ) },
        { '$set' => { enviado                => 1 } } );
}

1;
