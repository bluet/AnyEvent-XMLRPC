use inc::Module::Install;

name     'AnyEvent-XMLRPC';
all_from 'lib/AnyEvent/XMLRPC.pm';
author   'BlueT - Matthew Lien - 練喆明 <BlueT@BlueT.org>';

build_requires 'Test::More';

auto_install;

WriteAll;

