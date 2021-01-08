`timescale 10ns / 1ns 
module MyALU2 (clk,cin,Op1,Op2,Cmd,Req,Alu_Out,Ack);
defparam cla.n = 8 ; 
input clk;
input [(cla.n -1):0] Op1 , Op2;
input cin;
input [1:0] Cmd ;
input Req ;
output [15 : 0] Alu_Out ;
output reg Ack ; 
wire [15 : 0] Alu_Out1 ;
wire [15 : 0] Alu_Out2 ;
wire [15 : 0] Alu_Out3 ;
wire [15 : 0] Alu_Out4 ;
reg [15 : 0] o ;
wire cout ; 
 CLA_Adder cla(.a(Op1),.b(Op2),.cin(cin),.sum(Alu_Out1),.cout(cout));
 mult m(.in(Op1),.num(Op2),.cin(cin),.result(Alu_Out2),.cout(cout));
 div d(.in(Op1),.num(Op2),.cin(cin),.cout(cout),.answer(Alu_Out3));
 sub s(.in(Op1),.num(Op2),.cin(cin),.cout(cout),.answer(Alu_Out4));
 
always @(posedge clk)
 begin
 if (Req == 0)
   begin
    wait(Req == 1);
    case (Cmd) 
      2'b00 : o <= Alu_Out1 ;
      2'b01 : o <= Alu_Out4 ;
      2'b10 : o <= Alu_Out2 ;
      2'b11 : o <= Alu_Out3 ;
    endcase 
    Ack <= 1'b1;
    #1;
    Ack <= 1'b0 ;
   end
 else 
   begin
    wait(Req == 0);
    wait(Req == 1);
    case (Cmd) 
      2'b00 : o <= Alu_Out1 ;
      2'b01 : o <= Alu_Out4 ;
      2'b10 : o <= Alu_Out2 ;
      2'b11 : o <= Alu_Out3 ;
    endcase 
    Ack <= 1'b1;
    #1;
    Ack <= 1'b0 ;
   end

 end
assign Alu_Out = o;
endmodule