package Correios::Send::Mail;

use Moose;

use Mail::Send;
has 'mail' => (
    is      => 'ro',
    isa     => 'Object',
    default => sub { Mail::Send->new }
);

sub enviar {
    my ( $self, $mail, $infs ) = @_;
    my $msg = $self->mail;
    $msg->to($mail);
    $msg->subject('Seu status mudou!');

    my $fh = $msg->open('sendmail');    # explicit
    print $fh "O seu status foi alterado,
Status: $infs->status\n";
    $fh->close;
}

1;
