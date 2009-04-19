package Catalyst::Plugin::Loopback;

use base qw/Catalyst::Controller/;
use Data::Dumper ();
use Scalar::Util qw(weaken);

use strict;
our $VERSION = '1.00';

# this plugin mimicks a part of Catalyst's own test app, which
# spits back the request, serialized, as the response, for testing.

sub end : Private {
    my ( $self, $c ) = @_;

    my $reference = $c->request;
    my $context = delete $reference->{_context};
    my $body = delete $reference->{_body};

    my $dumper = Data::Dumper->new( [$reference] );
    $dumper->Indent(1);
    $dumper->Purity(1);
    $dumper->Useqq(0);
    $dumper->Deepcopy(1);
    $dumper->Quotekeys(0);
    $dumper->Terse(1);

    my $output = $dumper->Dump;

    $c->response->header( 'X-Catalyst-Plugins' => $c->registered_plugins );
    $c->res->headers->content_type('text/plain');
    $c->res->output($output);

    $reference->{_context} = $context;
    weaken( $reference->{_context} );
    $reference->{_body} = $body;
}

1;
