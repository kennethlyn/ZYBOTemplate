less: ./build/output.bit

./build/output.bit: ./hdl
	vivado -mode batch -source tcl/projectless.tcl -nojournal -nolog 

clean:
	rm -r build
