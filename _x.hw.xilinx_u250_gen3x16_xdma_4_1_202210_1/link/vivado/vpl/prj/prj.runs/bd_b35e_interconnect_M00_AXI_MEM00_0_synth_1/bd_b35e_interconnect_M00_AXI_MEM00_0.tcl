# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "/home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.runs/bd_b35e_interconnect_M00_AXI_MEM00_0_synth_1/bd_b35e_interconnect_M00_AXI_MEM00_0.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "bd_b35e_interconnect_M00_AXI_MEM00_0_synth_1" START { ROLLUP_AUTO }
set_param project.enablePRFlowIPI 1
set_param bd.debug_profile.script /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/.local/debug_profile_automation.tcl
set_param route.sllAssign.enableILPBasedSllAssignment 0
set_param bd.enable_dpa 1
set_param project.loadTopLevelOOCConstrs 1
set_param project.gatelevelSubdesign 1
set_param place.ultrathreadsUsed 0
set_param ips.enableSLRParameter 2
set_param hd.Visual 0
set_param general.maxThreads 1
set_param bd.ForceAppCoreUpgrade 1
set_param compiler.enablePerformanceTrace 1
set_param bd.skipSupportedIPCheck 1
set_param project.vivado.isBlockSynthRun true
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xcu250-figd2104-2L-e
set_property tool_flow SDx [current_project]

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.cache/wt [current_project]
set_property parent.project_path /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part_repo_paths {/home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/.local/hw_platform/board} [current_project]
set_property board_part xilinx.com:au250:part0:1.4 [current_project]
set_property ip_repo_paths {
  /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/int/xo/ip_repo/xilinx_com_hls_topKQueryScores_1_0
  /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/.local/hw_platform/iprepo
  /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/.local/hw_platform/ipcache
  /tools/Xilinx/Vitis/2022.2/data/ip
} [current_project]
update_ip_catalog
set_property ip_output_repo /home/nmath018/topK_feature/hls_catch22/.ipcache [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
read_ip -quiet /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_0/ip/ip_17/bd_b35e_interconnect_M00_AXI_MEM00_0.xci
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_1/bd_928c_psr0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_1/bd_928c_psr0_0.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_2/bd_928c_psr_aclk_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_2/bd_928c_psr_aclk_0.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_3/bd_928c_psr_aclk1_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_3/bd_928c_psr_aclk1_0.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_4/bd_928c_arsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_5/bd_928c_rsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_6/bd_928c_awsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_7/bd_928c_wsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_8/bd_928c_bsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_12/bd_928c_s00a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_13/bd_928c_sarn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_14/bd_928c_srn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_15/bd_928c_sawn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_16/bd_928c_swn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_17/bd_928c_sbn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_21/bd_928c_s01a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_22/bd_928c_sarn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_23/bd_928c_srn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_24/bd_928c_sawn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_25/bd_928c_swn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_26/bd_928c_sbn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_27/bd_928c_m00s2a_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_28/bd_928c_m00arn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_29/bd_928c_m00rn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_30/bd_928c_m00awn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_31/bd_928c_m00wn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_1/ip/ip_32/bd_928c_m00bn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_0/ip/ip_17/ooc.xdc]

OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
OPTRACE "Configure IP Cache" START { }

set cacheID [config_ip_cache -export -no_bom  -dir /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.runs/bd_b35e_interconnect_M00_AXI_MEM00_0_synth_1 -new_name bd_b35e_interconnect_M00_AXI_MEM00_0 -ip [get_ips bd_b35e_interconnect_M00_AXI_MEM00_0]]

OPTRACE "Configure IP Cache" END { }
if { $cacheID == "" } {
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top bd_b35e_interconnect_M00_AXI_MEM00_0 -part xcu250-figd2104-2L-e -incremental_mode off -mode out_of_context
OPTRACE "synth_design" END { }
OPTRACE "Write IP Cache" START { }

#---------------------------------------------------------
# Generate Checkpoint/Stub/Simulation Files For IP Cache
#---------------------------------------------------------
# disable binary constraint mode for IPCache checkpoints
set_param constraints.enableBinaryConstraints false

catch {
 write_checkpoint -force -noxdef -rename_prefix bd_b35e_interconnect_M00_AXI_MEM00_0_ bd_b35e_interconnect_M00_AXI_MEM00_0.dcp

 set ipCachedFiles {}
 write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_b35e_interconnect_M00_AXI_MEM00_0_stub.v
 lappend ipCachedFiles bd_b35e_interconnect_M00_AXI_MEM00_0_stub.v

 write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_b35e_interconnect_M00_AXI_MEM00_0_stub.vhdl
 lappend ipCachedFiles bd_b35e_interconnect_M00_AXI_MEM00_0_stub.vhdl

 write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_b35e_interconnect_M00_AXI_MEM00_0_sim_netlist.v
 lappend ipCachedFiles bd_b35e_interconnect_M00_AXI_MEM00_0_sim_netlist.v

 write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_b35e_interconnect_M00_AXI_MEM00_0_sim_netlist.vhdl
 lappend ipCachedFiles bd_b35e_interconnect_M00_AXI_MEM00_0_sim_netlist.vhdl
 set TIME_taken [expr [clock seconds] - $TIME_start]

 if { [get_msg_config -count -severity {CRITICAL WARNING}] == 0 } {
  config_ip_cache -add -dcp bd_b35e_interconnect_M00_AXI_MEM00_0.dcp -move_files $ipCachedFiles   -synth_runtime $TIME_taken  -ip [get_ips bd_b35e_interconnect_M00_AXI_MEM00_0]
 }
OPTRACE "Write IP Cache" END { }
}
if { [get_msg_config -count -severity {CRITICAL WARNING}] > 0 } {
 send_msg_id runtcl-6 info "Synthesis results are not added to the cache due to CRITICAL_WARNING"
}

rename_ref -prefix_all bd_b35e_interconnect_M00_AXI_MEM00_0_

OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef bd_b35e_interconnect_M00_AXI_MEM00_0.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "bd_b35e_interconnect_M00_AXI_MEM00_0_synth_1_synth_report_utilization_0" "report_utilization -file bd_b35e_interconnect_M00_AXI_MEM00_0_utilization_synth.rpt -pb bd_b35e_interconnect_M00_AXI_MEM00_0_utilization_synth.pb"
OPTRACE "synth reports" END { }

if { [catch {
  file copy -force /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.runs/bd_b35e_interconnect_M00_AXI_MEM00_0_synth_1/bd_b35e_interconnect_M00_AXI_MEM00_0.dcp /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_0/ip/ip_17/bd_b35e_interconnect_M00_AXI_MEM00_0.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 status "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_0/ip/ip_17/bd_b35e_interconnect_M00_AXI_MEM00_0_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_0/ip/ip_17/bd_b35e_interconnect_M00_AXI_MEM00_0_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_0/ip/ip_17/bd_b35e_interconnect_M00_AXI_MEM00_0_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_0/ip/ip_17/bd_b35e_interconnect_M00_AXI_MEM00_0_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}


} else {


if { [catch {
  file copy -force /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.runs/bd_b35e_interconnect_M00_AXI_MEM00_0_synth_1/bd_b35e_interconnect_M00_AXI_MEM00_0.dcp /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_0/ip/ip_17/bd_b35e_interconnect_M00_AXI_MEM00_0.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 status "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  file rename -force /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.runs/bd_b35e_interconnect_M00_AXI_MEM00_0_synth_1/bd_b35e_interconnect_M00_AXI_MEM00_0_stub.v /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_0/ip/ip_17/bd_b35e_interconnect_M00_AXI_MEM00_0_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.runs/bd_b35e_interconnect_M00_AXI_MEM00_0_synth_1/bd_b35e_interconnect_M00_AXI_MEM00_0_stub.vhdl /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_0/ip/ip_17/bd_b35e_interconnect_M00_AXI_MEM00_0_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.runs/bd_b35e_interconnect_M00_AXI_MEM00_0_synth_1/bd_b35e_interconnect_M00_AXI_MEM00_0_sim_netlist.v /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_0/ip/ip_17/bd_b35e_interconnect_M00_AXI_MEM00_0_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  file rename -force /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.runs/bd_b35e_interconnect_M00_AXI_MEM00_0_synth_1/bd_b35e_interconnect_M00_AXI_MEM00_0_sim_netlist.vhdl /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_0/ip/ip_17/bd_b35e_interconnect_M00_AXI_MEM00_0_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

}; # end if cacheID 

if {[file isdir /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.ip_user_files/ip/bd_b35e_interconnect_M00_AXI_MEM00_0]} {
  catch { 
    file copy -force /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_0/ip/ip_17/bd_b35e_interconnect_M00_AXI_MEM00_0_stub.v /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.ip_user_files/ip/bd_b35e_interconnect_M00_AXI_MEM00_0
  }
}

if {[file isdir /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.ip_user_files/ip/bd_b35e_interconnect_M00_AXI_MEM00_0]} {
  catch { 
    file copy -force /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.gen/my_rm/bd/ulp/ip/ulp_memory_subsystem_0/bd_0/ip/ip_17/bd_b35e_interconnect_M00_AXI_MEM00_0_stub.vhdl /home/nmath018/topK_feature/hls_catch22/_x.hw.xilinx_u250_gen3x16_xdma_4_1_202210_1/link/vivado/vpl/prj/prj.ip_user_files/ip/bd_b35e_interconnect_M00_AXI_MEM00_0
  }
}
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "bd_b35e_interconnect_M00_AXI_MEM00_0_synth_1" END { }
