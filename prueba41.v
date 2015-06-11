`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:20:24 06/01/2015
// Design Name:   TOP41
// Module Name:   /home/daniel/Proyecto41/prueba41.v
// Project Name:  Proyecto41
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TOP41
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module prueba41;

	// Inputs
	reg clk;
	reg EN;
	reg rst;
	reg [7:0] RT;
	reg datoin;

	// Outputs
	wire CS;
	wire Clkmuestreo;
	wire [3:0] Zeros;
	wire [10:0]Basura;
	wire datoout;

	// Instantiate the Unit Under Test (UUT)
	TOP41 uut (
		.clk(clk), 
		.EN(EN), 
		.rst(rst), 
		.RT(RT), 
		.datoin(datoin), 
		.CS(CS), 
		.Clkmuestreo(Clkmuestreo),
		.Zeros(Zeros),
		.Basura(Basura),		
		.datoout(datoout)
	);
	
	integer k,j,z,i;
	reg [0:11] Datos[0:200];
	reg [15:0] aux;
   initial forever #10 clk=~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		EN = 0;
		rst = 1;
		RT = 8'h80;
		datoin = 0;
		repeat(10) @(posedge clk);
		rst = 0;
		EN = 1;
	end 
	
   initial begin
	$readmemb("test_pid.txt", Datos); // se leen los datos en el .txt y se guardan en el arreglo
	//z=$fopen("output.txt","w");     //se abre el archivo destino de los datos de salida
	@(negedge rst);
	for (j=0;j<200;j=j+1) begin
			@(negedge CS)
			aux={4'b0,Datos[j]};
			for(i=15;i>-1;i=i-1)
				begin
				datoin=aux[i];
				@(posedge Clkmuestreo);
				end
		end		
	//$fclose(z); // necesario cerrar el archivo destino
	$stop;
	end
      
endmodule
