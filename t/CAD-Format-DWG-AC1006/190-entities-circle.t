use strict;
use warnings;

use CAD::Format::DWG::AC1006;
use File::Object;
use Test::More 'tests' => 18;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/circle')->set;

# Test.
my $obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('CIRCLE1.DWG')->s,
);
my $entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1006::Entity');
is($entity1->entity_type, 3, 'Get entity type (3).');
my $circle1_data = $entity1->data;
my $entity_common = $circle1_data->entity_common;
is($circle1_data->entity_layer_index, 0, 'Circle layer index (0).');
is($circle1_data->entity_size, 32, 'Entity size (32).');
is($circle1_data->center_point->x, 1, 'Circle center point x (1).');
is($circle1_data->center_point->y, 1, 'Circle center point y (1).');
is($circle1_data->radius, 1, 'Radius of circle (1).');
my $entities = @{$obj->entities->entities};
is($entities, 1, 'Number of entities (1).');

# Test.
$obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('CIRCLE2.DWG')->s,
);
$entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1006::Entity');
is($entity1->entity_type, 3, 'Get entity type (3).');
$circle1_data = $entity1->data;
$entity_common = $circle1_data->entity_common;
is($circle1_data->entity_layer_index, 0, 'Circle layer index (0).');
is($circle1_data->entity_size, 40, 'Entity size (40).');
is($circle1_data->center_point->x, 1, 'Circle center point x (1).');
is($circle1_data->center_point->y, 1, 'Circle center point y (1).');
is($circle1_data->center_point->z, 1, 'Circle center point z (1).');
is($circle1_data->radius, 1, 'Radius of circle (1).');
$entities = @{$obj->entities->entities};
is($entities, 1, 'Number of entities (1).');
