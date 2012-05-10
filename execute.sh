#!/bin/sh

export LANGUAGE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export PERL_MM_USE_DEFAULT=1;
export PERL_LOCAL_LIB_ROOT="/home/mantovani/perl5";
export PERL_MB_OPT="--install_base /home/mantovani/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/mantovani/perl5";
export PERL5LIB="/home/mantovani/perl5/lib/perl5/x86_64-linux-gnu-thread-multi:/home/mantovani/perl5/lib/perl5";
export PATH="/home/mantovani/perl5/bin:$PATH";

cd /home/mantovani/apps/Correios/
perl -Ilib script/verifica.pl
