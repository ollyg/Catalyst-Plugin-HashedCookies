use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Catalyst::Plugin::HashedCookies',
    AUTHOR              => 'Oliver Gorwits <oliver.gorwits@oucs.ox.ac.uk>',
    VERSION_FROM        => 'lib/Catalyst/Plugin/HashedCookies.pm',
    ABSTRACT_FROM       => 'lib/Catalyst/Plugin/HashedCookies.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Catalyst' => '5.7000',
        'Class::Accessor::Fast' => 0,
        'Tie::IxHash' => 0,
        'NEXT' => 0,
        'Digest::HMAC_SHA1' => 0,
        'Digest::HMAC_MD5' => 0,
    },
    LICENSE             => 'GPL',
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Catalyst-Plugin-HashedCookies-*' },
);
