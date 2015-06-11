`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:31:14 06/01/2015 
// Design Name: 
// Module Name:    clk_adc 
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
module clk_adc(
   	input wire clk, rst, 
	   output wire adcclk
);

reg[14:0] c_adcclk, c_adcclk_next;

always@(posedge clk, posedge rst)
begin
	if(rst)
		c_adcclk <= 15'b0;
	else
		c_adcclk <= c_adcclk_next;
end

always@*
begin
	c_adcclk_next = (c_adcclk==15'd29405)? 15'b0 : c_adcclk + 1'b1;
end
assign adcclk = (c_adcclk==15'd29405);

endmodule
