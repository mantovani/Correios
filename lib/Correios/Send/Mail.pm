package Correios::Send::Mail;

use Moose;

use Mail::Send;
has 'mail' => (
    is      => 'ro',
    isa     => 'Object',
    default => sub { Mail::Send->new }
);

sub enviar {
    my ( $self, $mail, $infs, $pedido ) = @_;
    my ( $data, $local, $status, $extra ) =
      ( $infs->data, $infs->local, $infs->status, $infs->extra );

    my $msg = $self->mail;
    $msg->to($mail);
    $msg->subject("Seu pedido: $pedido mudou!");

    my $fh = $msg->open('sendmail');    # explicit

    my $resposta = <<FOO;
O status do seu pedido: $pedido foi alterado,

Status: $status
Data: $data
Local: $local
Extra: $extra

FOO

    print $fh $resposta;
    $fh->close;

}

1;
