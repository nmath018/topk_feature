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
module arb_slave
#(
parameter integer C_REQ_WIDTH = 1,
parameter integer C_HAS_REQ = 1,
parameter integer C_GNT_WIDTH = 1,
parameter integer C_HAS_GNT = 1,
parameter integer C_REL_WIDTH = 1,
parameter integer C_HAS_REL = 1
)
(
(* X_INTERFACE_INFO = "xilinx.com:interface:arb_rtl:1.0 S_ARB REQ " *)
input wire [((C_REQ_WIDTH>0)?C_REQ_WIDTH:1)-1:0] s_req,
(* X_INTERFACE_INFO = "xilinx.com:interface:arb_rtl:1.0 S_ARB GNT " *)
output wire [((C_GNT_WIDTH>0)?C_GNT_WIDTH:1)-1:0] s_gnt,
(* X_INTERFACE_INFO = "xilinx.com:interface:arb_rtl:1.0 S_ARB REL " *)
output wire [((C_REL_WIDTH>0)?C_REL_WIDTH:1)-1:0] s_rel,
input wire preserve_aclk
);
localparam LP_INPUTS_WIDTH =  (C_REQ_WIDTH);
localparam LP_SHIFTER_WIDTH = (LP_INPUTS_WIDTH >= 4) ? LP_INPUTS_WIDTH : 4;
(* dont_touch = "true" *) wire shifter_o;
(* dont_touch = "true" *) wire [LP_SHIFTER_WIDTH-1:0] shifter_i;
(* dont_touch = "true" *) reg [LP_SHIFTER_WIDTH-1:0] shifter_d;
assign shifter_i = { s_req };
always @(posedge preserve_aclk) begin
   if (shifter_d[0] === 1'b1) begin
   	shifter_d <= shifter_i;
   end else begin
   	shifter_d <= {shifter_d[0], shifter_d[1+:(LP_SHIFTER_WIDTH-1)]};
   end
end
assign shifter_o = shifter_d[0];
assign s_gnt = { C_GNT_WIDTH {shifter_o}};
assign s_rel = { C_REL_WIDTH {shifter_o}};
endmodule