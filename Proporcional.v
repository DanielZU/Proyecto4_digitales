`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:00:45 05/20/2015 
// Design Name: 
// Module Name:    Proporcional 
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
module Proporcional #(parameter size=13) 
	(
		input wire signed[size-1:0] yk,
		output wire signed[size-1:0] pk
    );

Multiplicador #(size,1) Mult_18 (
    .A(-19'sd18), 
    .B(yk), 
    .Multi(pk)
    );

endmodule
