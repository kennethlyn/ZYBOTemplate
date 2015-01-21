project: proj/

proj/: ./hdl
	@echo "Creating project"
	@vivado -mode batch -source tcl/project.tcl -nojournal -nolog > /dev/null
	@echo "Done creating project"
	@echo "Don't know when anything else will be done"

clean:
	rm -r proj
