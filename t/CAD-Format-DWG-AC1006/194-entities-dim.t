use strict;
use warnings;

use CAD::Format::DWG::AC1006;
use File::Object;
use Test::More 'tests' => 18;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/dim')->set;

# Test.
my $obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('DIM1.DWG')->s,
);
my $entity2 = $obj->entities->entities->[1];
isa_ok($entity2, 'CAD::Format::DWG::AC1006::Entity');
is($entity2->entity_type, 23, 'Get entity type (23).');
my $dim1_data = $entity2->data;
my $entity_common = $dim1_data->entity_common;
is($dim1_data->entity_layer_index, 0, 'Dim layer index (0).');
is($dim1_data->entity_size, 98, 'Entity size (98).');
is($dim1_data->block_index, 0, 'Block index (0).');
is($dim1_data->dimension_line_defining_point->x, 1.0, 'Dimension line defining point x (1.0).');
is($dim1_data->dimension_line_defining_point->y, -0.0969879154919123, 'Dimension line defining point y (-0.0969879154919123).');
is($dim1_data->dimension_line_defining_point->z, 0, 'Dimension line defining point z (0).');
is($dim1_data->default_text_position->x, 1.9, 'Default text position x (1.9).');
is($dim1_data->default_text_position->y, -0.09698791549191232, 'Default text position y (-0.09698791549191232).');
is($dim1_data->extension_defining_point1->x, 0, 'Extension defining point1 x (0).');
is($dim1_data->extension_defining_point1->y, 0, 'Extension defining point1 y (0).');
is($dim1_data->extension_defining_point1->z, 0, 'Extension defining point1 z (0).');
is($dim1_data->extension_defining_point2->x, 1.0, 'Extension defining point2 x (1.0).');
is($dim1_data->extension_defining_point2->y, 1.0, 'Extension defining point2 y (1.0).');
is($dim1_data->extension_defining_point2->z, 1.0, 'Extension defining point2 z (1.0).');
my $entities = @{$obj->entities->entities};
is($entities, 2, 'Number of entities (2).');
