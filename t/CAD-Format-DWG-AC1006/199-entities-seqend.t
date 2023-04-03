use strict;
use warnings;

use CAD::Format::DWG::AC1006;
use File::Object;
use Test::More 'tests' => 7;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/seqend')->set;

# Test.
note("File 'PL1.DWG'");
my $obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('PL1.DWG')->s,
);
my $entity4 = $obj->entities->entities->[3];
isa_ok($entity4, 'CAD::Format::DWG::AC1006::Entity');
is($entity4->entity_type, 17, 'Get entity type (17).');
my $seqend1_data = $entity4->data;
my $entity_common = $seqend1_data->entity_common;
is($seqend1_data->entity_layer_index, 0, 'Point layer index (0).');
is($seqend1_data->entity_size, 12, 'Entity size (12).');
is($seqend1_data->begin_addr, 0x512, 'Begin address of sequence (0x512).');
my $entities = @{$obj->entities->entities};
is($entities, 4, 'Number of entities (4).');
