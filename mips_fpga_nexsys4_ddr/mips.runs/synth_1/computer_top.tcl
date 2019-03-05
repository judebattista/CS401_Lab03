# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
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
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.cache/wt [current_project]
set_property parent.project_path Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:nexys4_ddr:part0:1.1 [current_project]
set_property ip_output_repo z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_mem {
  Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/sources_1/imports/new/memfile.dat
  Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/sources_1/imports/new/memfile_2.dat
  Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/sources_1/imports/new/memfile_3.dat
}
read_vhdl -library xil_defaultlib {
  Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/sources_1/imports/new/mips.vhd
  Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/sources_1/imports/new/mips_mem_instructions.vhd
  Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/sources_1/imports/new/mips_shift_left_by_2.vhd
  Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/sources_1/imports/new/mips_datapath.vhd
  Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/sources_1/imports/new/mips_top.vhd
  Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/sources_1/imports/new/mips_alu.vhd
  Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/sources_1/imports/new/mips_adder.vhd
  Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/sources_1/imports/new/mips_mem_data.vhd
  Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/sources_1/imports/new/mips_decoder_alu.vhd
  Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/sources_1/imports/new/mips_decoder_main.vhd
  Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/sources_1/imports/new/computer_top.vhd
  Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/sources_1/imports/new/mips_controller.vhd
  Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/sources_1/imports/new/mips_register_file.vhd
  Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/sources_1/imports/new/mips_sign_extender.vhd
  Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/sources_1/imports/new/display_hex.vhd
  Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/sources_1/imports/new/mips_flip_flop_register.vhd
  Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/sources_1/imports/new/mips_multiplexer_2_input.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/constrs_1/imports/Desktop/Nexys4DDR_Master.xdc
set_property used_in_implementation false [get_files Z:/CS-401-1-CompArch/MIPS_3/mips_fpga_nexsys4_ddr/mips.srcs/constrs_1/imports/Desktop/Nexys4DDR_Master.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top computer_top -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef computer_top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file computer_top_utilization_synth.rpt -pb computer_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
