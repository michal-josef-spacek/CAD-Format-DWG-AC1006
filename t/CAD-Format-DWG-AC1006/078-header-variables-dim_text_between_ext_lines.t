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
is($obj->header->variables->dim_text_between_ext_lines, 0,
	'Dimension text between extension lines (0 - off - default).');

# Data directory.
$data_dir = File::Object->new->up->dir('data/header/dim_text_between_ext_lines')->set;

# Test.
$obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('DTBEL1.DWG')->s,
);
is($obj->header->variables->dim_text_between_ext_lines, 1,
	'Dimension text between extension lines (1 - on).');
