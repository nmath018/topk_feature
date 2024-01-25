#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2022.2 (64-bit)
#
# Filename    : compile.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for compiling the simulation design source files
#
# Generated by Vivado on Mon Nov 27 17:41:40 PST 2023
# SW Build 3671981 on Fri Oct 14 04:59:54 MDT 2022
#
# IP Build 3669848 on Fri Oct 14 08:30:02 MDT 2022
#
# usage: compile.sh
#
# ****************************************************************************
set -Eeuo pipefail

xv_cxl_lib_path="/tools/Xilinx/Vivado/2022.2/data/xsim"
xv_cpt_lib_path="/tools/Xilinx/Vivado/2022.2/data/simmodels/xsim/2022.2/lnx64/6.2.0/systemc/protected"
xv_ext_lib_path="/tools/Xilinx/Vivado/2022.2/data/simmodels/xsim/2022.2/lnx64/6.2.0/ext"
xv_boost_lib_path="/tools/Xilinx/Vivado/2022.2/tps/boost_1_72_0"

# compile systemC design sources
echo "xsc -c --gcc_compile_options "-DBOOST_SYSTEM_NO_DEPRECATED" --gcc_compile_options "-I/tools/Xilinx/Vitis_HLS/2022.2/include" --cppversion 14 --gcc_compile_options "-I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_smartconn_data_0_0/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_smartconn_data_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_9/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_9/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_12/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_12/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_13/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_profile_vip_0_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_profile_vip_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_irq_const_tieoff_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_hub_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_hub_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon0_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon0_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_xbar_4/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_xbar_4/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_xbar_5/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_xbar_5/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_xbar_6/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_xbar_6/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m01_regslice_6/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m01_regslice_6/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m01_regslice_7/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m01_regslice_7/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_s00_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_s00_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m00_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m00_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_1/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_1/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m01_regslice_8/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m01_regslice_8/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_2/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_2/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m02_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m02_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_3/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_3/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_embedded_schedular_0/sysc -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_embedded_schedular_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_clock_converter_0_0/sysc -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_clock_converter_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_sim_ddr_0_0/sim_tlm/top -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_sim_ddr_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_smartconnect_0_0/xtlm -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_smartconnect_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_vip_0_0/sysc -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_vip_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_vip_1_0/sysc -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_vip_1_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_vip_2_0/sysc -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_vip_2_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_vip_3_0/sysc -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_vip_3_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_sim_address_0_0/sysc -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_sim_address_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_sim_qdma_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_xbar_0/src -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_xbar_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/sim -I$xv_boost_lib_path -I$xv_ext_lib_path/protobuf/include -I$xv_cxl_lib_path/ip/xscl/include -I$xv_cxl_lib_path/ip/sim_qdma_cpp_v1_0/include -I$xv_cxl_lib_path/ip/xtlm_ipc_v1_0/include -I$xv_cxl_lib_path/ip/sim_qdma_sc_v1_0/include -I$xv_cxl_lib_path/ip/xtlm_simple_interconnect_v1_0/include -I$xv_cxl_lib_path/ip/xtlm_ap_ctrl_v1_0/include -I$xv_cxl_lib_path/ip/sim_ddr_v1_0/include -I$xv_cxl_lib_path/ip/common_cpp_v1_0/include -I$xv_cxl_lib_path/ip/common_rpc_v1/include -I$xv_cxl_lib_path/ip/xtlm/include -I$xv_cxl_lib_path/ip/emu_perf_common_v1_0/include" -work xil_defaultlib -f pfm_top_wrapper_xsc.prj"
xsc -c --gcc_compile_options "-DBOOST_SYSTEM_NO_DEPRECATED" --gcc_compile_options "-I/tools/Xilinx/Vitis_HLS/2022.2/include" --cppversion 14 --gcc_compile_options "-I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_smartconn_data_0_0/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_smartconn_data_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_9/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_9/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_12/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_12/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_13/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_profile_vip_0_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_profile_vip_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_irq_const_tieoff_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_hub_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_hub_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon0_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon0_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_xbar_4/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_xbar_4/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_xbar_5/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_xbar_5/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_xbar_6/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_xbar_6/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m01_regslice_6/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m01_regslice_6/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m01_regslice_7/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m01_regslice_7/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_s00_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_s00_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m00_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m00_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_1/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_1/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m01_regslice_8/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m01_regslice_8/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_2/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_2/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m02_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m02_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_3/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_3/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_embedded_schedular_0/sysc -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_embedded_schedular_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_clock_converter_0_0/sysc -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_clock_converter_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_sim_ddr_0_0/sim_tlm/top -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_sim_ddr_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_smartconnect_0_0/xtlm -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_smartconnect_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_vip_0_0/sysc -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_vip_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_vip_1_0/sysc -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_vip_1_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_vip_2_0/sysc -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_vip_2_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_vip_3_0/sysc -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_vip_3_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_sim_address_0_0/sysc -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_sim_address_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_sim_qdma_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_xbar_0/src -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_xbar_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/sim -I$xv_boost_lib_path -I$xv_ext_lib_path/protobuf/include -I$xv_cxl_lib_path/ip/xscl/include -I$xv_cxl_lib_path/ip/sim_qdma_cpp_v1_0/include -I$xv_cxl_lib_path/ip/xtlm_ipc_v1_0/include -I$xv_cxl_lib_path/ip/sim_qdma_sc_v1_0/include -I$xv_cxl_lib_path/ip/xtlm_simple_interconnect_v1_0/include -I$xv_cxl_lib_path/ip/xtlm_ap_ctrl_v1_0/include -I$xv_cxl_lib_path/ip/sim_ddr_v1_0/include -I$xv_cxl_lib_path/ip/common_cpp_v1_0/include -I$xv_cxl_lib_path/ip/common_rpc_v1/include -I$xv_cxl_lib_path/ip/xtlm/include -I$xv_cxl_lib_path/ip/emu_perf_common_v1_0/include" -work xil_defaultlib -f pfm_top_wrapper_xsc.prj 2>&1 | tee -a compile.log &
XSC_SYSC_PID=$!

# compile Verilog/System Verilog design sources
echo "xvlog --incr --relax -L uvm -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L xilinx_vip -prj pfm_top_wrapper_vlog.prj"
xvlog --incr --relax -L uvm -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L xilinx_vip -prj pfm_top_wrapper_vlog.prj 2>&1 | tee compile.log

# compile VHDL design sources
echo "xvhdl --incr --relax -prj pfm_top_wrapper_vhdl.prj"
xvhdl --incr --relax -prj pfm_top_wrapper_vhdl.prj 2>&1 | tee -a compile.log

echo "Waiting for jobs to finish..."
wait $XSC_SYSC_PID
echo "No pending jobs, compilation finished."
