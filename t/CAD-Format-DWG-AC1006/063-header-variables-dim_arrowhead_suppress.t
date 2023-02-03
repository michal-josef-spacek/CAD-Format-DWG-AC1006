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
is($obj->header->variables->dim_arrowhead_suppress, 0, 'Dimension arrowhead suppresss (0 - off - default).');

# Data directory.
$data_dir = File::Object->new->up->dir('data/header/dim_arrowhead_suppress')->set;

# Test.
$obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('DAS1.DWG')->s,
);
is($obj->header->variables->dim_arrowhead_suppress, 1, 'Dimension arrowhead suppresss (1 - on).');
