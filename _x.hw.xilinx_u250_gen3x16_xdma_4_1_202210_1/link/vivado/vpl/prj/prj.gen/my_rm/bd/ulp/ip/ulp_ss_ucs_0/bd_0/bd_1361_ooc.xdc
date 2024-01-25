################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
create_clock -name aclk_freerun -period 10 [get_ports aclk_freerun]
create_clock -name aclk_ctrl -period 20 [get_ports aclk_ctrl]
create_clock -name aclk_pcie -period 4 [get_ports aclk_pcie]

################################################################################