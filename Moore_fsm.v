// Moore-Type  FSM 
// Created on: 10 DEC. 2017
// Author    : Amir
// Function  : Detect 110 or 101 with overlap

module Moore_fsm(clk, reset, w, z );

input clk, reset, w;
output z;

// States variables
reg [2:0] y , Y;

// State assignments
localparam A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101; 

//Define "Next state" combinantioal logic

always @(y,w) begin

 case (y)
 
 A: if (w) Y = B;
    else   Y = A;
 B: if (w) Y = C;
    else   Y = E;
 C: if (w) Y = C;
    else   Y = D;
 D: if (w) Y = F;
    else   Y = A;
 E: if (w) Y = F;
    else   Y = A;
 F: if (w) Y = C;
    else   Y = E;
  default:  Y = 3'bxxx;
 endcase 
end 
//Define "State update" Sequential logic
always @(negedge reset, posedge clk)
if (!reset) y <= A;
else y<=Y;

assign z= (y==D | y ==F)? 1 :0 ; 

endmodule	

