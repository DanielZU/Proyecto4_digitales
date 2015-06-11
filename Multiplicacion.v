`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:29:07 03/31/2015 
// Design Name: 
// Module Name:    Multiplicacion 
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
module Multiplicador #(parameter size=22, parameter sign=1)
	(
		input wire signed [size-1:0] A, B,
		output wire signed [size-1:0] Multi 
    );
	 
reg signed[size*2-1:0] Multg;

always @ *
begin
	Multg=A*B;
	if (A=={size{1'b0}} | B=={size{1'b0}})
		Multg={(size*2){1'b0}};
	else
	begin
		if(A[size-1]==B[size-1]) 
		begin
			if(|Multg[size*2-1:size])
				Multg[size-1:0]={1'b0,{(size-1){1'b1}}};
		end
		else 
		begin
			if(~&Multg[size*2-1:size])
				Multg[size-1:0]={1'b1,{(size-1){1'b0}}};
		end
	end
end

assign Multi=Multg[size-1:0];

//always @ (posedge clk)
//begin
//	Multi<=Multg[size*2-sign*2-mag:pf];
//end

endmodule
