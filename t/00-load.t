#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'AnyEvent::XMLRPC' );
}

diag( "Testing AnyEvent::XMLRPC $AnyEvent::XMLRPC::VERSION, Perl $], $^X" );
