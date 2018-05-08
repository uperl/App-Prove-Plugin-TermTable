package App::Prove::Plugin::TermTable;

use strict;
use warnings;
use 5.008001;
use Term::Size::Any qw( chars );

# ABSTRACT: Set the size of the console for Term::Table
# VERSION

sub load
{
  my($class, $p) = @_;
  return if $ENV{TERM_TABLE_SIZE};
  open FP, '>', '/dev/tty';
  $ENV{TERM_TABLE_SIZE} = chars(*FP);
  close FP;
}

1;
