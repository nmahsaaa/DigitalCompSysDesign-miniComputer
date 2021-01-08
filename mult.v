`timescale 100ns / 1ns
module mult(in,num,cin,result,cout);
defparam cla.n = 8 ; 
//parameter n=8;
input [(cla.n - 1):0] in;
input [(cla.n - 1):0] num;
input cin;
output reg[(2*(cla.n) - 1):0] result;
output cout;
reg [(cla.n - 1):0] i;
wire [(2*(cla.n) - 1):0] result1;
reg [(2*(cla.n) - 1):0] s;

initial begin
s=0;
end
CLA_Adder cla(.a(in),.b(s),.cin(cin),.sum(result1),.cout(cout));

always @(in , num)
begin
 for(i=0;i<num;i=i+1)
  begin
    #2;
    s = result1 ; 
  end  
result = s;     
end
endmodule
