use strict;
use warnings;

use CAD::Format::DWG::AC1006;
use File::Object;
use Test::More 'tests' => 14;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/solid')->set;

# Test.
my $obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('SOLID1.DWG')->s,
);
my $entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1006::Entity');
is($entity1->entity_type, 11, 'Get entity type (11).');
my $solid1_data = $entity1->data;
my $entity_common = $solid1_data->entity_common;
is($entity_common->entity_layer_index, 0, 'Solid layer index (0).');
is($entity_common->entity_size, 72, 'Entity size (72).');
is($solid1_data->from->x, 0, 'Solid from x (0).');
is($solid1_data->from->y, 0, 'Solid from y (0).');
is($solid1_data->from_and->x, 0, 'Solid from and x (0).');
is($solid1_data->from_and->y, 1, 'Solid from and y (1).');
is($solid1_data->to->x, 1, 'Solid to x (1).');
is($solid1_data->to->y, 1, 'Solid to y (1).');
is($solid1_data->to_and->x, 1, 'Solid to and x (1).');
is($solid1_data->to_and->y, 0, 'Solid to and y (0).');
my $entities = @{$obj->entities->entities};
is($entities, 1, 'Number of entities (1).');
