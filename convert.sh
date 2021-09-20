#!/bin/sh

KSY_FILE=dwg_ac1006.ksy
OUTPUT_PM_FILE=AC1006.pm

ksc -t perl $KSY_FILE
mv DwgAc1006.pm $OUTPUT_PM_FILE
sed -i s/DwgAc1006/CAD::Format::DWG::AC1006/g $OUTPUT_PM_FILE
