`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:55:29 05/20/2015 
// Design Name: 
// Module Name:    Integrador 
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
module Integrador #(parameter size=19)
	(
		input wire clk, rst, EN,
		input wire signed [size-1:0] yk, rk,
		output signed [size-1:0] ik
    );

wire signed [size-1:0] ek, ek_7, ik1;
wire signed[size-1:0] NEG_yk;

assign NEG_yk=-yk;

Sumador #(size,1) Error (
    .A(rk), 
    .B(NEG_yk), 
    .D(ek)
    );

Multiplicador #(size,1) Mult_7 (
    .A(19'd7), 
    .B(ek), 
    .Multi(ek_7)
    );

Sumador #(size,1) Suma_ik1 (
    .A(ek_7), 
    .B(ik1), 
    .D(ik)
    );

Reg_n #(size) Registro_ik1 (
    .In(ik), 
    .rst(rst), 
    .clk(clk), 
    .EN(EN), 
    .Out(ik1)
    );

endmodule
