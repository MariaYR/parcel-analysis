#!/usr/bin/bash
# Called: $ convert_fixed_width_to_csv.sh data_dict.csv field_widths_index fw_data_file.csv

# e.g., python field_widths.py ~/Downloads/RealtyTrac/REALTYTRAC_DLP_3.0_Recorder_Layout.csv 4
# As the index of the field length colum is 4
FIELDWIDTHS=$(python field_widths.py $1 $2)

# First part parses fixed width; second part removes trailing comma
gawk '$1=$1' FIELDWIDTHS="$FIELDWIDTHS" OFS=";" $3 | sed 's/ *; */;/g' - | awk '{print substr($0, 0, length($0)-1)}'