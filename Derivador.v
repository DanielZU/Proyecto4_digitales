`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:06:10 05/20/2015 
// Design Name: 
// Module Name:    Derivador 
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
module Derivador #(parameter size=19)
	(
		input wire clk, rst, EN,
		input wire signed [size-1:0] yk,
		output wire signed [size-1:0] dk
    );
wire signed[size-1:0] NEG_yk;
wire signed[size-1:0] yk_yk1, yk1;

assign NEG_yk=-yk;

Reg_n #(size) Registro_yk1 (
    .In(NEG_yk), 
    .rst(rst), 
    .clk(clk), 
    .EN(EN), 
    .Out(yk1)
    );

Sumador #(size,1) Suma1
	(
		.A(yk),
		.B(yk1),
		.D(yk_yk1) 
    );
	 
Multiplicador #(size,1) Mult_150 (
    .A(-19'sd150), 
    .B(yk_yk1), 
    .Multi(dk)
    );
	 
endmodule
