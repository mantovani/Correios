#!/usr/bin/perl

use strict;
use warnings;
use Correios::Verifica;

my $vr = Correios::Verifica->new;
$vr->pegar_status;
