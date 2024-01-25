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
module aximm_master
#(
parameter integer C_AWID_WIDTH = 1,
parameter integer C_HAS_AWID = 1,
parameter integer C_AWADDR_WIDTH = 1,
parameter integer C_HAS_AWADDR = 1,
parameter integer C_AWLEN_WIDTH = 1,
parameter integer C_HAS_AWLEN = 1,
parameter integer C_AWSIZE_WIDTH = 3,
parameter integer C_HAS_AWSIZE = 1,
parameter integer C_AWBURST_WIDTH = 2,
parameter integer C_HAS_AWBURST = 1,
parameter integer C_AWLOCK_WIDTH = 1,
parameter integer C_HAS_AWLOCK = 1,
parameter integer C_AWCACHE_WIDTH = 4,
parameter integer C_HAS_AWCACHE = 1,
parameter integer C_AWPROT_WIDTH = 3,
parameter integer C_HAS_AWPROT = 1,
parameter integer C_AWREGION_WIDTH = 4,
parameter integer C_HAS_AWREGION = 1,
parameter integer C_AWQOS_WIDTH = 4,
parameter integer C_HAS_AWQOS = 1,
parameter integer C_AWUSER_WIDTH = 1,
parameter integer C_HAS_AWUSER = 1,
parameter integer C_AWVALID_WIDTH = 1,
parameter integer C_HAS_AWVALID = 1,
parameter integer C_AWREADY_WIDTH = 1,
parameter integer C_HAS_AWREADY = 1,
parameter integer C_WID_WIDTH = 1,
parameter integer C_HAS_WID = 1,
parameter integer C_WDATA_WIDTH = 1,
parameter integer C_HAS_WDATA = 1,
parameter integer C_WSTRB_WIDTH = 1,
parameter integer C_HAS_WSTRB = 1,
parameter integer C_WLAST_WIDTH = 1,
parameter integer C_HAS_WLAST = 1,
parameter integer C_WUSER_WIDTH = 1,
parameter integer C_HAS_WUSER = 1,
parameter integer C_WVALID_WIDTH = 1,
parameter integer C_HAS_WVALID = 1,
parameter integer C_WREADY_WIDTH = 1,
parameter integer C_HAS_WREADY = 1,
parameter integer C_BID_WIDTH = 1,
parameter integer C_HAS_BID = 1,
parameter integer C_BRESP_WIDTH = 2,
parameter integer C_HAS_BRESP = 1,
parameter integer C_BUSER_WIDTH = 1,
parameter integer C_HAS_BUSER = 1,
parameter integer C_BVALID_WIDTH = 1,
parameter integer C_HAS_BVALID = 1,
parameter integer C_BREADY_WIDTH = 1,
parameter integer C_HAS_BREADY = 1,
parameter integer C_ARID_WIDTH = 1,
parameter integer C_HAS_ARID = 1,
parameter integer C_ARADDR_WIDTH = 1,
parameter integer C_HAS_ARADDR = 1,
parameter integer C_ARLEN_WIDTH = 1,
parameter integer C_HAS_ARLEN = 1,
parameter integer C_ARSIZE_WIDTH = 3,
parameter integer C_HAS_ARSIZE = 1,
parameter integer C_ARBURST_WIDTH = 2,
parameter integer C_HAS_ARBURST = 1,
parameter integer C_ARLOCK_WIDTH = 1,
parameter integer C_HAS_ARLOCK = 1,
parameter integer C_ARCACHE_WIDTH = 4,
parameter integer C_HAS_ARCACHE = 1,
parameter integer C_ARPROT_WIDTH = 3,
parameter integer C_HAS_ARPROT = 1,
parameter integer C_ARREGION_WIDTH = 4,
parameter integer C_HAS_ARREGION = 1,
parameter integer C_ARQOS_WIDTH = 4,
parameter integer C_HAS_ARQOS = 1,
parameter integer C_ARUSER_WIDTH = 1,
parameter integer C_HAS_ARUSER = 1,
parameter integer C_ARVALID_WIDTH = 1,
parameter integer C_HAS_ARVALID = 1,
parameter integer C_ARREADY_WIDTH = 1,
parameter integer C_HAS_ARREADY = 1,
parameter integer C_RID_WIDTH = 1,
parameter integer C_HAS_RID = 1,
parameter integer C_RDATA_WIDTH = 1,
parameter integer C_HAS_RDATA = 1,
parameter integer C_RRESP_WIDTH = 2,
parameter integer C_HAS_RRESP = 1,
parameter integer C_RLAST_WIDTH = 1,
parameter integer C_HAS_RLAST = 1,
parameter integer C_RUSER_WIDTH = 1,
parameter integer C_HAS_RUSER = 1,
parameter integer C_RVALID_WIDTH = 1,
parameter integer C_HAS_RVALID = 1,
parameter integer C_RREADY_WIDTH = 1,
parameter integer C_HAS_RREADY = 1
)
(
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM AWID " *)
 output wire [((C_AWID_WIDTH>0)?C_AWID_WIDTH:1)-1:0] m_awid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM AWADDR " *)
 output wire [((C_AWADDR_WIDTH>0)?C_AWADDR_WIDTH:1)-1:0] m_awaddr,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM AWLEN " *)
 output wire [((C_AWLEN_WIDTH>0)?C_AWLEN_WIDTH:1)-1:0] m_awlen,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM AWSIZE " *)
 output wire [((C_AWSIZE_WIDTH>0)?C_AWSIZE_WIDTH:1)-1:0] m_awsize,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM AWBURST " *)
 output wire [((C_AWBURST_WIDTH>0)?C_AWBURST_WIDTH:1)-1:0] m_awburst,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM AWLOCK " *)
 output wire [((C_AWLOCK_WIDTH>0)?C_AWLOCK_WIDTH:1)-1:0] m_awlock,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM AWCACHE " *)
 output wire [((C_AWCACHE_WIDTH>0)?C_AWCACHE_WIDTH:1)-1:0] m_awcache,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM AWPROT " *)
 output wire [((C_AWPROT_WIDTH>0)?C_AWPROT_WIDTH:1)-1:0] m_awprot,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM AWREGION " *)
 output wire [((C_AWREGION_WIDTH>0)?C_AWREGION_WIDTH:1)-1:0] m_awregion,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM AWQOS " *)
 output wire [((C_AWQOS_WIDTH>0)?C_AWQOS_WIDTH:1)-1:0] m_awqos,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM AWUSER " *)
 output wire [((C_AWUSER_WIDTH>0)?C_AWUSER_WIDTH:1)-1:0] m_awuser,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM AWVALID " *)
 output wire [((C_AWVALID_WIDTH>0)?C_AWVALID_WIDTH:1)-1:0] m_awvalid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM AWREADY " *)
 input wire [((C_AWREADY_WIDTH>0)?C_AWREADY_WIDTH:1)-1:0] m_awready,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM WID " *)
 output wire [((C_WID_WIDTH>0)?C_WID_WIDTH:1)-1:0] m_wid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM WDATA " *)
 output wire [((C_WDATA_WIDTH>0)?C_WDATA_WIDTH:1)-1:0] m_wdata,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM WSTRB " *)
 output wire [((C_WSTRB_WIDTH>0)?C_WSTRB_WIDTH:1)-1:0] m_wstrb,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM WLAST " *)
 output wire [((C_WLAST_WIDTH>0)?C_WLAST_WIDTH:1)-1:0] m_wlast,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM WUSER " *)
 output wire [((C_WUSER_WIDTH>0)?C_WUSER_WIDTH:1)-1:0] m_wuser,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM WVALID " *)
 output wire [((C_WVALID_WIDTH>0)?C_WVALID_WIDTH:1)-1:0] m_wvalid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM WREADY " *)
 input wire [((C_WREADY_WIDTH>0)?C_WREADY_WIDTH:1)-1:0] m_wready,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM BID " *)
 input wire [((C_BID_WIDTH>0)?C_BID_WIDTH:1)-1:0] m_bid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM BRESP " *)
 input wire [((C_BRESP_WIDTH>0)?C_BRESP_WIDTH:1)-1:0] m_bresp,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM BUSER " *)
 input wire [((C_BUSER_WIDTH>0)?C_BUSER_WIDTH:1)-1:0] m_buser,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM BVALID " *)
 input wire [((C_BVALID_WIDTH>0)?C_BVALID_WIDTH:1)-1:0] m_bvalid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM BREADY " *)
 output wire [((C_BREADY_WIDTH>0)?C_BREADY_WIDTH:1)-1:0] m_bready,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM ARID " *)
 output wire [((C_ARID_WIDTH>0)?C_ARID_WIDTH:1)-1:0] m_arid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM ARADDR " *)
 output wire [((C_ARADDR_WIDTH>0)?C_ARADDR_WIDTH:1)-1:0] m_araddr,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM ARLEN " *)
 output wire [((C_ARLEN_WIDTH>0)?C_ARLEN_WIDTH:1)-1:0] m_arlen,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM ARSIZE " *)
 output wire [((C_ARSIZE_WIDTH>0)?C_ARSIZE_WIDTH:1)-1:0] m_arsize,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM ARBURST " *)
 output wire [((C_ARBURST_WIDTH>0)?C_ARBURST_WIDTH:1)-1:0] m_arburst,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM ARLOCK " *)
 output wire [((C_ARLOCK_WIDTH>0)?C_ARLOCK_WIDTH:1)-1:0] m_arlock,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM ARCACHE " *)
 output wire [((C_ARCACHE_WIDTH>0)?C_ARCACHE_WIDTH:1)-1:0] m_arcache,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM ARPROT " *)
 output wire [((C_ARPROT_WIDTH>0)?C_ARPROT_WIDTH:1)-1:0] m_arprot,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM ARREGION " *)
 output wire [((C_ARREGION_WIDTH>0)?C_ARREGION_WIDTH:1)-1:0] m_arregion,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM ARQOS " *)
 output wire [((C_ARQOS_WIDTH>0)?C_ARQOS_WIDTH:1)-1:0] m_arqos,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM ARUSER " *)
 output wire [((C_ARUSER_WIDTH>0)?C_ARUSER_WIDTH:1)-1:0] m_aruser,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM ARVALID " *)
 output wire [((C_ARVALID_WIDTH>0)?C_ARVALID_WIDTH:1)-1:0] m_arvalid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM ARREADY " *)
 input wire [((C_ARREADY_WIDTH>0)?C_ARREADY_WIDTH:1)-1:0] m_arready,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM RID " *)
 input wire [((C_RID_WIDTH>0)?C_RID_WIDTH:1)-1:0] m_rid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM RDATA " *)
 input wire [((C_RDATA_WIDTH>0)?C_RDATA_WIDTH:1)-1:0] m_rdata,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM RRESP " *)
 input wire [((C_RRESP_WIDTH>0)?C_RRESP_WIDTH:1)-1:0] m_rresp,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM RLAST " *)
 input wire [((C_RLAST_WIDTH>0)?C_RLAST_WIDTH:1)-1:0] m_rlast,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM RUSER " *)
 input wire [((C_RUSER_WIDTH>0)?C_RUSER_WIDTH:1)-1:0] m_ruser,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM RVALID " *)
 input wire [((C_RVALID_WIDTH>0)?C_RVALID_WIDTH:1)-1:0] m_rvalid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXIMM RREADY " *)
 output wire [((C_RREADY_WIDTH>0)?C_RREADY_WIDTH:1)-1:0] m_rready,
input wire preserve_aclk
);
localparam LP_INPUTS_WIDTH =  (C_AWREADY_WIDTH+C_WREADY_WIDTH+C_BID_WIDTH+C_BRESP_WIDTH+C_BUSER_WIDTH+C_BVALID_WIDTH+C_ARREADY_WIDTH+C_RID_WIDTH+C_RDATA_WIDTH+C_RRESP_WIDTH+C_RLAST_WIDTH+C_RUSER_WIDTH+C_RVALID_WIDTH);
localparam LP_SHIFTER_WIDTH = (LP_INPUTS_WIDTH >= 4) ? LP_INPUTS_WIDTH : 4;
(* dont_touch = "true" *) wire shifter_o;
(* dont_touch = "true" *) wire [LP_SHIFTER_WIDTH-1:0] shifter_i;
(* dont_touch = "true" *) reg [LP_SHIFTER_WIDTH-1:0] shifter_d;
assign shifter_i = { m_awready,m_wready,m_bid,m_bresp,m_buser,m_bvalid,m_arready,m_rid,m_rdata,m_rresp,m_rlast,m_ruser,m_rvalid };
always @(posedge preserve_aclk) begin
   if (shifter_d[0] === 1'b1) begin
   	shifter_d <= shifter_i;
   end else begin
   	shifter_d <= {shifter_d[0], shifter_d[1+:(LP_SHIFTER_WIDTH-1)]};
   end
end
assign shifter_o = shifter_d[0];
assign m_awid =     { ((C_AWID_WIDTH     >1)?C_AWID_WIDTH     :1){shifter_o}};
assign m_awaddr =   { ((C_AWADDR_WIDTH   >1)?C_AWADDR_WIDTH   :1){shifter_o}};
assign m_awlen =    { ((C_AWLEN_WIDTH    >1)?C_AWLEN_WIDTH    :1){shifter_o}};
assign m_awsize =   { ((C_AWSIZE_WIDTH   >1)?C_AWSIZE_WIDTH   :1){shifter_o}};
assign m_awburst =  { ((C_AWBURST_WIDTH  >1)?C_AWBURST_WIDTH  :1){shifter_o}};
assign m_awlock =   { ((C_AWLOCK_WIDTH   >1)?C_AWLOCK_WIDTH   :1){shifter_o}};
assign m_awcache =  { ((C_AWCACHE_WIDTH  >1)?C_AWCACHE_WIDTH  :1){shifter_o}};
assign m_awprot =   { ((C_AWPROT_WIDTH   >1)?C_AWPROT_WIDTH   :1){shifter_o}};
assign m_awregion = { ((C_AWREGION_WIDTH >1)?C_AWREGION_WIDTH :1){shifter_o}};
assign m_awqos =    { ((C_AWQOS_WIDTH    >1)?C_AWQOS_WIDTH    :1){shifter_o}};
assign m_awuser =   { ((C_AWUSER_WIDTH   >1)?C_AWUSER_WIDTH   :1){shifter_o}};
assign m_awvalid =  { ((C_AWVALID_WIDTH  >1)?C_AWVALID_WIDTH  :1){shifter_o}};
assign m_wid =      { ((C_WID_WIDTH      >1)?C_WID_WIDTH      :1){shifter_o}};
assign m_wdata =    { ((C_WDATA_WIDTH    >1)?C_WDATA_WIDTH    :1){shifter_o}};
assign m_wstrb =    { ((C_WSTRB_WIDTH    >1)?C_WSTRB_WIDTH    :1){shifter_o}};
assign m_wlast =    { ((C_WLAST_WIDTH    >1)?C_WLAST_WIDTH    :1){shifter_o}};
assign m_wuser =    { ((C_WUSER_WIDTH    >1)?C_WUSER_WIDTH    :1){shifter_o}};
assign m_wvalid =   { ((C_WVALID_WIDTH   >1)?C_WVALID_WIDTH   :1){shifter_o}};
assign m_bready =   { ((C_BREADY_WIDTH   >1)?C_BREADY_WIDTH   :1){shifter_o}};
assign m_arid =     { ((C_ARID_WIDTH     >1)?C_ARID_WIDTH     :1){shifter_o}};
assign m_araddr =   { ((C_ARADDR_WIDTH   >1)?C_ARADDR_WIDTH   :1){shifter_o}};
assign m_arlen =    { ((C_ARLEN_WIDTH    >1)?C_ARLEN_WIDTH    :1){shifter_o}};
assign m_arsize =   { ((C_ARSIZE_WIDTH   >1)?C_ARSIZE_WIDTH   :1){shifter_o}};
assign m_arburst =  { ((C_ARBURST_WIDTH  >1)?C_ARBURST_WIDTH  :1){shifter_o}};
assign m_arlock =   { ((C_ARLOCK_WIDTH   >1)?C_ARLOCK_WIDTH   :1){shifter_o}};
assign m_arcache =  { ((C_ARCACHE_WIDTH  >1)?C_ARCACHE_WIDTH  :1){shifter_o}};
assign m_arprot =   { ((C_ARPROT_WIDTH   >1)?C_ARPROT_WIDTH   :1){shifter_o}};
assign m_arregion = { ((C_ARREGION_WIDTH >1)?C_ARREGION_WIDTH :1){shifter_o}};
assign m_arqos =    { ((C_ARQOS_WIDTH    >1)?C_ARQOS_WIDTH    :1){shifter_o}};
assign m_aruser =   { ((C_ARUSER_WIDTH   >1)?C_ARUSER_WIDTH   :1){shifter_o}};
assign m_arvalid =  { ((C_ARVALID_WIDTH  >1)?C_ARVALID_WIDTH  :1){shifter_o}};
assign m_rready =   { ((C_RREADY_WIDTH   >1)?C_RREADY_WIDTH   :1){shifter_o}};
endmodule
