project: ./build/output.bit

./build/output.bit: ./hdl
	vivado -mode batch -source tcl/project.tcl -nojournal -nolog 

clean:
	rm -r build
