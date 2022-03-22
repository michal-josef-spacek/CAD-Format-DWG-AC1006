use strict;
use warnings;

use CAD::Format::DWG::AC1006;
use File::Object;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/blank')->set;

# Test.
my $obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
is($obj->header->variables->dim_maximum_tolerance_limit, 0, 'Dimension maximum tolerance limit (0 - default).');
