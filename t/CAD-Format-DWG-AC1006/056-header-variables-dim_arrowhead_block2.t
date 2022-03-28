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
my $dim_arrowhead_block2 = unpack 'Z*', $obj->header->variables->dim_arrowhead_block2;
is($dim_arrowhead_block2, '',
	'Dimension arrowhead block 2 (\'\' - default).');

# Data directory.
$data_dir = File::Object->new->up->dir('data/header/dim_arrowhead_block2')->set;

# Test.
$obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('DAB21.DWG')->s,
);
$dim_arrowhead_block2 = unpack 'Z*', $obj->header->variables->dim_arrowhead_block2;
is($dim_arrowhead_block2, 'DIM',
	'Dimension arrowhead block 2 (\'DIM\').');

# Test.
$obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('DAB22.DWG')->s,
);
$dim_arrowhead_block2 = unpack 'Z*', $obj->header->variables->dim_arrowhead_block2;
is($dim_arrowhead_block2, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ01234',
	'Dimension arrowhead block 2 (\'ABCDEFGHIJKLMNOPQRSTUVWXYZ01234\').');
