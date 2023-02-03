use strict;
use warnings;

use CAD::Format::DWG::AC1006;
use File::Object;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/blank')->set;

# Test.
my $obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
my $dim_arrowhead_block1 = unpack 'Z*', $obj->header->variables->dim_arrowhead_block1;
is($dim_arrowhead_block1, '',
	'Dimension arrowhead block 1 (\'\' - default).');

# Data directory.
$data_dir = File::Object->new->up->dir('data/header/dim_arrowhead_block1')->set;

# Test.
$obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('DAB11.DWG')->s,
);
$dim_arrowhead_block1 = unpack 'Z*', $obj->header->variables->dim_arrowhead_block1;
is($dim_arrowhead_block1, 'DIM',
	'Dimension arrowhead block 1 (\'DIM\').');

# Test.
$obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('DAB12.DWG')->s,
);
$dim_arrowhead_block1 = unpack 'Z*', $obj->header->variables->dim_arrowhead_block1;
is($dim_arrowhead_block1, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ01234',
	'Dimension arrowhead block 1 (\'ABCDEFGHIJKLMNOPQRSTUVWXYZ01234\').');
