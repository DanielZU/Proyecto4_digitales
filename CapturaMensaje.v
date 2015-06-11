`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:49:00 04/07/2015 
// Design Name: 
// Module Name:    CapturaMensaje 
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
module CapturaMensaje(
	 input wire clk,
	 input wire rst,
	 input wire EN,
	 input wire data_in,
	 output reg Listo,
	 output reg CS,
	 output wire [15:12] Zeros,
    output wire [11:0] Dato
    );

reg [1:0] act_state, next_state; //Variables de estados del controlador
reg [3:0] cont_act, cont_next; //Registra la cantidad de datos que envia el teclado e india cuantos faltan por tomar
reg [15:0] bus_act, bus_next; 

//BODY


always @ (posedge clk, posedge rst) 
	if(rst) //Reinicia los valores del sistema de la mquina de estados
		begin
			act_state <= 2'b00;
			cont_act <= 4'b0;
			bus_act <= 16'b0;
			
	
		end
	else //Actualiza los valores de la maquina de estados con los actuales declarados en el ciclo anterior
		begin
			act_state <= next_state;
			cont_act <= cont_next;
			bus_act <= bus_next;
		end

//Logica de estado siguiente 
			
always @ (negedge clk )
begin
	//Asigna los valores por defecto para las variables de estado del sistema
	next_state = act_state; 
	Listo = 1'b0;
	cont_next = cont_act;
	bus_next = bus_act;
	CS=1'b1;
	case (act_state) //Analiza el estado actual
		2'b00:
					begin
					CS=1'b1;
					bus_next=16'b0;
					if (EN)
						next_state=2'b01;
					end
		2'b01: //Estado cero
					begin
					CS=1'b0;
					bus_next = {bus_act[14:0],data_in};
					cont_next = 4'b1110; 
					next_state = 2'b10; 
					end
		2'b10: 
					begin
					CS=1'b0;
					bus_next = {bus_act[14:0],data_in}; 
					if (cont_act==0) 
						next_state = 2'b11;
					else 
						cont_next = cont_act - 1'b1;
					end
		2'b11: //Estado que indica que el dato esta listo
			begin
				next_state = 2'b01; //Pasa al estado cero
				CS=1'b1;
				Listo = 1'b1; //Se activa la bandera de que el dato esta listo
			end
		endcase
end

//Salida
assign Dato = bus_act [11:0]; 
assign Zeros = bus_act [15:12]; 	
endmodule
