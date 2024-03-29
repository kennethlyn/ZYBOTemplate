pless: ./build/output.bit

project: proj/

open: proj/
	@echo "Opening proj/proj.xpr"
	@vivado proj/proj.xpr -nojournal -nolog 

proj/: ./hdl
	@echo "Creating project"
	@vivado -mode batch -source tcl/project.tcl -notrace -nojournal -nolog 
	@echo "Done creating project"

./build/output.bit: ./hdl
	vivado -mode batch -source tcl/projectless.tcl -nojournal -nolog 

clean:
	rm -r build
	rm -r proj/
