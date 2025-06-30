# clock period 200 ps
create_clock -name CLK -period 200 [get_ports CLK]

# clock uncertainty of 50 ps
set_clock_uncertainty 50 [get_clocks CLK]

set_input_delay 20 -clock [get_clocks CLK] [get_ports {A B C D E SI}]
set_output_delay 20 -clock [get_clocks CLK] [get_ports {OUT SO}]

# Set functional mode
set_case_analysis 0 [get_ports SE]