project: proj/

proj/: ./hdl
	vivado -mode batch -source tcl/project.tcl -nojournal -nolog 

clean:
	rm -r proj
