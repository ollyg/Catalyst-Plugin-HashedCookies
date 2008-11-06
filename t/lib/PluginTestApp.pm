package PluginTestApp;
use Test::More;

use Catalyst qw(
    Loopback
    HashedCookies
);

__PACKAGE__->config( hashedcookies => { key => 'abcdef0123456789ASDF' } );
__PACKAGE__->setup;

sub auto : Private {
    my ( $self, $c ) = @_;

    $c->stash->{'cookies'} = {
        Catalyst => { value => 'Cool',     path => '/' }, 
        Cool     => { value => 'Catalyst', path => '/' },
        CoolCat  => { value => {'Cool' => 'Catalyst'}, path => '/' },
        BadCat   => { value => {'_hashedcookies_meoww' => 'Catalyst'}, path => '/' },
    };
}

sub default : Private {
    my ( $self, $c ) = @_;
    my %cookies = %{$c->stash->{'cookies'}};

    # we're testing cookies, here, so this is a little ditty to
    # set them for us, based on what url path was requested
    
    for (split '/', $c->req->path) {
        $c->log->debug( "$_ => $cookies{ $_ }" ) if $c->debug;
        if (exists $cookies{ $_ } and defined $cookies{ $_ }) {
            $c->res->cookies->{ $_ } = $cookies{ $_ };
        }
    }
}
