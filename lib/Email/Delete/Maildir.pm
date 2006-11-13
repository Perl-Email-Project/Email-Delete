package Email::Delete::Maildir;
# $Id: Maildir.pm,v 1.1 2004/12/17 18:03:16 cwest Exp $
use strict;

use vars qw[$VERSION];
$VERSION = sprintf "%d.%02d", split m/\./, (qw$Revision: 1.1 $)[1];

use File::Find::Rule;
use Email::Simple;

sub delete_message {
    my %args = @_;
    
    my @files = File::Find::Rule->file
                                ->grep(sub {
                                            local $_ = shift;
                                            local *MSG;
                                            open MSG, $_ or return;
                                            my $msg = Email::Simple->new(do{
                                               local $/; <MSG>;
                                            });
                                            close MSG;
                                            $args{matching}->($msg);
                                          })
                                ->in($args{from});
    return unlink @files;
}

1;

__END__

=head1 NAME

Email::Delete::Maildir - Delete Messages from a Maildir Folder

=head1 SYNOPSIS

  use Email::Delete qw[delete_message];
  
  my $message_id = shift @ARGV;
  
  delete_messages from     => 'some/Maildir/',
                  matching => sub {
                      my $message = shift;
                      $message->header('Message-ID') =~ $message_id;
                  };

=head1 DESCRIPTION

This software will delete messages from a given Maildir folder.

=head1 SEE ALSO

L<Email::Delete>,
L<perl>.

=head1 AUTHOR

Casey West, <F<casey@geeknest.com>>.

=head1 COPYRIGHT

  Copyright (c) 2004 Casey West.  All rights reserved.
  This module is free software; you can redistribute it and/or modify it
  under the same terms as Perl itself.

=cut
