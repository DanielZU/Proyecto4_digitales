`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:18:03 04/08/2015 
// Design Name: 
// Module Name:    TOP_PruebaRecepcion 
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
module TOP_PruebaRecepcion(
    input clk,
    input rst,
	 input EN,
    input Data_in,
	 output wire [11:0] DatoOut,
	 output wire[3:0]Zeros,
	 output clkmodif,
	 output REN,
	 output CS
    );
	 
wire [11:0] Dato;
wire listo;
wire clkdiv;
wire [11:0]datoL;	
wire CCS;
wire CCS2;

assign clkmodif=clkdiv;
assign CS=CCS;
assign CCS2=CCS;

clk_adc clkadc(
   	.clk(clk), 
		.rst(rst), 
	   .adcclk(clkdiv)
		);
		
Habilitador Hab(
		.clk(clk), 
		.EN(EN), 
		.rst(rst),
		.CS(CCS2),
		.Hab(REN)
    );
 
CapturaMensaje Captura(
	 .clk(clkdiv),
	 .rst(rst),
	 .EN(EN),
	 .data_in(Data_in),
	 .Listo(listo),
	 .CS(CCS),
	 .Zeros(Zeros),
	 .Dato(Dato)
    );

Registro DatoL(
    .dato_in(Dato),
	 .EN(listo),
    .rst(rst),
    .clk(clk),
    .dato_out(DatoOut)
    );
//RestadorEntrada Resta(
//    .Datoin(datoL),
//    .D(DatoOut)
///    );


endmodule
