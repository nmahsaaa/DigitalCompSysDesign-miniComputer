module sub(in,num,cin,cout,answer);
defparam cla1.n = 8 ;
defparam cla.n = 8 ; 
//parameter n=8;
input [(cla.n - 1):0] in;
input [(cla.n - 1):0] num;
input cin;
output cout ;
output [(cla.n - 1):0] answer;
reg [(cla.n - 1):0] negnum;
reg [(cla.n - 1):0] f;
wire [(cla.n - 1):0] result , result1;
wire cout1;
integer i ;

initial begin
negnum = num ;
for (i=0;i<cla.n;i=i+1)
	negnum[i] = ~ negnum[i];
f = negnum ;
negnum = result1 ; 
end

CLA_Adder cla1(.a(8'b00000001),.b(f),.cin(cin),.sum(result1),.cout(cout1));
CLA_Adder cla(.a(in),.b(result1),.cin(cin),.sum(result),.cout(cout));

assign answer = result ; 

endmodule 
