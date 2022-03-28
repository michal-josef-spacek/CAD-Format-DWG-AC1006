use strict;
use warnings;

use CAD::Format::DWG::AC1006;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/blank')->set;

# Test.
my $obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
is($obj->header->variables->dim_tofl, 0, 'Dimension tofl (0 - imperial - default).');

# Data directory.
$data_dir = File::Object->new->up->dir('data/header/dim_tofl')->set;

# Test.
$obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('DIMTOFL1.DWG')->s,
);
is($obj->header->variables->dim_tofl, 1, 'Dimension tofl (1 - metric).');
