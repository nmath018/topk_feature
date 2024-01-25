# This file was automatically generated by Vpl
if { ![info exists _is_init_cmds] } {
  set script_old $::optrace::script
  set category_old $::optrace::category
  source ../../../ipirun.tcl
  variable ::optrace::script $script_old
  variable ::optrace::category $category_old
  source $local_dir/debug_profile_hooks.tcl
  namespace import ocl_util::*

set VPL_ERROR_LOGGED 707
  set _is_init_cmds true
}



# generate cookie file for messaging
write_cookie_file_impl "krnl.link"

# utilization reports
report_utilization_impl true "topKQueryScores" "routed" "level0_i/level1/level1_i/ulp" $input_dir $vivado_output_dir

# kernel service update
update_kernel_info $steps_log $vpl_output_dir "level0_i/level1/level1_i/ulp"

# update noc node information
update_profile_metadata_postroute $vpl_output_dir