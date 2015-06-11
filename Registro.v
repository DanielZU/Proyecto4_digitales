`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:25:41 04/08/2015 
// Design Name: 
// Module Name:    Registro 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Registro(
    input wire [11:0] dato_in,
	 input wire EN,
    input wire rst,
    input wire clk,
    output reg[11:0] dato_out
    );
always @ (posedge clk, posedge rst)
	if (rst)
		dato_out <= 12'h800;
	else if (EN)
		dato_out <= dato_in;

endmodule
