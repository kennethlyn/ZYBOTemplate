# This will generate the ./proj directory
# Other scripts will run synthesis and implementation
#
# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir "."
source "$origin_dir/settings.tcl"

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/proj"]"

# Create project
create_project proj ./proj -force

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [get_projects proj]
set_property "default_lib" "xil_defaultlib" $obj
set_property "part" $part $obj
set_property "simulator_language" "Mixed" $obj
set_property "target_language" "VHDL" $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set 'sources_1' fileset object
# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set files [ list \
	 "[file normalize "$origin_dir/hdl/vhdl/"]"\
	 "[file normalize "$origin_dir/hdl/verilog/"]"\
	 "[file normalize "$origin_dir/hdl/bd/"]"\
]
add_files -fileset $obj $files

# Set the top level
set obj [get_filesets sources_1]
set_property "top" $topLevel $obj
set_property "TOP_FILE" $topFile $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Empty (no sources present)
read_xdc $origin_dir/hdl/contraints/ZYBO_MASTER.xdc

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
# Empty (no sources present)

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
  create_run -name synth_1 -part $part -flow {Vivado Synthesis 2014} -strategy "Vivado Synthesis Defaults" -constrset constrs_1
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2014" [get_runs synth_1]
}
set obj [get_runs synth_1]
set_property "part" $part $obj

# set the current synth run
current_run -synthesis [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
  create_run -name impl_1 -part $part -flow {Vivado Implementation 2014} -strategy "Vivado Implementation Defaults" -constrset constrs_1 -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow "Vivado Implementation 2014" [get_runs impl_1]
}
set obj [get_runs impl_1]
set_property "part" $part $obj

# set the current impl run
current_run -implementation [get_runs impl_1]

puts "INFO: Project created:proj"

launch_runs synth_1
wait_on_run synth_1
launch_runs impl_1  -to_step write_bitstream 
wait_on_run impl_1
