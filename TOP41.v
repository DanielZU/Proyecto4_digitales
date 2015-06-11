`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:15:51 06/01/2015 
// Design Name: 
// Module Name:    TOP41 
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
module TOP41 #(parameter size=19, parameter n=8)(
    input clk,
    input EN,
    input rst,
	 input [7:0]Ref,
	 input datoin,
    output CS,
	 output Clkmuestreo,
	 output [3:0]Zeros,
	 output [10:0]Basura,
	 output [3:0]Basura2,
    output datoout
    );
	 
wire signed [size-1:0] CIPD;
wire [11:0] CADC;
wire [7:0] C_PWM;
wire [11:0]C_RestaOffset;
wire C_CS;
wire CREN;
wire [10:0]basura;
wire [7:0]RT;

assign C_RestaOffset=CADC-12'd2048;
assign CS=C_CS;
assign C_PWM=CIPD[size-1:size-8];
assign basura=CIPD[size-9:0];
assign Basura=basura;
assign Basura2=C_RestaOffset[3:0];

Reg_n #(8) referencia (
    .In(Ref), 
    .rst(rst), 
    .clk(clk), 
    .EN(EN), 
    .Out(RT)
    );


TOP_PruebaRecepcion ADC(
    .clk(clk),
    .rst(rst),
	 .EN(1'b1),
    .Data_in(datoin),
	 .DatoOut(CADC),
	 .Zeros(Zeros),
	 .clkmodif(Clkmuestreo),
	 .REN(CREN),
	 .CS(C_CS)
    );
	 
I_PD #(size) IPD
	(
		.clk(clk), 
		.rst(rst), 
		.EN(CREN),
		.yk({{9{C_RestaOffset[11]}},C_RestaOffset[11:4],2'b11}), 
		.rk({{9{RT[7]}},RT,2'b11}),
		.pidk(CIPD)
    );
	 
PWMPrueba#(n) Pwm (
    .tau(C_PWM+8'd128),
    .clk(clk),
    .rst(rst),
    .EN(1'b1),
    .PWMout(datoout)
    );


endmodule
