`timescale 10ns/1ns
module Top (Clk,Rst,enb,cmd_cntr);
defparam malu.cla.n = 8 ;
input Clk , Rst ,enb;
output reg [15:0] cmd_cntr ;

reg [malu.cla.n-1:0] op1 , op2 ;
wire [15:0] alu_out ;
reg [1:0] cmd ;
wire [17:0] Rcmd ;
reg cin ; 
wire ack ;
 

initial begin
  cmd_cntr = 0 ;
  rom.address = 1;
  cin = 0;
end

memory rom (.clk(Clk),.command(Rcmd));
MyALU malu(.clk(Clk),.cin(cin),.Op1(op1),.Op2(op2),.Cmd(cmd),.Req(enb),.Alu_Out(alu_out),.Ack(ack)); 

always @(posedge Clk )
 begin
 if (Rst==0)
  begin
   cmd_cntr = 0 ;
   rom.address = 0;
  end
  else 
  begin
#1;
  cmd = Rcmd[17:16] ;
  op1 = Rcmd[15:8] ;
  op2 = Rcmd[7:0] ;
   #1;
$display ("op1 = %b , op2 = %b , cmd = %b , ack = %b , alu_out = %b , address = %d",op1 , op2 , cmd , ack , alu_out , rom.address-1);
  wait (ack == 1);
   cmd_cntr = cmd_cntr + 1;
   $display ("ack 1 shod :))))") ;
 end
 end

endmodule
 

