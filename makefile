project: proj/

proj/: ./contraints ./hdl
	vivado -mode batch -source tcl/project.tcl -nojournal -nolog 
