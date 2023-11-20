use strict;
use warnings;

use CAD::Format::DWG::AC1006;
use File::Object;
use Test::More 'tests' => 8;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/jump')->set;

# Test.
my $obj = CAD::Format::DWG::AC1006->from_file(
	$data_dir->file('JUMP1.DWG')->s,
);
my $entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1006::Entity');
is($entity1->entity_type, 18, 'Get entity type (18 - jump).');
my $jump1_data = $entity1->data;
is($jump1_data->entity_size, 8, 'Entity size (8).');
is($jump1_data->address_raw, 0x80000000, 'Raw address for jump (0x80000000).');
is($jump1_data->address, 0, 'Address to jump (0).');
is($jump1_data->address_flag, 0x80, 'Address flag (0x80 - extra entities).');
my $entities = @{$obj->entities->entities};
is($entities, 7, 'Number of entities (7).');
