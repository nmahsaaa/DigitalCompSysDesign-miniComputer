// Moore-Type  FSM 
// Created on: 10 DEC. 2017
// Author    : Amir
// Function  : Detect 110 or 101 with overlap

module Mealy_fsm(clk, reset, w, z );

input clk, reset, w;
output reg z;

// States variables
reg [2:0] y , Y;

// State assignments
localparam A = 3'b00, B = 3'b01, C = 3'b10, D = 3'b11; 

//Define "Next state" combinantioal logic

always @(y,w) begin

 case (y)
 
 A: if (w) begin 
       Y = B; z = 0; end
    else   begin 
	   Y = A; z = 0; end
 B: if (w) begin 
       Y = C; z = 0; end
    else   begin  
	   Y = D; z = 0; end
 C: if (w) begin 
       Y = C; z = 1; end
    else   begin 
	   Y = D; z = 1; end
 D: if (w) begin 
       Y = B; z = 0; end
    else   begin 
	   Y = A; z = 0; end
 endcase 
end 
//Define "State update" Sequential logic
always @(negedge reset, posedge clk)
if (!reset) y <= A;
else y<=Y;


endmodule	

