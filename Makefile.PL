use inc::Module::Install;

name     'AnyEvent-XMLRPC';
all_from 'lib/AnyEvent/XMLRPC.pm';
author   'BlueT - Matthew Lien - 練喆明 <BlueT@BlueT.org>';

requires 'AnyEvent::HTTPD'	=> 0.6;
requires 'Frontier::RPC2'	=> 0;
requires 'common::sense'	=> 0;


build_requires 'Test::More';

auto_install;

WriteAll;

