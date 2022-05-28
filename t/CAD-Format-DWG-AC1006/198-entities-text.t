use strict;
use warnings;

use CAD::Format::DWG::AC1006;
use File::Object;
use Test::More 'tests' => 11;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/text')->set;

# Test.
my $obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('TEXT1.DWG')->s,
);
my $entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1006::Entity');
is($entity1->entity_type, 7, 'Get entity type (7).');
my $text1_data = $entity1->data;
my $entity_common = $text1_data->entity_common;
is($entity_common->entity_layer_index, 0, 'Text layer index (0).');
is($entity_common->entity_size, 37, 'Entity size (37).');
is($text1_data->insert_point->x, 1, 'Text insert point x (1).');
is($text1_data->insert_point->y, 1, 'Text insert point y (1).');
is($text1_data->height, 0.2, 'Text height (0.2).');
is($text1_data->size, 3, 'Text size (3).');
is($text1_data->value, 'FOO', 'Text value (FOO).');
my $entities = @{$obj->entities->entities};
is($entities, 1, 'Number of entities (1).');
