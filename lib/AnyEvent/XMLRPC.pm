package AnyEvent::XMLRPC;

use common::sense;
# roughly the same as, with much lower memory usage:
#
# use strict qw(vars subs);
# use feature qw(say state switch);
# no warnings;

use encoding 'utf8';
use Data::Dumper;
use Frontier::RPC2;
use HTTP::Response;

use base qw(AnyEvent::HTTPD);

=head1 NAME

AnyEvent::XMLRPC - Non-Blocking XMLRPC. Originally a AnyEvent implementation of Frontier.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use AnyEvent::XMLRPC;

    my $foo = AnyEvent::XMLRPC->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 FUNCTIONS

=head2 function1

=cut


sub new {
	#~ my $class = shift;
	#~ print Dumper $class;
	#~ my $self = AnyEvent::HTTPD->new (@_);
	my $class = shift; my %args = @_;
	my $methods = delete $args{'methods'};
	my $self = $class->SUPER::new(%args);
	return undef unless $self;
    
	bless $self, $class;
	
	${$self}{'methods'} = $methods;
	${$self}{'decode'} = new Frontier::RPC2 'use_objects' => $args{'use_objects'};
	#~ ${*$self}{'response'} = new HTTP::Response 200;
	#~ ${*$self}{'response'}->header('Content-Type' => 'text/xml');
    
	$self->reg_cb (
		#~ '/' => sub {
			#~ my ($httpd, $req) = @_;
			
			#~ $req->respond ({ content => ['text/html',
				#~ "<html><body><h1>Hello World!</h1>"
				#~ . "<a href=\"/test\">another test page</a>"
				#~ . "</body></html>"
			#~ ]});
		
			#~ $httpd->stop_request;
		#~ },
		'/RPC2' => sub {
			my ($httpd, $req) = @_;
			
			
			#~ ${*$self}{'response'}->content(
				#~ ${*$self}{'decode'}->serve(
					#~ $req->content, ${*$self}{'methods'}
				#~ )
			#~ );
			my $reply = ${$self}{'decode'}->serve(
					$req->content, ${$self}{'methods'}
			);
			
			
			#~ $conn->send_response(${*$self}{'response'});
			
			$req->respond ({ content => ['text/xml',
				$reply
			]});
			
			
			$httpd->stop_request;
		},
		#~ '' => sub {
			#~ $req->respond ({ content => ['text/html',
				#~ "ERROR"
			#~ ]});
		#~ },
	);

	return $self;
}


=head2 function2

=cut

sub function2 {
}

=head1 AUTHOR

BlueT - Matthew Lien - 練喆明, C<< <BlueT at BlueT.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-anyevent-xmlrpc at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=AnyEvent-XMLRPC>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc AnyEvent::XMLRPC


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=AnyEvent-XMLRPC>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/AnyEvent-XMLRPC>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/AnyEvent-XMLRPC>

=item * Search CPAN

L<http://search.cpan.org/dist/AnyEvent-XMLRPC>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2009 BlueT - Matthew Lien - 練喆明, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of AnyEvent::XMLRPC
