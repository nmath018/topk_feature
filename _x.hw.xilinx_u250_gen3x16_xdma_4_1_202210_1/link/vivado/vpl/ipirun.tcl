# This file automatically generated by vpl
# please do not modify
source -notrace [file join [file dirname [info script]] .local/vpl_init.tcl]
source -notrace "$local_dir/ocl_util.tcl"
source -notrace "$local_dir/log_active_task.tcl"
source -notrace "$local_dir/platform.tcl"
source -notrace "$local_dir/debug_profile.tcl"
source -notrace "$local_dir/debug_profile_util.tcl"
source -notrace "$local_dir/debug_hw.tcl"
source -notrace "$local_dir/profile.tcl"

namespace eval ::optrace {
  variable script "ipirun.tcl"
  variable category "vpl"
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

OPTRACE "ipirun" START { ROLLUP_0 }
set active_task_log "$vpp_link_root/activetask.json"
set kernel_ip_dirs [list \
 "$vpp_link_root/int/xo/ip_repo/xilinx_com_hls_topKQueryScores_1_0"]
set install_ip_cache ""


set impl_xdc [dict create \
];

set dict_impl [dict create \
  file_path ".local/hw_platform/tcl_hooks/impl.xdc" \
  used_in "implementation" \
  processing_order "EARLY" \
];

set synth_xdc [dict create \
  impl ${dict_impl} \
];

set utilization [dict create \
  luts                   1488120 \
  brams                  2384 \
  registers              2976240 \
  dsps                   10634 \
];


set bus_sp_tags [list]
set bus_sp_indeces [list]
set bus_slrs [list]

lappend bus_sp_tags DDR4_MEM00 DDR
lappend bus_sp_indeces DDR4_MEM00 0
lappend bus_slrs DDR4_MEM00 SLR0
lappend bus_sp_tags M00_AXI_MEM00 DDR
lappend bus_sp_indeces M00_AXI_MEM00 1
lappend bus_slrs M00_AXI_MEM00 SLR1
lappend bus_sp_tags DDR4_MEM01 DDR
lappend bus_sp_indeces DDR4_MEM01 2
lappend bus_slrs DDR4_MEM01 SLR2
lappend bus_sp_tags DDR4_MEM02 DDR
lappend bus_sp_indeces DDR4_MEM02 3
lappend bus_slrs DDR4_MEM02 SLR3
lappend bus_sp_tags PLRAM_MEM00 PLRAM
lappend bus_sp_indeces PLRAM_MEM00 0
lappend bus_slrs PLRAM_MEM00 SLR0
lappend bus_sp_tags PLRAM_MEM01 PLRAM
lappend bus_sp_indeces PLRAM_MEM01 1
lappend bus_slrs PLRAM_MEM01 SLR1
lappend bus_sp_tags PLRAM_MEM02 PLRAM
lappend bus_sp_indeces PLRAM_MEM02 2
lappend bus_slrs PLRAM_MEM02 SLR2
lappend bus_sp_tags PLRAM_MEM03 PLRAM
lappend bus_sp_indeces PLRAM_MEM03 3
lappend bus_slrs PLRAM_MEM03 SLR3
lappend bus_sp_tags M01_AXI_MEM00 HOST
lappend bus_sp_indeces M01_AXI_MEM00 0
lappend bus_slrs M01_AXI_MEM00 SLR2

set mem_topology_dict [dict create]
dict set mem_topology_dict DDR[0] 0
dict set mem_topology_dict DDR[1] 1
dict set mem_topology_dict DDR[2] 2
dict set mem_topology_dict DDR[3] 3
dict set mem_topology_dict HOST[0] 8
dict set mem_topology_dict PLRAM[0] 4
dict set mem_topology_dict PLRAM[1] 5
dict set mem_topology_dict PLRAM[2] 6
dict set mem_topology_dict PLRAM[3] 7

set hw_platform_info [dict create \
  hw_platform_dir              ".local/hw_platform" \
  hw_platform_file             "/opt/xilinx/platforms/xilinx_u250_gen3x16_xdma_4_1_202210_1/hw/hw.xsa" \
  hw_platform_part             "xcu250-figd2104-2L-e" \
  hw_platform_vbnv             "xilinx:u250:gen3x16_xdma_4_1:202210.1" \
  bb_locked_dcp                ".local/hw_platform/hw_bb_locked.dcp" \
  bb_synth_dcp                 "" \
  hw_platform_uses_pr           true \
  uses_pr_shell_dcp             false \
  pr_shell_dcp                 "" \
  hw_platform_state            "impl" \
  ocl_region                   "level0_i/level1/level1_i/ulp" \
  source_view_dr_inst_path     "" \
  dr_bd_name                   "ulp.bd" \
  dr_bd_inst_name              "" \
  top_module_name              "ulp_wrapper" \
  utilization                   $utilization \
  hw_platform_dr_bd            ".local/hw_platform/bd/202210_1_dev.srcs/sources_1/bd/ulp/ulp.bd" \
  hw_platform_top_bd            "" \
  hw_platform_rebuild_tcl      "" \
  pre_sys_link_tcl               "" \
  post_sys_link_tcl              "" \
  pre_sys_link_overlay_tcl       "" \
  post_sys_link_overlay_tcl      ".local/hw_platform/tcl_hooks/postlink.tcl" \
  post_debug_profile_overlay_tcl "" \
  pre_create_project_tcl         ".local/hw_platform/tcl_hooks/pre_create_project.tcl" \
  user_pre_create_project_tcl    "" \
  user_pre_sys_link_tcl          "" \
  user_post_sys_link_tcl         "" \
  user_pre_sys_link_overlay_tcl  "" \
  user_post_sys_link_overlay_tcl "" \
  user_post_debug_profile_overlay_tcl "" \
  synth_xdc                     $synth_xdc \
  impl_xdc                      $impl_xdc \
  hw_platform_ip_repo          ".local/hw_platform/iprepo" \
  hw_platform_ip_cache         ".local/hw_platform/ipcache" \
  emu_user_ip_repo             "" \
  emu_src_dir                  "" \
  emu_pfm_metadata_version     "Legacy" \
  contains_emu_dir              false \
  hw_platform_board_repo       ".local/hw_platform/board" \
  hw_platform_bconn_locked      {} \
  hw_platform_bconn_unlocked    {} \
  hw_platform_board_part       "xilinx.com:au250:part0:1.4" \
  link_output_format           "bitstream" \
  xpfm_file                    "/opt/xilinx/platforms/xilinx_u250_gen3x16_xdma_4_1_202210_1/xilinx_u250_gen3x16_xdma_4_1_202210_1.xpfm" \
  is_complete_platform         "true" \
  bus_sp_tags                   $bus_sp_tags \
  bus_sp_indeces                $bus_sp_indeces\
  bus_slrs                      $bus_slrs\
  design_intent_server_managed  true \
  design_intent_external_host   true \
  design_intent_datacenter      true \
  design_intent_embedded        false \
  mem_topology                  $mem_topology_dict \
];


set config_info [dict create \
  proj_name                "prj" \
  emu_proj_name            "prj" \
  design_name              "dr" \
  out_partial_bitstream    "$vpl_output_dir/partial.bit" \
  out_partial_pdi          "$vpl_output_dir/partial.pdi" \
  out_partial_clear_bit    "$vpl_output_dir/partial_clear.bit" \
  out_full_bitstream       "$vpl_output_dir/system.bit" \
  out_full_pdi             "$vpl_output_dir/system.pdi" \
  out_mcs                  "$vpl_output_dir/system.mcs" \
  out_primary_mcs          "$vpl_output_dir/system_primary.mcs" \
  out_secondary_mcs        "$vpl_output_dir/system_secondary.mcs" \
  enable_dont_partition     true \
  enable_util_report        true \
  utilization_threshold     0.8 \
  generate_script_only      false \
  run_script_map_file      "" \
  clbinary_name            "krnl.link" \
  kernels                  "topKQueryScores" \
  steps_log                 $steps_log \
  impl_from_step           "" \
  impl_to_step             "" \
  num_jobs_synth            8 \
  num_jobs_impl             8 \
  lsf_string_synth         {} \
  lsf_string_impl          {} \
  strategies_impl          {} \
  wait_on_all_impl_runs     false \
  optimize_level            0 \
  is_hw_emu                 false \
  is_hw_emu_rebuild_flow    false \
  user_ip_repo              {} \
  kernel_ip_dirs            $kernel_ip_dirs \
  no_hw_platform_ip_cache   false \
  no_install_ip_cache       false \
  install_ip_cache          $install_ip_cache \
  no_ip_cache               false \
  remote_ip_cache          "/home/nmath018/topK_feature/hls_catch22/.ipcache" \
  user_board_repo           {} \
  user_bconn                {} \
  dr_bd_tcl                ".local/dr.bd.tcl" \
  webtalk_flag             "Vitis" \
  encrypt_impl_dcp          false \
  encrypt_key_file         "" \
  enable_pr_verify          false \
  return_pre_sys_link_tcl   false \
  return_pre_synth          false \
  return_post_synth         false \
  return_pre_impl           false \
  disable_run_configs       false \
  protocol_checker          false \
  hw_emu_profiling          true \
  kernel_tlm_model_instances none \
  scripts_dir              "scripts" \
  output_dir               "$output_dir" \
  vivado_output_dir        "$vivado_output_dir" \
  vpl_output_dir           "$vpl_output_dir" \
  vma_output_file          vpl_gen.vma \
  input_dir                "$input_dir" \
  local_dir                "$local_dir" \
  tclhook_prefix           "_vpl" \
  partition_def            "my_pd" \
  reconfig_module          "my_rm" \
  pr_config_name           "config_1" \
  failfast_config          {} \
  qor_assessment_config    {} \
  enable_explicit_emu_data  false \
  is_debug_enabled           "0" \
  aie_archive_file         "$vpp_link_root/int/system.aieprj" \
  system_dpa_enabled       "1" \
  is_hw_export              false \
  fixed_xsa                "vpl_gen_fixed.xsa" \
  gen_fixed_xsa_in_top_prj "0" \
  is_incr_hw_emu           "0" \
  nifd_enabled             "0" \
  is_versal                false \
  enable_versal_dfx        false \
  ip_param_tcl             "$vpl_output_dir/ip_param.tcl" \
  deadlock_detection       "disable" \
  isNewXSa 0 \
  enable_flow_report       true \
  hierarchy_name           "VitisRegion" \
];

# kernel clock 'PL 0' (0)
set dict_ss_ucs_aclk_kernel_00 [dict create \
  is_user_set false \
  instance ss_ucs \
  port aclk_kernel_00 \
  clk_id 0 \
  freq 300.000000 \
];
# kernel clock 'PL 1' (1)
set dict_ss_ucs_aclk_kernel_01 [dict create \
  is_user_set false \
  instance ss_ucs \
  port aclk_kernel_01 \
  clk_id 1 \
  freq 500.000000 \
];

set kernel_clock_freqs [dict create \
  ss_ucs/aclk_kernel_00 $dict_ss_ucs_aclk_kernel_00 \
  ss_ucs/aclk_kernel_01 $dict_ss_ucs_aclk_kernel_01 \
];

set system_clock_freqs [dict create \
];

set clk_info [dict create \
  kernel_clock_freqs         $kernel_clock_freqs \
  system_clock_freqs         $system_clock_freqs \
  worst_negative_slack      0 \
  max_frequency             650 \
  min_frequency             10 \
  error_on_hold_violation   true \
  error_on_pw_violation     true \
  skip_timing_and_scaling   false \
  enable_auto_freq_scale    true \
];

set dict_debug [dict create \
  version "1.0" \
];
dict set dict_debug kernel_debug false
set dict_profile [dict create \
  NAME profile_monitors \
  FIFO "8192" \
  AIE [list] \
  DATA [list] \
  STALL [list] \
  EXEC [list] \
  MEMORY [list ] \
  AIE_TRACE_EVENT_PACKET_RATE "0" \
  AIE_TRACE_PROFILE_STREAMS "0" \
];
set debug_profile_info [dict create debug $dict_debug profile $dict_profile]

dict set config_info synth_props_tcl "scripts/_vivado_synth_props.tcl"
dict set config_info impl_props_tcl "scripts/_vivado_impl_props.tcl"
dict set config_info report_commands_tcl "scripts/_vivado_report_commands.tcl"

OPTRACE "ipirun" END { }

