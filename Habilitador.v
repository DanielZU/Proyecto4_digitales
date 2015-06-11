`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:00:59 06/02/2015 
// Design Name: 
// Module Name:    Habilitador 
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
module Habilitador(
		input wire clk, EN, rst,
		input wire CS,
		output reg Hab
    );

reg [7:0] filtro_act;
wire [7:0] filtro_next; 
reg CS_act; 
wire CS_next;
wire fall_edge;
reg [1:0] state_act, state_next,cont_act,cont_next; 

always @ (posedge clk, posedge rst)
	if (rst)
		begin
			filtro_act <= 8'b0;
			CS_act <= 1'b0;
		end
	else
		begin 
			filtro_act <= filtro_next;
			CS_act <= CS_next;
		end

assign filtro_next = {CS, filtro_act[7:1]};
assign CS_next = (filtro_act == 8'hff) ? 1'b1 :
						(filtro_act==8'h00) ? 1'b0 :
						CS_act;
assign fall_edge = ~(CS_act) & CS_next;

always @ (posedge clk, posedge rst)
begin
	if (rst)
		begin
			state_act <= 2'b0;
			cont_act <= 2'b0;
		end
	else
		begin
			state_act <= state_next;
			cont_act <= cont_next;
		end
end

always @ *
begin 
	state_next = state_act;
	Hab = 1'b0;
	cont_next = cont_act;
	case (state_act)
		2'b00: begin
				if (fall_edge && EN)
					state_next = 2'b01;
					cont_next = 2'b10;
			end
		2'b01: begin
				Hab = 1'b0;
				if (cont_act==2'b0)
					state_next = 2'b10;
				else
					cont_next = cont_act-1'b1;
			end
		2'b10: begin 
				Hab = 1'b1;
				state_next = 2'b00;
				end
	endcase
end	
	
endmodule

