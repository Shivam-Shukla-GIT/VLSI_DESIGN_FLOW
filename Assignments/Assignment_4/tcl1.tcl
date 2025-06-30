read_liberty NangateOpenCellLibrary_typical.lib
read_verilog circuit1.v
link_design circuit1
read_sdc const1.sdc

puts "\nSetup Path Analysis:"
report_checks -from [get_pins f1/Q] -to [get_pins f2/D] -path_delay max -fields {slack arrival required}

# Report hold path
puts "\nHold Path Analysis:"
report_checks -from [get_pins f1/Q] -to [get_pins f2/D] -path_delay min -fields {slack arrival required}