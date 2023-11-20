use strict;
use warnings;

use CAD::Format::DWG::AC1006;
use File::Object;
use Test::More 'tests' => 14;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/vertex')->set;

# Test.
my $obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('PL1.DWG')->s,
);
my $entity2 = $obj->entities->entities->[1];
isa_ok($entity2, 'CAD::Format::DWG::AC1006::Entity');
is($entity2->entity_type, 20, 'Get entity type (20).');
my $vertex1_data = $entity2->data;
my $entity_common = $vertex1_data->entity_common;
is($vertex1_data->entity_layer_index, 0, 'Vertex layer index (0).');
is($vertex1_data->entity_size, 24, 'Entity size (24).');
is($vertex1_data->x, 0, 'Vertex #1 start point x (0).');
is($vertex1_data->y, 0, 'Vertex #1 start point y (0).');
my $entity3 = $obj->entities->entities->[2];
isa_ok($entity3, 'CAD::Format::DWG::AC1006::Entity');
is($entity3->entity_type, 20, 'Get entity type (20).');
my $vertex2_data = $entity3->data;
$entity_common = $vertex2_data->entity_common;
is($vertex2_data->entity_layer_index, 0, 'Vertex layer index (0).');
is($vertex2_data->entity_size, 24, 'Entity size (24).');
is($vertex2_data->x, 1, 'Vertex #2 start point x (1).');
is($vertex2_data->y, 1, 'Vertex #2 start point y (1).');
my $entities = @{$obj->entities->entities};
is($entities, 4, 'Number of entities (4).');
