###############################################################################################################
# Core-Level Timing Constraints for axi_register_slice Component "ulp_ip_rs_axi_data_h2c_03_0"
###############################################################################################################
#
# This component is configured in a multi-SLR crossing mode.
# Some storage elements enter reset asynchronously to withstand long inter-SLR delays.
# The async clear (CLR) inputs of these flops are excluded from timing analysis by the following constraint:
set_false_path -through [get_pins -filter {REF_PIN_NAME=~CLR} -of_objects  [get_cells -hierarchical *asyncclear*]]
#
#

create_waiver -internal -scope -type CDC -id CDC-7 -user axi_register_slice -tags "1040889" -to [get_pins -filter {REF_PIN_NAME=~CLR} -of_objects  [get_cells -hierarchical -regexp .*15.*_multi/.*/common.srl_fifo_0/asyncclear_.*]] \
-description {Waiving CDC-7, CDC between 2 known synchronous clock domains}
