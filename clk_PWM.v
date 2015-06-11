`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:16:13 05/23/2015 
// Design Name: 
// Module Name:    clk_PWM 
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
module clk_PWM(
   	input wire clk, rst, 
	   output wire pwmclk
);

reg[5:0] c_pwmclk, c_pwmclk_next;

always@(posedge clk, posedge rst)
begin
	if(rst)
		c_pwmclk <= 6'b0;
	else
		c_pwmclk <= c_pwmclk_next;
end

always@*
begin
	c_pwmclk_next = (c_pwmclk==6'd39)? 6'b0 : c_pwmclk + 1'b1;
end
assign pwmclk = (c_pwmclk==6'd39);

endmodule
