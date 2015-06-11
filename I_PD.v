`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:15:52 05/20/2015 
// Design Name: 
// Module Name:    I_PD 
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
module I_PD #(parameter size=19) 
	(
		input wire clk, rst, EN,
		input wire signed [size-1:0] yk, rk,
		output wire signed[size-1:0] pidk
    );

wire signed[size-1:0] dk, ik, pk, ik_pk,Cpidk;

Derivador #(size) Derivador_k (
    .clk(clk), 
    .rst(rst), 
    .EN(EN), 
    .yk(yk), 
    .dk(dk)
    );

Integrador #(size) Integrador_k (
    .clk(clk), 
    .rst(rst), 
    .EN(EN), 
    .yk(yk), 
    .rk(rk), 
    .ik(ik)
    );

Proporcional #(size) Proporcional_k (
    .yk(yk), 
    .pk(pk)
    );

Sumador #(size,1) Restador_ik_pk (
    .A(dk), 
    .B(pk), 
    .D(ik_pk)
    );
	 
Sumador #(size,1) Restador_pidk (
    .A(ik_pk), 
    .B(ik), 
    .D(Cpidk)
    );
Reg_n #(size) Registro_salida (
    .In(Cpidk), 
    .rst(rst), 
    .clk(clk), 
    .EN(EN), 
    .Out(pidk)
    );

endmodule
