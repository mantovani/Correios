use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Correios::Web';
use Correios::Web::Controller::Rastreamento;

ok( request('/rastreamento')->is_success, 'Request should succeed' );
done_testing();
