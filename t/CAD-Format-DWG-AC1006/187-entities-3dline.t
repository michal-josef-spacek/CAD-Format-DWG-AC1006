use strict;
use warnings;

use CAD::Format::DWG::AC1006;
use File::Object;
use Test::More 'tests' => 12;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/3dline')->set;

# Test.
my $obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('3DLINE1.DWG')->s,
);
my $entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1006::Entity');
is($entity1->entity_type, 21, 'Get entity type (21).');
my $line3d1_data = $entity1->data;
my $entity_common = $line3d1_data->entity_common;
is($line3d1_data->entity_layer_index, 0, '3d line layer index (0).');
is($line3d1_data->entity_size, 57, 'Entity size (57).');
is($line3d1_data->x1, 0, 'Start point of 3d line x (0).');
is($line3d1_data->y1, 0, 'Start point of 3d line y (0).');
is($line3d1_data->z1, 0, 'Start point of 3d line z (0).');
is($line3d1_data->x2, 1, 'End point of 3d line x (1).');
is($line3d1_data->y2, 1, 'End point of 3d line y (1).');
is($line3d1_data->z2, 1, 'End point of 3d line z (1).');
my $entities = @{$obj->entities->entities};
is($entities, 1, 'Number of entities (1).');
