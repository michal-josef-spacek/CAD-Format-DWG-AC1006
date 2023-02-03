use strict;
use warnings;

use CAD::Format::DWG::AC1006;
use File::Object;
use Test::More 'tests' => 11;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/arc')->set;

# Test.
my $obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('ARC1.DWG')->s,
);
my $entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1006::Entity');
is($entity1->entity_type, 8, 'Get entity type (8).');
my $arc1_data = $entity1->data;
my $entity_common = $arc1_data->entity_common;
is($arc1_data->entity_layer_index, 0, 'Arc layer index (0).');
is($arc1_data->entity_size, 48, 'Entity size (48).');
is($arc1_data->center_point_x, 9, 'Start point of arc x (9).');
is($arc1_data->center_point_y, -8, 'Start point of arc y (-8).');
is($arc1_data->radius, 12.0415945787923, 'Radius of arc (12.0415945787923).');
is($arc1_data->angle_from, 1.48765509490646, 'Angle from of arc (1.48765509490646).');
is($arc1_data->angle_to, 2.41495031290807, 'Angle to of arc (2.41495031290807).');
my $entities = @{$obj->entities->entities};
is($entities, 1, 'Number of entities (1).');
