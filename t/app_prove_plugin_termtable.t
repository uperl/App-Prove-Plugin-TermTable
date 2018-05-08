use Test2::V0 -no_srand => 1;
use App::Prove::Plugin::TermTable;
use Test2::Mock;

delete $ENV{TERM_TABLE_SIZE};

my $mock = Test2::Mock->new( class => 'App::Prove::Plugin::TermTable' );

$mock->override('chars' => sub { 128 });

subtest 'prefer existing environment variable' => sub {

  local $ENV{TERM_TABLE_SIZE} = 90;
  
  App::Prove::Plugin::TermTable->load;
  
  is $ENV{TERM_TABLE_SIZE}, 90;

};

subtest 'prefer existing environment variable' => sub {

  App::Prove::Plugin::TermTable->load;
  
  is $ENV{TERM_TABLE_SIZE}, 128;

};

done_testing;
