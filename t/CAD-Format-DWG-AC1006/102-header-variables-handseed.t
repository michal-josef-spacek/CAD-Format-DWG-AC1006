use strict;
use warnings;

use CAD::Format::DWG::AC1006;
use File::Object;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data')->dir('blank')->set;

# Test.
my $obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
my $f = $obj->header->variables->handseed;
my $handseed = unpack 'H*', $obj->header->variables->handseed;
is($handseed, '0000000000000000', 'Handseed (0000000000000000 - default).');

# Data directory change.
$data_dir->up->dir('header')->dir('handseed')->set;

# Test.
$obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('HS1.DWG')->s,
);
$handseed = unpack 'H*', $obj->header->variables->handseed;
is($handseed, '0000000000000005', 'Handseed (0000000000000005).');

# Test.
$obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('HS2.DWG')->s,
);
$handseed = unpack 'H*', $obj->header->variables->handseed;
is($handseed, '1234567890abcdef', 'Handseed (1234567890abcdef).');
