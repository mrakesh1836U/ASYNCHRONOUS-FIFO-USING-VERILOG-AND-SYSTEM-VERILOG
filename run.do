vlog -cover fcbest tb.sv
set fp [open "testlist.txt" r]
while { [gets $fp testname] > 0 } {
		set ucdb_f "$testname\.ucdb"
	 vopt tb +cover=fcbest -o $testname
vsim -novopt -suppress 12110 -coverage $testname -suppress 3839 +testcase=$testname
add wave -position insertpoint sim:/tb/f/*
add wave -position insertpoint sim:/tb/dut/*
coverage save -onexit $ucdb_f  
run -all
}
close $fp
