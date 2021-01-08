module Top (Clk,Rst,cmd_cntr);
input Clk , Rst ;
output reg [15:0] cmd_cntr ;
wire [17:0] Rcmd ;
defparam malu.cla.n = 8 ;
wire cin , ack ;
reg c;
wire [malu.cla.n-1:0] op1 , op2 ;
wire [15:0] alu_out ;
wire [1:0] cmd ;
reg [malu.cla.n-1:0] t1 , t2 ;
reg [1:0]CmdTemp ; 

memory rom (.command(Rcmd));
MyALU malu(.clk(Clk),.cin(cin),.Op1(op1),.Op2(op2),.Cmd(cmd),.Req(Rst),.Alu_Out(alu_out),.Ack(ack)); 
initial begin
  cmd_cntr = 0 ;
  rom.address = 0;
  c = 0;
end
always @(posedge Clk )
 begin
  CmdTemp = Rcmd[17:16] ;
  t1 = Rcmd[15:8] ;
  t2 = Rcmd[7:0] ;
  if (ack == 1)
  cmd_cntr = cmd_cntr + 1;
  else
  cmd_cntr = cmd_cntr ; 
 end
assign op1 = t1;
assign op2 = t2;
assign cmd = CmdTemp ;
assign cin = c ;
endmodule
 

