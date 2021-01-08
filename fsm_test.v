// Test Bench  FSM 
// Created on: 10 DEC. 2017
// Author    : Amir
// Function  : Test Bench for FSM

`timescale 1ns/1ns

module fsm_test;
reg  clk, rst, inp;
wire outp1,outp2;
reg[15:0] sequence;
integer i;

Moore_fsm dut1( .clk(clk), .reset(rst), .w(inp), .z(outp1));
Mealy_fsm dut2( .clk(clk), .reset(rst), .w(inp), .z(outp2));

initial
begin

   clk = 0;
        rst = 1;
        sequence = 16'b0101_0111_0111_0010;
   #5 rst = 0;
   #5 rst = 1;
   $display("Moore Simulation");
   for( i = 0; i <= 15; i = i + 1)
   begin
      inp = sequence[i];
      #2 clk = 1;
      #2 clk = 0;
      $display("State = ", dut1.y, " Input = ", inp, ", Output = ", outp1);
	  
   end
   $display("Mealy Simulation");
   for( i = 0; i <= 15; i = i + 1)
   begin
      inp = sequence[i];
      #2 clk = 1;
      #2 clk = 0;
      $display("State = ", dut1.y, " Input = ", inp, ", Output = ", outp1);
	  
   end
        
        test2;
end
task test2;
   for( i = 0; i <= 15; i = i + 1)
   begin
      inp = $random % 2;
      #2 clk = 1;
      #2 clk = 0;
      $display("State = ", dut.y, " Input = ", inp, ", Output = ", outp);

   end
endtask


endmodule