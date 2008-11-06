#!perl

use strict;
use warnings FATAL => 'all';

use Test::More tests => 7;
use lib 't/lib';

# Tests for various ways in which setup() can complain or die

# no need for a die() here because Cat will do that for us
BEGIN { use_ok('Catalyst::Test', ('BasicTestApp')); }

{
    is( undef BasicTestApp->config->{hashedcookies}, undef,
        'Obliterate BasicTestApp\'s hash key and param defaults' );
    is( eval{ BasicTestApp->setup() }, undef,
        'Setup dies without a key' );

    ok( BasicTestApp->config->{hashedcookies}->{key} = 'abcdef0123456789ASDF',
        'Re-set key to keep HashedCookies quiet' );
    isnt( BasicTestApp->setup(), undef,
        'Setup is happy with only a key set' );
        # FIXME perhaps the above isnt() check should be doing something smarter.
        # I've already been bitten by setup() in tests, as it changed return value.

    is( undef BasicTestApp->config->{hashedcookies}->{key}, undef,
        'Unset only the hash key, leaving default params intact' );
    is( eval{ BasicTestApp->setup() }, undef,
        'Setup dies without a key (2)' );
}
