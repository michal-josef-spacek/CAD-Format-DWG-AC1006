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
is($obj->header->variables->dim_text_vertical_position_size, 0,
	'Dimension text vertical position size (0 - default).');

# Data directory.
$data_dir = File::Object->new->up->dir('data/header/dim_text_vertical_position_size')->set;

# Test.
$obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('DTVPS1.DWG')->s,
);
is($obj->header->variables->dim_text_vertical_position_size, 1.2345,
	'Dimension text vertical position size (1.2345).');
