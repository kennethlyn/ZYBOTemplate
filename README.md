#ZYBO Template

#Intro
This is meant to be used as a template to make Vivado a little better to use.
It also has the huge benefit of being able to be version controlled. I use a 
tcl script found in tcl/project.tcl to create a Vivado project and generate a
bit stream.

#Using
Before you can use the tcl script you have to source the settings for Vivado.
For me I type:

	source /opt/Xilinx/Vivado/2014.4/setting64.sh

To use the tcl script simple type:

	make

This will generate a proj/ directory where a Vivado project is waiting to be
used. It will also automatically run synthesis, implementation, and the
bit stream generator.

If you wish to open the project type:

	cd proj
	vivado proj.xpr &

