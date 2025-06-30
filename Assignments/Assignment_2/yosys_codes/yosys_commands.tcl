#read modules from Verilog file 
read_verilog fsm.v

# elaborate design hierarchy 
hierarchy -check -top fsm

# translate processes to netlists 
proc

show

# mapping to internal cell library
techmap

# mapping flip-flops to NangateOpenCellLibrary_typical.lib 
# for eg. always block
dfflibmap -liberty NangateOpenCellLibrary_typical.lib

#mapping logic to NangateOpenCell Library_typical.lib 
# for eg. assign block
abc -liberty NangateOpenCellLibrary_typical.lib

# remove unused cells and wires
clean

stat -liberty NangateOpenCellLibrary_typical.lib

# Write the current design to a Verilog file
write_verilog -noattr synth_example.v