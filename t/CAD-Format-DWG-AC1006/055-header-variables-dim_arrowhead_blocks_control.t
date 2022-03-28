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
is($obj->header->variables->dim_arrowhead_blocks_control, 0, 'Dimension arrowhead block control (0 - off - default).');

# Data directory.
$data_dir = File::Object->new->up->dir('data/header/dim_arrowhead_blocks_control')->set;

# Test.
$obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('DS1.DWG')->s,
);
is($obj->header->variables->dim_arrowhead_blocks_control, 1, 'Dimension arrowhead block control (1 - on).');
