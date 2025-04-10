# Clock
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

# For next instruction
set_property PACKAGE_PIN T17 [get_ports btn_next_instr]
set_property IOSTANDARD LVCMOS33 [get_ports btn_next_instr]

# Reset
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

# Writeback Debug to LEDs
set_property PACKAGE_PIN U16 [get_ports {alu_led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {alu_led[0]}]

set_property PACKAGE_PIN E19 [get_ports {alu_led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {alu_led[1]}]

set_property PACKAGE_PIN U19 [get_ports {alu_led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {alu_led[2]}]

set_property PACKAGE_PIN V19 [get_ports {alu_led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {alu_led[3]}]

set_property PACKAGE_PIN W18 [get_ports {alu_led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {alu_led[4]}]

set_property PACKAGE_PIN U15 [get_ports {alu_led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {alu_led[5]}]

set_property PACKAGE_PIN U14 [get_ports {alu_led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {alu_led[6]}]

set_property PACKAGE_PIN V14 [get_ports {alu_led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {alu_led[7]}]

set_property PACKAGE_PIN V13 [get_ports {alu_led[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {alu_led[8]}]

set_property PACKAGE_PIN V3 [get_ports {alu_led[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {alu_led[9]}]

set_property PACKAGE_PIN W3 [get_ports {alu_led[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {alu_led[10]}]

set_property PACKAGE_PIN U3 [get_ports {alu_led[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {alu_led[11]}]

set_property PACKAGE_PIN P3 [get_ports {alu_led[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {alu_led[12]}]

set_property PACKAGE_PIN N3 [get_ports {alu_led[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {alu_led[13]}]

set_property PACKAGE_PIN P1 [get_ports {alu_led[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {alu_led[14]}]

set_property PACKAGE_PIN L1 [get_ports {alu_led[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {alu_led[15]}]



# Seven Segment Display
set_property PACKAGE_PIN W7 [get_ports seg[0]];  
set_property IOSTANDARD LVCMOS33 [get_ports seg[0]]
set_property PACKAGE_PIN W6 [get_ports seg[1]];  
set_property IOSTANDARD LVCMOS33 [get_ports seg[1]]
set_property PACKAGE_PIN U8 [get_ports seg[2]];  
set_property IOSTANDARD LVCMOS33 [get_ports seg[2]]
set_property PACKAGE_PIN V8 [get_ports seg[3]];  
set_property IOSTANDARD LVCMOS33 [get_ports seg[3]]
set_property PACKAGE_PIN U5 [get_ports seg[4]];  
set_property IOSTANDARD LVCMOS33 [get_ports seg[4]]
set_property PACKAGE_PIN V5 [get_ports seg[5]];  
set_property IOSTANDARD LVCMOS33 [get_ports seg[5]]
set_property PACKAGE_PIN U7 [get_ports seg[6]];  
set_property IOSTANDARD LVCMOS33 [get_ports seg[6]]

# 7-seg anodes (digit control)
set_property PACKAGE_PIN U2 [get_ports an[0]];   
set_property IOSTANDARD LVCMOS33 [get_ports an[0]]
set_property PACKAGE_PIN U4 [get_ports an[1]];   
set_property IOSTANDARD LVCMOS33 [get_ports an[1]]
set_property PACKAGE_PIN V4 [get_ports an[2]];   
set_property IOSTANDARD LVCMOS33 [get_ports an[2]]
set_property PACKAGE_PIN W4 [get_ports an[3]];   
set_property IOSTANDARD LVCMOS33 [get_ports an[3]]
