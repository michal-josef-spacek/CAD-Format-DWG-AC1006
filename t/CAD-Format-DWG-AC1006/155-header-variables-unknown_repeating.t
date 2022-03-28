use strict;
use warnings;

use CAD::Format::DWG::AC1006;
use File::Object;
use Test::More 'tests' => 19;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/blank')->set;

# Test.
my $obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
is($obj->header->variables->unknown_repeating->unknown_repeating1, '0', 'Unknown repeating 1 (0 - default).');
is($obj->header->variables->unknown_repeating->unknown_repeating2, '0', 'Unknown repeating 2 (0 - default).');
is($obj->header->variables->unknown_repeating->unknown_repeating3, '0', 'Unknown repeating 3 (0 - default).');
is($obj->header->variables->unknown_repeating->unknown_repeating4, '0', 'Unknown repeating 4 (0 - default).');
is($obj->header->variables->unknown_repeating->unknown_repeating5, '0', 'Unknown repeating 5 (0 - default).');
is($obj->header->variables->unknown_repeating->unknown_repeating6, '0', 'Unknown repeating 6 (0 - default).');
is($obj->header->variables->unknown_repeating->unknown_repeating7, '0', 'Unknown repeating 7 (0 - default).');
is($obj->header->variables->unknown_repeating->unknown_repeating8, '0', 'Unknown repeating 8 (0 - default).');
is($obj->header->variables->unknown_repeating->unknown_repeating9, '0', 'Unknown repeating 9 (0 - default).');
is($obj->header->variables->unknown_repeating->unknown_repeating10, '0', 'Unknown repeating 10 (0 - default).');
is($obj->header->variables->unknown_repeating->unknown_repeating11, '0', 'Unknown repeating 11 (0 - default).');
is($obj->header->variables->unknown_repeating->unknown_repeating12, '0', 'Unknown repeating 12 (0 - default).');
is($obj->header->variables->unknown_repeating->unknown_repeating13, '0', 'Unknown repeating 13 (0 - default).');
is($obj->header->variables->unknown_repeating->unknown_repeating14, '0', 'Unknown repeating 14 (0 - default).');
is($obj->header->variables->unknown_repeating->unknown_repeating15, '0', 'Unknown repeating 15 (0 - default).');
is($obj->header->variables->unknown_repeating->unknown_repeating16, '0', 'Unknown repeating 16 (0 - default).');
is($obj->header->variables->unknown_repeating->unknown_repeating17, '0', 'Unknown repeating 17 (0 - default).');
is($obj->header->variables->unknown_repeating->unknown_repeating18, '0', 'Unknown repeating 18 (0 - default).');
