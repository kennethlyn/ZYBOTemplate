source ./settings.tcl

set build ./build
file mkdir $build

#read_vhdl [ glob ./hdl/vhdl/*.vhd ]
read_vhdl [ glob ./hdl/vhdl/*.vhdl ] 

#read_verilog [ glob ./hdl/verilog/*.v ]
read_xdc [ glob ./hdl/contraints/ZYBO_MASTER.xdc ]

synth_design -top $topLevel -part $part
write_checkpoint -force $build/post_synth.dcp

opt_design
place_design

write_checkpoint -force $build/post_place.dcp
report_utilization -file $build/post_place_util.dcp

route_design
write_checkpoint -force $build/post_route.dcp

write_bitstream -force $build/output.bit
