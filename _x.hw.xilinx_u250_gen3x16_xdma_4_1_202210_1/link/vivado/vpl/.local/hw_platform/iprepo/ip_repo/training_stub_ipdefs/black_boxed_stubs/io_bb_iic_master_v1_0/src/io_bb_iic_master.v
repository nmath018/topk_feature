// d52cbaca0ef8cf4fd3d6354deb5066970fb6511d02d18d15835e6014ed847fb0
// (c) Copyright 2022 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
////////////////////////////////////////////////////////////
(* black_box="yes" *) module io_bb_iic_master
#(
parameter integer C_SCL_I_WIDTH = 1,
parameter integer C_HAS_SCL_I = 1,
parameter integer C_SCL_O_WIDTH = 1,
parameter integer C_HAS_SCL_O = 1,
parameter integer C_SCL_T_WIDTH = 1,
parameter integer C_HAS_SCL_T = 1,
parameter integer C_SDA_I_WIDTH = 1,
parameter integer C_HAS_SDA_I = 1,
parameter integer C_SDA_O_WIDTH = 1,
parameter integer C_HAS_SDA_O = 1,
parameter integer C_SDA_T_WIDTH = 1,
parameter integer C_HAS_SDA_T = 1
)
(
(* X_INTERFACE_INFO = "xilinx.com:interface:iic_rtl:1.0 M_IIC SCL_I " *)
 input wire [((C_SCL_I_WIDTH>0)?C_SCL_I_WIDTH:1)-1:0] m_scl_i,
(* X_INTERFACE_INFO = "xilinx.com:interface:iic_rtl:1.0 M_IIC SCL_O " *)
 output wire [((C_SCL_O_WIDTH>0)?C_SCL_O_WIDTH:1)-1:0] m_scl_o,
(* X_INTERFACE_INFO = "xilinx.com:interface:iic_rtl:1.0 M_IIC SCL_T " *)
 output wire [((C_SCL_T_WIDTH>0)?C_SCL_T_WIDTH:1)-1:0] m_scl_t,
(* X_INTERFACE_INFO = "xilinx.com:interface:iic_rtl:1.0 M_IIC SDA_I " *)
 input wire [((C_SDA_I_WIDTH>0)?C_SDA_I_WIDTH:1)-1:0] m_sda_i,
(* X_INTERFACE_INFO = "xilinx.com:interface:iic_rtl:1.0 M_IIC SDA_O " *)
 output wire [((C_SDA_O_WIDTH>0)?C_SDA_O_WIDTH:1)-1:0] m_sda_o,
(* X_INTERFACE_INFO = "xilinx.com:interface:iic_rtl:1.0 M_IIC SDA_T " *)
 output wire [((C_SDA_T_WIDTH>0)?C_SDA_T_WIDTH:1)-1:0] m_sda_t
);
endmodule
