use strict;
use warnings;

use CAD::Format::DWG::AC1006;
use File::Object;
use Test::More 'tests' => 26;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/insert')->set;

# Test.
my $obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('INSERT1.DWG')->s,
);
my $entity2 = $obj->entities->entities->[1];
isa_ok($entity2, 'CAD::Format::DWG::AC1006::Entity');
is($entity2->entity_type, 14, 'Get entity type (14).');
my $insert1_data = $entity2->data;
my $entity_common = $insert1_data->entity_common;
is($insert1_data->entity_layer_index, 0, 'Insert layer index (0).');
is($insert1_data->entity_size, 58, 'Entity size (58).');
is($insert1_data->block_index, 0, 'Insert block index (0).');
is($insert1_data->x, 2, 'Insert point x (2).');
is($insert1_data->y, 2, 'Insert point y (2).');
is($insert1_data->x_scale, 0.5, 'Insert x scale (0.5).');
is($insert1_data->y_scale, 0.5, 'Insert y scale (0.5).');
is($insert1_data->rotation_angle_in_radians, 0.5235987755982988, 'Insert rotation (0.5235987755982988).');
is($insert1_data->z_scale, 0.5, 'Insert z scale (0.5).');
my $entities = @{$obj->entities->entities};
is($entities, 2, 'Number of entities (2).');

# Test.
$obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('INSERT2.DWG')->s,
);
$entity2 = $obj->entities->entities->[1];
isa_ok($entity2, 'CAD::Format::DWG::AC1006::Entity');
is($entity2->entity_type, 14, 'Get entity type (14).');
$insert1_data = $entity2->data;
$entity_common = $insert1_data->entity_common;
is($insert1_data->entity_layer_index, 0, 'Insert layer index (0).');
is($insert1_data->entity_size, 66, 'Entity size (66).');
is($insert1_data->entity_elevation, 1, 'Entity elevation (1).');
is($insert1_data->block_index, 0, 'Insert block index (0).');
is($insert1_data->x, 2, 'Insert point x (2).');
is($insert1_data->y, 2, 'Insert point y (2).');
is($insert1_data->x_scale, 0.5, 'Insert x scale (0.5).');
is($insert1_data->y_scale, 0.5, 'Insert y scale (0.5).');
is($insert1_data->rotation_angle_in_radians, 0.5235987755982988, 'Insert rotation (0.5235987755982988).');
is($insert1_data->z_scale, 0.5, 'Insert z scale (0.5).');
$entities = @{$obj->entities->entities};
is($entities, 2, 'Number of entities (2).');
