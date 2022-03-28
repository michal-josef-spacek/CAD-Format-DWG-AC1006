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
is($obj->header->variables->surftype, 6, 'Surftype (6 - default).');

# Data directory.
$data_dir = File::Object->new->up->dir('data/header/surftype')->set;

# Test.
$obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('ST1.DWG')->s,
);
is($obj->header->variables->surftype, 2, 'Surftype (2).');
