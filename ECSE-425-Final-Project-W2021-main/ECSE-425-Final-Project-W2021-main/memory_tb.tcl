proc AddWaves {} {
    ;#Add waves we're interested in to the Wave window
    add wave -position end sim:/memory_tb/clk
}

vlib work

;# Compile components if any
vcom memory.vhd
vcom memory_tb.vhd

;# Start simulation
vsim memory_tb

;# Generate a clock with 1ns period
force -deposit clk 0 0 ns, 1 0.5 ns -repeat 1 ns

;# Add the waves
AddWaves

;# Run for 5000 ns
run 100 ns