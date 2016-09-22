transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/WB_Block.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/Register_Bank.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/Register.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/Processor.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/Mux4.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/Mux2.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/MEM_WB_Stage.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/MEM_Block.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/IF_ID_Stage.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/IF_Block.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/ID_EX_Stage.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/ID_Block.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/HazardDetectionUnit.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/ForwardingUnit.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/Extender.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/EX_MEM_Stage.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/EX_Block.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/BranchForwardUnit.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/Add.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/ControlUnit.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/ALUControl.v}
vlog -vlog01compat -work work +incdir+C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32 {C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/ALU.v}

