use strict;
use warnings;

use CAD::Format::DWG::AC1006;
use File::Object;
use Test::More 'tests' => 6;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/polyline2')->set;

# Test.
my $obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('PL1.DWG')->s,
);
my $entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1006::Entity');
is($entity1->entity_type, 19, 'Get entity type (19 - polyline2).');
my $pline1_data = $entity1->data;
my $entity_common = $pline1_data->entity_common;
is($entity_common->entity_layer_index, 0, 'Polyline 2 layer index (0).');
is($entity_common->entity_size, 8, 'Entity size (8).');
my $entities = @{$obj->entities->entities};
is($entities, 4, 'Number of entities (4).');
