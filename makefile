project: proj/

proj/: 
	vivado -mode batch -source tcl/project.tcl -nojournal -nolog > /dev/null
