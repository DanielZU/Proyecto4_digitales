`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:01:37 05/21/2015 
// Design Name: 
// Module Name:    PWM 
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
module PWM #(parameter n = 8) 
	(
		input clk, rst, EN,   
      input [n-1:0] tau,    
      output reg PWM_out
	); 

reg [n-1:0] counter;
   	
always@ (posedge clk or posedge rst)
begin
if(rst)
begin
	PWM_out <= 1'b0;
	counter <= 1'b0;
end
else if (EN)
begin
	if ( counter <= tau )
	PWM_out <= 1'b1;
	else
		PWM_out <= 1'b0;
	counter <= counter+1'b1;
end
end

endmodule
