`timescale 100ns / 1ns
module div(in,num,cin,cout,answer);
defparam su.cla.n =8 ; 
input [(su.cla.n -1):0] in;
input [(su.cla.n -1):0] num;
input cin;
output cout ;
output [(su.cla.n -1):0]answer ;
wire [(su.cla.n -1):0]answer1; 
integer kharejGh,i;
reg [(su.cla.n -1):0] s;

initial begin
 kharejGh = 0 ;
 s = in ;
end

sub su(.in(s),.num(num),.cin(cin),.cout(cout),.answer(answer1));

always @(in , num )
begin
while(s > 0)
begin
 #2 ;
 s = answer1 ;
 kharejGh = kharejGh + 1 ;
end
if (answer1<0)
	kharejGh = kharejGh - 1 ;
       
end
assign answer = kharejGh ;
endmodule
