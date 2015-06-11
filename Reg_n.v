`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:04:33 04/27/2015 
// Design Name: 
// Module Name:    Reg_n 
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
module Reg_n# (parameter size=19)
	(
		input wire [size-1:0] In,
		input wire rst, clk, EN,
		output wire [size-1:0] Out
    );

reg [size-1:0] Reg;

//initial begin Reg={size{1'b0}}; end

//BODY
always @(posedge clk , posedge rst)
begin
	if (rst) begin     //si se activa el rst todas las entradas se inicializan
		Reg <= {size{1'b0}};
	end
	else if (EN) begin    //sino el enable de la maquina de estados activa la lectura de          //las diferentes entradas
		Reg <= In;
	end
end

assign Out=Reg;

endmodule
