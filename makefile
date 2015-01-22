project: proj/

open: proj/
	@echo "Opening proj/proj.xpr"
	@vivado proj/proj.xpr -nojournal -nolog > /dev/null

proj/: ./hdl
	@echo "Creating project"
	@vivado -mode batch -source tcl/project.tcl -nojournal -nolog > /dev/null
	@echo "Done creating project"
	@echo "Don't know when anything else will be done"

clean:
	rm -r proj
