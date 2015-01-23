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

There are two different modes to operate this template. One with out a Vivado
project and one with a Vivado project. To work with a project type:

	make project

To work without a project type:

	make pless

There is a settings file in the root directory called settings.tcl. This
includes a few important settings. Like top level design, top level design
file, and the part. 

#Future
I plan on adding incremental builds in the future.   
