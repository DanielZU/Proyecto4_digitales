`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:01:59 04/27/2015 
// Design Name: 
// Module Name:    Sumador 
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
module Sumador #(parameter size=22, parameter sign=1)
	(
		input wire signed [size-1:0] A,B,
		output wire signed [size-1:0] D
    );

reg signed [size-1:0] R;

always @ *
begin
	R=A+B;
	if(A[size-1]==1'b0 && B[size-1]==1'b0 && R[size-1]==1'b1) begin
		R={{sign{1'b0}},{(size-1){1'b1}}}; end
	else if (A[size-1]==1'b1 && B[size-1]==1'b1 && R[size-1]==1'b0) begin
		R={{sign{1'b1}},{(size-1){1'b0}}}; end
end

assign D=R;

//always @ (posedge clk,posedge rst)
//begin
//	if(rst)
//		D = {size{1'b0}};
//	else
//		D=R;
//end

endmodule