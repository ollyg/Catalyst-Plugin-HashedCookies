use inc::Module::Install 0.67;
perl_version '5.008001';
  
name        'Catalyst-Plugin-HashedCookies';
all_from    'lib/Catalyst/Plugin/HashedCookies.pm';

requires    'Catalyst::Runtime' => '5.70';
requires    'Class::Accessor::Fast' => 0;
requires    'Tie::IxHash' => 0;
requires    'Digest::HMAC_SHA1' => 0;
requires    'Digest::HMAC_MD5' => 0;
requires    'CGI::Simple::Cookie' => 0;
requires    'MRO::Compat' => 0;

if (can_use('Catalyst::Runtime', '5.8')) {
    requires 'MooseX::Adopt::Class::Accessor::Fast' => 0.007;
}

test_requires  'Test::More' => 0;
test_requires  'Test::Pod' => 0;
test_requires  'Test::Pod::Coverage' => 0;

WriteAll;
