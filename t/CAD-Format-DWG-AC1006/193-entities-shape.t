use strict;
use warnings;

use CAD::Format::DWG::AC1006;
use File::Object;
use Test::More 'tests' => 11;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/shape')->set;

# Test.
my $obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('SHAPE1.DWG')->s,
);
my $entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1006::Entity');
is($entity1->entity_type, 4, 'Get entity type (4).');
my $shape1_data = $entity1->data;
my $entity_common = $shape1_data->entity_common;
is($entity_common->entity_layer_index, 0, 'Shape layer index (0).');
is($entity_common->entity_size, 34, 'Entity size (34).');
is($shape1_data->x, 5, 'Shape x (5).');
is($shape1_data->y, 5, 'Shape y (5).');
is($shape1_data->height, 1, 'Shape height (1).');
is($shape1_data->item_num, 131, 'Shape item number index (5).');
is($shape1_data->load_num, 1, 'Shape load number index (1).');
my $entities = @{$obj->entities->entities};
is($entities, 1, 'Number of entities (1).');
