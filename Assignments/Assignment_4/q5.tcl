read_liberty NangateOpenCellLibrary_typical.lib
read_verilog circuit2.v
link_design circuit2
read_sdc q5.sdc

puts "\nSetup Path Analysis:"
report_checks -from f1 -to f2 -path_delay max -fields {slack arrival required}

# Report hold path
puts "\nHold Path Analysis:"
report_checks -from f1 -to f2 -path_delay min -fields {slack arrival required}
